from datetime import datetime
from pydantic import BaseModel


class AttackerDTO(BaseModel):
    ip: str
    location: str
