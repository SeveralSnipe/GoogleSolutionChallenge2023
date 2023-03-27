import random
import string


def random_pw():
    symbols = ['*', '%', '$']

    password = ""
    for _ in range(9):
        ch = random.choice([random.choice(string.ascii_lowercase), random.choice(string.ascii_uppercase), random.choice(string.digits), random.choice(symbols)])
        password += ch

    return password


print(random_pw())