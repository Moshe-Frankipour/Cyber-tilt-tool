from fastapi import APIRouter, status, Depends
from fastapi.responses import ORJSONResponse, JSONResponse
from config.db import conn
from schemas.index import ReportsEntity
from .auth import cookie
from auth.SessionData import SessionData
from .auth import verifier
from models.index import reports, companies_Services, attackers, traps, companies

report = APIRouter(
    prefix="/api/report",
    tags=["Report"],
    default_response_class=ORJSONResponse
)

@report.get("", dependencies=[Depends(cookie)])
async def get_all(session_data: SessionData = Depends(verifier)):
    if session_data is None:
        return ORJSONResponse("UNAUTHORIZED", status_code=status.HTTP_401_UNAUTHORIZED)
    q = reports.join(companies_Services)
    q = q.join(attackers).join(traps).join(companies)
    if session_data.isSysAdmin:
        data = conn.execute(q.select()).fetchall()
    else:
        data = conn.execute(q.select().where(companies.c.companyID == session_data.companyID)).fetchall()
    res = ReportsEntity(data)
    res.sort(key=sorted)

    return ORJSONResponse(res, status_code=status.HTTP_200_OK)

def sorted(e):
    return e['reportID']
