
from pydantic import BaseModel
from datetime import datetime


class Report(BaseModel):
    serviceID: int
    companyID: int
    attackerID: int
    trapID: int


def ReportEntity(item) -> dict:
    return {
        "reportID": item[0],
        "serviceID": item[1],
        "createAt": item[2],
        "companyID": item[4],
        "attackerID": item[5],
        "trapID": item[6],
        "sessionLogID": item[7]
    }


def ReportsEntity(entity) -> list:
    return [ReportEntity(item) for item in entity]
