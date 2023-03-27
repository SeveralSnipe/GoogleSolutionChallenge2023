from sqlalchemy import Column, ForeignKey, Integer, String, Boolean, Date
from sqlalchemy.orm import relationship
from database import Base


class User(Base):
    __tablename__ = 'user'

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(20))
    password = Column(String)
    phone = Column(String)
    age = Column(Integer)


class Pill(Base):
    __tablename__ = 'pill'

    pill_id = Column(Integer, primary_key=True)
    name = Column(String)
    quantity = Column(Integer)
    expiry = Column(Date)