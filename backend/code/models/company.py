from sqlalchemy import Table, Column, ForeignKey
from sqlalchemy.sql.sqltypes import Integer, String, DateTime, Boolean, Date
from config.db import meta
from pydantic import BaseModel
from sqlalchemy.orm import relationship

companys = Table(
    'Company', meta,
    Column('companyID', Integer, primary_key=True),
    Column('name', String(128)),
    Column('address', String),
    Column('isActivate', Boolean),
)

companies_Services = Table(
    'Companies_Services', meta,
    Column('ID', Integer, primary_key=True),
    Column('name', String(25)),
    Column('port', Integer),
    Column('companyID', Integer, ForeignKey('Company.companyID')),
    Column('serviceID', Integer, ForeignKey('Service.serviceID')),
)
