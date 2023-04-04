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


class UserLogin(BaseModel):
    phone: str
    password: str


class UserLogged(User):
    age: int

