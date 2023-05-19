from fastapi import APIRouter, status, Depends
from fastapi.responses import ORJSONResponse, JSONResponse
from config.db import conn
from models.index import reports
from schemas.index import ReportsEntity, hash
from .auth import cookie
from auth.SessionData import SessionData
from .auth import verifier
import re
import config.common
from dto.user import UserDTO

user = APIRouter(
    prefix="/api/user",
    tags=["User"],
    default_response_class=ORJSONResponse
)
config_ = config.common.load_config()


@user.get('/getReports', dependencies=[Depends(cookie)])
async def getReports(session_data: SessionData = Depends(verifier)):
    data = conn.execute(reports.select().where(
        reports.c.companyID == session_data.companyID))
    return ORJSONResponse(ReportsEntity(data), status_code=status.HTTP_200_OK)


@user.post('/api/register')
async def register(user: UserDTO):
    is_match = re.fullmatch(config_['regex_password'], user.password)
    if not is_match:
        return JSONResponse(status_code=status.HTTP_400_BAD_REQUEST,
                            content="The password must include:\nAt least 10 characters \n any of the special characters: @#$%^&+=! \n numbers: 0-9 \n lowercase letters: a-z \n uppercase letters: A-Z")
    # TODO
    user.password = hash(user.password)
    return JSONResponse(status_code=status.HTTP_201_CREATED, content="")
