from fastapi import HTTPException, status
from models import User
from routers import authenticate
import requests
import string
import random

url = "https://www.fast2sms.com/dev/bulkV2"


def random_pw():
    symbols = ['*', '%', '$']

    password = ""
    for _ in range(9):
        ch = random.choice([random.choice(string.ascii_lowercase), random.choice(string.ascii_uppercase), random.choice(string.digits), random.choice(symbols)])
        password += ch

    return password


def get_user_data(db, id=None):
    if not id:
        user = db.query(User).all()
    else:
        user = db.query(User).filter(User.id == id).first()

    if not user:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail='user not available'
        )

    return user


def create_user(reqeust, db):
    user = User(name=reqeust.name, phone=reqeust.phone,
                age=reqeust.age,
                password=authenticate.get_password_hash(reqeust.password),
                )

    db.add(user)
    db.commit()
    db.refresh(user)


def forgot(request, db):
    user = db.query(User).filter(User.phone == request.phone).first()
    if user.name != request.name:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail='user not available'
        )

    new_pw = random_pw()
    user.password = authenticate.get_password_hash(new_pw)
    print(new_pw)
    db.commit()
    querystring = {
        "authorization": "JQTSlAxmZ56iYd2wjKOR09hkbpVWagF8uPyGqNULXcCnHzo1f4WKobCXGQE9LdaHm0RpU7fxStP51u6M",
        "message": f"Your new password is {new_pw}",
        "language": "english",
        "route": "q",
        "numbers": user.phone}

    headers = {
        'cache-control': "no-cache"
    }
    try:
        response = requests.request("GET", url,
                                    headers=headers,
                                    params=querystring)

        print(response.text)
    except:
        print("Oops! Something wrong")