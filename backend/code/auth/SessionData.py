from pydantic import BaseModel


class SessionData(BaseModel):
    username: str
    fullName: str
    email: str
    companyName: str
    companyID: int
    isSysAdmin: bool
    isCompanyAdmin: bool
