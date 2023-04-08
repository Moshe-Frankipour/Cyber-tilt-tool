from pydantic import BaseModel
from datetime import datetime


class Log(BaseModel):
    SessionID: str
    description: str
