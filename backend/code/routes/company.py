from fastapi import APIRouter, status, Depends
from fastapi.responses import ORJSONResponse, JSONResponse
from config.db import conn
from models.index import companys
from schemas.index import CompanysEntity
from .auth import cookie
from auth.SessionData import SessionData
from .auth import verifier
from dto.company import CompanyDTO

company = APIRouter(
    prefix="/api/company",
    tags=["Company"],
    default_response_class=ORJSONResponse
)


@company.get("/", dependencies=[Depends(cookie)])
async def get_all(session_data: SessionData = Depends(verifier)):
    if not session_data.isSysAdmin:
        return ORJSONResponse("UNAUTHORIZED", status_code=status.HTTP_401_UNAUTHORIZED)

    data = conn.execute(companys.select()).fetchall()
    return ORJSONResponse(CompanysEntity(data), status_code=status.HTTP_200_OK)


@company.post("/", dependencies=[Depends(cookie)])
async def create(companyDTO: CompanyDTO):
    conn.execute(companys.insert().values(
        name=companyDTO.name,
        address=companyDTO.address,
        isActivate=companyDTO.isActivate,
    ))
    conn.commit()
    return ORJSONResponse("", status_code=status.HTTP_201_CREATED)