from sqlalchemy import Table, Column
from sqlalchemy.sql.sqltypes import Integer, String, DateTime
from config.db import meta

attackers = Table(
    'Attacker', meta,
    Column('attackerID', Integer, primary_key=True),
    Column('ip', String(15)),
    Column('location', String)
)
