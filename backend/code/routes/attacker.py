from fastapi import APIRouter
from fastapi.responses import ORJSONResponse
from config.db import conn
from models.attacker import attackers
from schemas.index import AttackerEntity
from dto.attacker import AttackerDTO

# TODO: imp auth
attacker = APIRouter(
    prefix="/api/attacker",
    tags=["Attacker"],
    default_response_class=ORJSONResponse
)


@attacker.get('{id}')
async def get_attacker_by_id(id: int):
    att = conn.execute(attackers.select().where(
        attackers.c.attackerID == id)).fetchone()
    return AttackerEntity(att)


@attacker.get('/ip/{ip}')
async def get_attacker_by_ip(ip: str):
    att = conn.execute(attackers.select().where(
        attackers.c.ip == ip)).fetchone()
    return AttackerEntity(att)


@attacker.post()
async def add_attacker(attackerDTO: AttackerDTO):
    conn.execute(attackers.insert(attackerDTO))
    return ORJSONResponse(content="Created", status=201)
