from sqlalchemy import Table, Column
from sqlalchemy.sql.sqltypes import Integer, String, DateTime, Boolean
from config.db import meta

users = Table(
    'User', meta,
    Column('userID', Integer, primary_key=True),
    Column('username', String(32)),
    Column('password', String(64)),
    Column('fullName', String(256)),
    Column('email', String(256)),
    Column('phone', String(15)),
    Column('address', String),
    Column('birthdate', DateTime),
    Column('registerDate', DateTime),
    Column('serviceID', Integer),  # ??
    Column('companyID', Integer),
    Column('isSysAdmin', Boolean),
    Column('isCompanyAdmin', Boolean),
    Column('isActive', Boolean),
)
