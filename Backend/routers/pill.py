from fastapi import APIRouter, status, Depends
from repository import pill_funx
import schemas
from sqlalchemy.orm import Session
from database import get_db
from authenticate import get_current_user, oauth2_scheme

router = APIRouter(
    tags=['pill'],
    prefix="/pill"
)


user = get_current_user(Depends(oauth2_scheme), Depends(get_db))
@router.post('/{id}/addpill')
async def addPill()