from fastapi import APIRouter, status
from fastapi.responses import ORJSONResponse
from config.db import conn
from models.index import logs
from schemas.index import Log
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
    return conn.execute(logs.select()).fetchall()


"""
Add new log
"""


@logger.post('')
async def add_log(log: Log):
    now = datetime.datetime.now()
    conn.execute(logs.insert().values(
        SessionID=log.SessionID,
        createAt=now.strftime("%Y-%m-%d %H:%M:%S"),
        description=log.description
    ))
    return ORJSONResponse('CREATED', status_code=status.HTTP_201_CREATED)

"""
Create new report and return `SessionID`
"""


@logger.get('/init')
async def init():
    session_id = uuid.uuid4().hex
    return ORJSONResponse(session_id, status_code=status.HTTP_200_OK)

"""
Get logs by SessionID
"""


@logger.get('/{session}')
async def get_logs_by_session(session: str):
    data = conn.execute(logs.select().where(
        logs.l.SessionID == session)).fetchall()
    return ORJSONResponse(data, status_code=status.HTTP_200_OK)
