from fastapi import FastAPI
from routes.logger import logger
from routes.user import user
from routes.auth import auth
from routes.attacker import attacker
from routes.company import company
from routes.report import report

app = FastAPI(
    title="Cyber Tilt Tool",
    version='1.0.0'
)

app.include_router(logger)
app.include_router(user)
app.include_router(auth)
app.include_router(attacker)
app.include_router(company)
app.include_router(report)
