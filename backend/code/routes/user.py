from fastapi import APIRouter, status
from fastapi.responses import ORJSONResponse
from config.db import conn
from models.index import logs, reports
from schemas.index import Log, LogsEntity, LogEntity, Report, ReportEntity, ReportsEntity

user = APIRouter(
    prefix="/api/user",
    tags=["User"],
    default_response_class=ORJSONResponse
)


@user.post('login')
async def login():
    return {}


@user.get('getReports')
async def getReports():
    companyID = 1
    serviceID = 1
    data = conn.execute(reports.select().where(
        reports.c.companyID == companyID and
        reports.c.serviceID == serviceID))
    return ORJSONResponse(data, status_code=status.HTTP_200_OK)
