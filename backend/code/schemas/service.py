
from pydantic import BaseModel


class Service(BaseModel):
    serviceID: int
    name: str
    description: str


def ServiceEntity(item, isDict=True) -> Service:
    service = Service(
        serviceID=int(item[0]),
        name=item[1],
        description=item[2]
    )

    if isDict:
        return service.dict()
    return service


def ServicesEntity(entity, isDict=True) -> list:
    return [ServiceEntity(item, isDict) for item in entity]
