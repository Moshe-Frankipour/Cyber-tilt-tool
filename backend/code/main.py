from fastapi import FastAPI

from routes.logger import logger
from routes.user import user
from routes.auth import auth

app = FastAPI(
    title="Cyber Tilt Tool",
    version='1.0.0'
)

app.include_router(logger)
app.include_router(user)
app.include_router(auth)
