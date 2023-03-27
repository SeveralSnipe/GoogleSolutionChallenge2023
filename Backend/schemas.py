from pydantic import BaseModel
from typing import Union


class User(BaseModel):
    name: str

    class Config:
        orm_mode = True


class Token(BaseModel):
    access_token: str
    token_type: str


class TokenData(BaseModel):
    name: Union[str, None] = None


class UserInDB(User):
    phone: str
    password: str
    age: int


class UserForgot(User):
    phone: str
