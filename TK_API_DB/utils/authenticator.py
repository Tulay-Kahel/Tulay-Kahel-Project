"""

Functions used for authentication and authorization purposes

NOTE: User Info are not yet finalized

"""
def password_decrypter(password: str):
    # NOTE: Password decryption procedures are pseudo-implementation only, this will be finalized in the future
    return password

def authenticate_user(
    username: str,
    password: str
):
    # NOTE: Authentication procedures are pseudo-implementation only, this will be finalized in the future
    user_authenticated = False

    # NOTE: For now hard code the username and password for testing purposes
    if username == "admin" and password_decrypter(password) == "admin":
        user_authenticated = True

    return user_authenticated