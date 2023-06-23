from fastapi import APIRouter, status
from fastapi.responses import ORJSONResponse
from config.db import conn
from models.index import logs, reports, attackers
from schemas.index import Log, LogsEntity, LogEntity, Report, ReportEntity, ReportsEntity
from datetime import datetime
import uuid

# TODO: imp auth
logger = APIRouter(
    prefix="/api/log",
    tags=["Logger"],
    default_response_class=ORJSONResponse
)

"""
Test
"""


@logger.get('test')
async def test():
    data = conn.execute(logs.select()).fetchall()
    return LogsEntity(data)


"""
Add new log
"""


@logger.post('')
async def add_log(log: Log):
    now = datetime.now()
    conn.execute(logs.insert().values(
        sessionID=log.sessionID,
        createAt=now.strftime("%Y-%m-%d %H:%M:%S"),
        description=log.description
    ))
    conn.commit()
    return ORJSONResponse('CREATED', status_code=status.HTTP_201_CREATED)

"""
Create new report and return `SessionID`
"""


@logger.post('/init')
async def init(report: Report):
    attacker = conn.execute(attackers.select().where(
        attackers.c.ip == report.attackerIP
    )).fetchone()
    if attacker is None:
        attacker = conn.execute(attackers.insert().select(
            attackers.c.ip == report.attackerIP
        ))
    session_id = uuid.uuid4().hex
    now = datetime.now()
    conn.execute(reports.insert().values(
        serviceID=report.serviceID,
        companyID=report.companyID,
        attackerID=attacker.attackerID,
        trapID=report.trapID,
        sessionLogID=session_id,
        createAt=now.strftime("%Y-%m-%d %H:%M:%S"),
    ))
    conn.commit()
    return ORJSONResponse(session_id, status_code=status.HTTP_201_CREATED)

"""
Get logs by SessionID
"""


@logger.get('/{session}')
async def get_logs_by_session(session: str):
    query = logs.select().where(
        logs.c.sessionID == session)
    data = conn.execute(query).fetchall()
    return ORJSONResponse(LogsEntity(data), status_code=status.HTTP_200_OK)
