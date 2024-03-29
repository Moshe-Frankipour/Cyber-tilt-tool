from fastapi import APIRouter, status, Depends
from fastapi.responses import ORJSONResponse, JSONResponse
from config.db import conn
from models.index import companies, users, companies_Services, services
from schemas.index import CompaniesEntity, UsersEntity
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

    data = conn.execute(companies.select()).fetchall()
    return ORJSONResponse(CompaniesEntity(data), status_code=status.HTTP_200_OK)


@company.post("/", dependencies=[Depends(cookie)])
async def create(companyDTO: CompanyDTO):
    conn.execute(companies.insert().values(
        name=companyDTO.name,
        address=companyDTO.address,
        isActivate=companyDTO.isActivate,
    ))
    conn.commit()
    return ORJSONResponse("", status_code=status.HTTP_201_CREATED)


@company.get("/users", dependencies=[Depends(cookie)])
async def get_users(session_data: SessionData = Depends(verifier)):
    if session_data.isSysAdmin:
        q = users.join(companies)
        data = conn.execute(q.select()).fetchall()
        return ORJSONResponse(UsersEntity(data, True), status_code=status.HTTP_200_OK)
    elif session_data.isCompanyAdmin:
        data = conn.execute(users.select().where(
            users.c.companyID == session_data.companyID)).fetchall()
        return ORJSONResponse(UsersEntity(data, True), status_code=status.HTTP_200_OK)
    return ORJSONResponse("UNAUTHORIZED", status_code=status.HTTP_401_UNAUTHORIZED)


@company.get('/register')
async def register(companyName: str, address: str):
    # Checking that the company does not exist
    db_select_company = conn.execute(companies.select().where(
        companies.c.name == companyName)).fetchone()
    if db_select_company is not None:
        return JSONResponse(status_code=status.HTTP_400_BAD_REQUEST, content="BAD_REQUEST")

    conn.execute(companies.insert().values(
        name=companyName,
        address=address,
        isActivate=True
    ))
    return JSONResponse(status_code=status.HTTP_201_CREATED, content="")


@company.get('/companies', dependencies=[Depends(cookie)])
async def get_companies(session_data: SessionData = Depends(verifier)):
    if session_data.isSysAdmin:
        q = companies.join(
            companies_Services, companies_Services.c.companyID == companies.c.companyID).join(
            services, services.c.serviceID == companies_Services.c.serviceID)
        data = conn.execute(q.select()).fetchall()
        print("LOOK HERE:", data)
        companies_with_services = CompaniesEntity(data, False)
        out = {}

        for item in companies_with_services:
            if out.get(item.name) == None:
                out[item.name] = {}
            out[item.name]['companyID'] = item.companyID
            out[item.name]['address'] = item.address
            out[item.name]['isActivate'] = item.isActivate
            if out[item.name].get('services') is None:
                out[item.name]['services'] = []
            out[item.name]['services'].append(item.serviceName)

        return JSONResponse(out, status_code=status.HTTP_200_OK)

    return JSONResponse("UNAUTHORIZED", status_code=status.HTTP_401_UNAUTHORIZED)
