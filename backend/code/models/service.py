from sqlalchemy import Table, Column, ForeignKey
from sqlalchemy.sql.sqltypes import Integer, String, DateTime, Boolean, Date
from config.db import meta
from pydantic import BaseModel
from sqlalchemy.orm import relationship

service = Table(
    'Service', meta,
    Column('serviceID', Integer, primary_key=True),
    Column('name', String(25)),
    Column('description', String)
)
