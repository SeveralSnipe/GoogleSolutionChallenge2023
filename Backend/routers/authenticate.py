from fastapi import HTTPException, status, APIRouter
from fastapi.security import OAuth2PasswordBearer
from passlib.context import CryptContext

import models

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")

router = APIRouter()


def verify_password(plain_password, hashed_password):
    return pwd_context.verify(plain_password, hashed_password)


def get_password_hash(password):
    return pwd_context.hash(password)


def get_user(phone: str, db):
    user_dict = db.query(models.User).filter(
        models.User.phone == phone).first()
    if not user_dict:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND)

    return user_dict


def authenticate_user(request, db):
    user = get_user(request.phone, db)
    if not user or not verify_password(request.password, user.password):
        user.name = "!N"
    return user
