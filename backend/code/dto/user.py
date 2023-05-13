from datetime import datetime
from pydantic import BaseModel


class UserDTO(BaseModel):
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
