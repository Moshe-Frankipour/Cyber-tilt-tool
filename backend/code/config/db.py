from sqlalchemy import create_engine, MetaData
import os

engine = create_engine("mysql://{0}:{1}@db:3306/db"
                       .format(
                           os.environ.get('USERNAME_DB'),
                           os.environ.get('PASSWORD_DB')
                       ))
meta = MetaData()
conn = engine.connect()
