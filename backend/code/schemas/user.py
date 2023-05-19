
from pydantic import BaseModel
from datetime import datetime
import bcrypt


class LogIn():
    username: str
    password: str


class User(BaseModel):
    userID: int
    username: str
    password: str
    email: str
    fullName: str
    phone: str
    address: str
    birthdate: datetime
    registerDate: datetime
    companyID: int
    isSysAdmin: bool
    isCompanyAdmin: bool
    isActive: bool


def UserEntity(item) -> User:
    return User(
        userID=int(item[0]),
        username=item[1],
        password=item[2],
        fullName=item[3],
        email=item[4],
        phone=item[5],
        address=item[6],
        birthdate=datetime(item[7]),
        registerDate=datetime(item[8]),
        companyID=int(item[9]),
        isSysAdmin=bool(item[10]),
        isCompanyAdmin=bool(item[11]),
        isActive=bool(item[12])
    )


def UsersEntity(entity) -> list:
    return [UserEntity(item) for item in entity]


def hash(password: str) -> str:
    return bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())


def validate_password(password: str, password_hash: str) -> bool:
    return bcrypt.hashpw(password.encode('utf-8'), password_hash.encode('utf-8')) == password_hash.encode('utf-8')
