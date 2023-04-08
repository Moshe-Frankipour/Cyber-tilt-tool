from fastapi import FastAPI

from routes.logger import logger

app = FastAPI(
    title="Cyber Tilt Tool",
    version='1.0.0'
)

app.include_router(logger)
