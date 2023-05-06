
from pydantic import BaseModel
from datetime import datetime


class User(BaseModel):
    userID: int
    username: str
    password: str
    email: str
    phone: str
    address: str
    birthdate: datetime
    registerDate: datetime
    serviceID: str  # ??
    companyID: int
    isSysAdmin: bool
    isCompanyAdmin: bool
    isActive: bool


def UserEntity(item) -> dict:
    return {
        "userID": item[0],
        "username": item[1],
        "password": item[2],
        "email": item[3],
        "phone": item[4],
        "address": item[5],
        "birthdate": item[6],
        "registerDate": item[7],
        "serviceID": item[8],
        "companyID": item[9],
        "isSysAdmin": item[10],
        "isCompanyAdmin": item[11],
        "isActive": item[12],
    }


def UsersEntity(entity) -> list:
    return [UserEntity(item) for item in entity]
