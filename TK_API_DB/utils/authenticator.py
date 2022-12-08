"""

Functions used for authentication and authorization purposes

NOTE: User Info are not yet finalized

"""
from mongoengine import connect
from db_models import admins_model as admins
from db_models.admins_model import Admins

def password_decrypter(password: str):
    # NOTE: Password decryption procedures are pseudo-implementation only, this will be finalized in the future
    # Uses RSA encryption
    private_key = (2753, 323)
    
    decrypted_chars = []
    for char in password:
        decrypted_char = chr((ord(char) ** private_key[0]) % private_key[1])
        decrypted_chars.append(decrypted_char)
    decrypted_password = "".join(decrypted_chars)

    # Return the decrypted password
    return decrypted_password


def authenticate_user(
    username: str,
    password: str,
    company_id: str
):
    # NOTE: Authentication procedures are pseudo-implementation only, this will be finalized in the future
    user_authenticated = False

    # Connect to the database
    connect(db="tulay_kahel", host="mongodb://localhost:27017/tulay_kahel", port=27017)

    # Get the user's info from the Admins collection
    user_info = Admins.objects(username=username).first()
    if user_info:
        # Compare the password
        if password_decrypter(user_info.password) == password and user_info.company_id == company_id:
            user_authenticated = True

    return user_authenticated