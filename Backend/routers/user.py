from fastapi import APIRouter, status, Depends
from repository import user_funx
from routers import authenticate
import schemas
from sqlalchemy.orm import Session
from database import get_db

router = APIRouter(
    tags=['user'],
    prefix="/user"
)


@router.get('/{id}', status_code=status.HTTP_226_IM_USED,
            response_model=schemas.User)
async def get_all_users(id: int, db: Session = Depends(get_db)):
    return user_funx.get_user_data(db, id)


@router.post('/register')
async def signup(request: schemas.UserInDB, db: Session = Depends(get_db)):
    user_funx.create_user(request, db)
    return f"user {request.name} created successfully"


@router.post('/forgot_password')
async def forgot(request: schemas.UserForgot, db: Session = Depends(get_db)):
    user_funx.forgot(request, db)
    return "SMS sent"


@router.post('/login', response_model=schemas.UserLogged)
async def login(request: schemas.UserLogin,
                db: Session = Depends(get_db)):
    return authenticate.authenticate_user(request, db)
