from fastapi import APIRouter, status, HTTPException, Depends, Request
from config.db import conn
from hashlib import sha1
from datetime import datetime, timedelta
import secrets
import smtplib
import os
from fastapi.responses import JSONResponse
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from models.user import loginUser
from schemas.user import validate_password
from fastapi_sessions.backends.implementations import InMemoryBackend
from fastapi_sessions.frontends.implementations import SessionCookie, CookieParameters
from auth.BasicVerifier import BasicVerifier
from auth.SessionData import SessionData
from uuid import UUID, uuid4
import config.common
from schemas.user import UserEntity

auth = APIRouter(
    prefix="/api/auth",
    tags=["Auth"],
)

cookie_params = CookieParameters()
cookie = SessionCookie(
    cookie_name="cookie",
    identifier="general_verifier",
    auto_error=False,
    secret_key="MosheTomerPeri",
    cookie_params=cookie_params,
)
backend = InMemoryBackend[UUID, SessionData]()
verifier = BasicVerifier(
    identifier="general_verifier",
    auto_error=True,
    backend=backend,
    auth_http_exception=HTTPException(
        status_code=403, detail="invalid session"),
)


@auth.post("/login")
async def login(user: loginUser):
    # Get User from DB
    mycursor = conn.cursor()
    sql = "SELECT * FROM User WHERE email = %s"
    val = (user.email, )
    mycursor.execute(sql, val)
    data = mycursor.fetchall()
    if len(data) == 0:
        return JSONResponse("Invalid User!", status_code=status.HTTP_401_UNAUTHORIZED)
    user_entity = UserEntity(data[0])
    #password_attempts = int(user_db[5])
    #config_ = config.common.load_config()
    # if not user_entity.isActive or password_attempts >= int(config_['password_try']):
    #    return JSONResponse("Too many attempts, the user is blocked", status_code=status.HTTP_403_FORBIDDEN)

    is_successfull = validate_password(user.password, user_entity.password)

    if is_successfull:
        response = JSONResponse("Welcome :)", status_code=status.HTTP_200_OK)
        session = uuid4()
        companyName = ''  # TODO: get name by ID `companyID`
        sessionData = SessionData(
            username=user_entity.username,
            email=user.email,
            companyName=companyName,
            companyID=user_entity.companyID,
            fullName=user_entity.fullName,
            isSysAdmin=user_entity.isSysAdmin,
            isCompanyAdmin=user_entity.isCompanyAdmin
        )
        await backend.create(session, sessionData)
        cookie.attach_to_response(response, session)
        # reset_password_attempts(user.email)
        return response
    else:
        response = JSONResponse(
            "Invalid User!", status_code=status.HTTP_401_UNAUTHORIZED)
        #plus_password_attempts(user.email, password_attempts)
        return response


@auth.get("/whoami", dependencies=[Depends(cookie)])
async def whoami(session_data: SessionData = Depends(verifier)):
    return session_data


@auth.post("/logout")
async def del_session(session_id: UUID = Depends(cookie)):
    response = JSONResponse({}, status_code=status.HTTP_200_OK)
    response.delete_cookie("cookie")
    return response


@auth.get('/sendMail')
def send_mail(email: str):

    # crate token
    random_value = secrets.token_hex(16)
    token = sha1(random_value.encode()).hexdigest()

    # expired
    expired = datetime.now() + timedelta(minutes=15)
    expired = expired.strftime('%Y-%m-%d %H:%M:%S')

    # save in DB
    mycursor = conn.cursor()
    sql = "INSERT INTO Token (email, token, expired) VALUES (%s, %s, %s)"
    val = (email, token, expired)
    mycursor.execute(sql, val)
    conn.commit()

    # send mail
    EMAIL_USER = os.environ.get('EMAIL_USER')
    EMAIL_PASS = os.environ.get('EMAIL_PASS')

    # Setup the MIME
    message = MIMEMultipart()
    message['From'] = EMAIL_USER
    message['To'] = email
    message['Subject'] = 'Change password'
    message.attach(
        MIMEText(f"Your token for change password: {token}", 'plain'))

    with smtplib.SMTP_SSL("smtp.gmail.com", 465) as server:
        server.login(EMAIL_USER, EMAIL_PASS)
        server.sendmail(EMAIL_USER, [email], message.as_string())
    return JSONResponse("Sent", status_code=status.HTTP_202_ACCEPTED)


def reset_password_attempts(email: str):
    mycursor = conn.cursor()
    sql = "UPDATE User SET password_attempts = 0 WHERE email = %s"
    val = (email,)
    mycursor.execute(sql, val)
    conn.commit()


def plus_password_attempts(email: str, password_attempts: int):
    password_attempts = password_attempts + 1
    mycursor = conn.cursor()
    sql = "UPDATE User SET password_attempts = %s WHERE email = %s"
    val = (password_attempts, email)
    mycursor.execute(sql, val)
    conn.commit()
