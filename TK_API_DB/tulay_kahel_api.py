"""

Restful API for the Tulay Kahel Project

This contains the API EndPoints for the Tulay Kahel Web Application

"""

# IMPORTS
from fastapi import FastAPI
from utils.authenticator import authenticate_user
from mongoengine import connect
from datetime import datetime

# Import files from the routers folder
from routers import reports_endpoints, companies_endpoints, admins_endpoints, resources_endpoints

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

# ADMINS
app.include_router(admins_endpoints.router)

# RESOURCES
app.include_router(resources_endpoints.router)

if __name__ == "__main__":
    import uvicorn
    # Allow hot reloading
    uvicorn.run("tulay_kahel_api:app", host="127.0.0.1", port=8000 , reload=True)