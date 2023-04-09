from pydantic import BaseModel
from datetime import datetime


class Log(BaseModel):
    sessionID: str
    description: str


def LogEntity(item) -> dict:
    return {
        "logID": item[0],
        "sessionID": item[1],
        "createAt": item[2],
        "description": item[3],
    }


def LogsEntity(entity) -> list:
    return [LogEntity(item) for item in entity]
