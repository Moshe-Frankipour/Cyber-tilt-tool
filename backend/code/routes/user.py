from fastapi import APIRouter, status
from fastapi.responses import ORJSONResponse
from config.db import conn
from models.index import reports, users
from schemas.index import Report, ReportEntity, ReportsEntity, LogIn, User

user = APIRouter(
    prefix="/api/user",
    tags=["User"],
    default_response_class=ORJSONResponse
)


@user.post('login')
async def login(login: LogIn):
    # set cookies
    return ORJSONResponse(login, status_code=status.HTTP_202_ACCEPTED)


@user.get('getReports')
async def getReports():
    # get user by cookies
    cookies = {
        'companyID': 3,
        'service': [1, 2, 3]
    }

    data = conn.execute(reports.select().where(
        reports.c.companyID == cookies.companyID and
        reports.c.serviceID in cookies.service))
    return ORJSONResponse(ReportsEntity(data), status_code=status.HTTP_200_OK)
