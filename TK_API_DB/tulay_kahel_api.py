"""

Restful API for the Tulay Kahel Project

This contains the API EndPoints for the Tulay Kahel Web Application

"""

# IMPORTS
from fastapi import FastAPI
from db_models import admins_model as admins
from db_models.admins_model import Admins
from utils.authenticator import authenticate_user
from mongoengine import connect
from datetime import datetime

# Import files from the routers folder
from routers import reports_endpoints, companies_endpoints

# Initialize the FastAPI application
app = FastAPI(
    title="Tulay Kahel Backend API",
    description="""
    This is a backend API for the Tulay Kahel project.
    
    About Tulay Kahel:
    "A webapp that makes it easy to set up a company's own VAWC reporting desk in WV*"
    *for its initial build, it will only cover Region VI resources and partners.

    The Team
    - Project Manager: Nikko J. Hismaña
    - Lead Developer: John Markton M. Olarte
    - Lead Designer: Erru Torculas
    """,

    version="0.0.1",
    docs_url="/tulayKahelAPI/docs",
    redoc_url="/tulayKahelAPI/redoc",
    openapi_url="/tulayKahelAPI/openapi.json",
    openapi_tags = [
        {
            "name": "Home",
            "description": "Endpoints for the Home API, which allows users to access the Tulay Kahel web application."
        },
        {
            "name": "Reports",
            "description": "Endpoints for the Reports API, which allows users to send reports to the Tulay Kahel web application."
        },
        {
            "name": "Companies",
            "description": "Endpoints for the Companies, which allows a company to access the Tulay Kahel web application."
        },
        {
            "name": "Admins",
            "description": "Endpoints for the Admins API, which allows a specific user from a company to access the Tulay Kahel web application's admin panel."
        },
        {
            "name": "Resources",
            "description": "Endpoints for the Resources API, which allows users to access the Tulay Kahel web application's resources. This includes resources and information about VAWC."
        }
    ]
)

# Connect to the MongoDB database
connect(db="tulay_kahel", host="mongodb://localhost:27017/tulay_kahel", port=27017)

# ROOT
@app.get("/", tags=["Home"])
def home():
    return {"message": "Welcome to the Tulay Kahel API!"}


# REPORTS
app.include_router(reports_endpoints.router)

# COMPANIES
app.include_router(companies_endpoints.router)

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
####### ADMINS #####################################################################################

# Admin Registration
@app.post(
    "/admins/register",
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


####### RESOURCES ##################################################################################

# TODO - Implement the Resources API

####################################################################################################

if __name__ == "__main__":
    import uvicorn
    # Allow hot reloading
    uvicorn.run("tulay_kahel_api:app", host="127.0.0.1", port=8000 , reload=True)