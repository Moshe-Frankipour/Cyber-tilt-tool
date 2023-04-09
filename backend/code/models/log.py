from sqlalchemy import Table, Column
from sqlalchemy.sql.sqltypes import Integer, String, DateTime
from config.db import meta

logs = Table(
    'Log', meta,
    Column('logID', Integer, primary_key=True),
    Column('sessionID', String(32)),
    Column('createAt', DateTime),
    Column('description', String),
)
