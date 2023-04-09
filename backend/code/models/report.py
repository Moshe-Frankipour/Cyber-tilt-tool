from sqlalchemy import Table, Column
from sqlalchemy.sql.sqltypes import Integer, String, DateTime
from config.db import meta

reports = Table(
    'Report', meta,
    Column('reportID', Integer, primary_key=True),
    Column('serviceID', Integer),
    Column('createAt', DateTime),
    Column('companyID', Integer),
    Column('attackerID', Integer),
    Column('trapID', Integer),
    Column('sessionLogID', String(32)),
)
