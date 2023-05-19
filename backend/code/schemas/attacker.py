
from pydantic import BaseModel
from datetime import datetime


class Attacker(BaseModel):
    AttackerID: int
    ip: str
    location: str


def AttackerEntity(item) -> Attacker:
    return Attacker(
        AttackerID=int(item[0]),
        ip=item[1],
        location=item[2]
    )


def AttackersEntity(entity) -> list:
    return [AttackerEntity(item) for item in entity]
