from db_models import admins_model as admins
from db_models.admins_model import Admins
from db_models import companies_model as companies
from fastapi import APIRouter
from datetime import datetime
from utils.authenticator import authenticate_user

router = APIRouter(
    prefix="/admins",
    tags=["Admins"],
)

####### ADMINS #####################################################################################
def password_encrypt(password: str):
    # Psedudo encryption using RSA
    public_key = (17, 323) # NOTE: Change this to a more secure key on deployment

    encrypted_chars = []
    for char in password:
        encrypted_char = chr((ord(char) ** public_key[0]) % public_key[1])
        encrypted_chars.append(encrypted_char)
    # Join the list of encrypted chars to form a string (encrypted password)
    encrypted_password = "".join(encrypted_chars)

    # Return the encrypted password
    return encrypted_password

# Admin Registration
@router.post(
    "/register",
    tags=["Admins"],
    description="This endpoint allows the registration of the admins."
)
def new_admin(
    admin_name: str,
    admin_email: str,
    admin_password: str,
    company_id: str
):
    # Check if the company exists
    if not companies.Companies.objects(id=company_id):
        # Company does not exist!
        return {
            "message": f"Company does not exist! Please register the company first."
        }

    # Save the new admin to the database if it doesn't exist (There could only be one admin per company)
    if admins.Admins.objects(company_id=company_id):
        # Admin already exists!
        return {
            "message": f"Admin for the company, already exists!"
        }
    
    # Create a new admin
    new_admin = admins.Admins(
        username=admin_name,
        email=admin_email,
        password=password_encrypt(admin_password),
        company_id=company_id
    )
    new_admin.save()
    return {
        "message": "Admin successfully created!",
        "admin": new_admin.to_json()
    }    

####################################################################################################