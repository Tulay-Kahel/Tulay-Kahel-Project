"""

Restful API for the Tulay Kahel Project

This contains the API EndPoints for the Tulay Kahel Web Application

"""

# IMPORTS
from fastapi import FastAPI
from db_models import reports_model as reports
from db_models import companies_model as companies
from db_models.reports_model import Reports
from db_models.companies_model import Companies
from mongoengine import connect
from datetime import datetime

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

###### REPORTS ########################################################################################

# Creating a Report
# Users will enter their name, email, and report body
# The report will be saved to the database
# Multple parameters will be required
@app.post(
    "/reports/create/{company_id}",
    tags=["Reports"],
    description="This endpoint allows users to create a report."
    )
def create_report(
        company_id: str,
        name: str,
        email: str,
        report_body: str,
        report_type: int,
        status: int = 0,
        date_reported: datetime = datetime.now(),
        time_reported: datetime = datetime.now()
    ):
    # Create a new report
    new_report = reports.Reports(
        company_id=company_id,
        date_reported=date_reported,
        time_reported=time_reported,
        name=name,
        email=email,
        report_body=report_body,
        status=status,
        report_type=report_type)

    # Save the report to the database
    new_report.save()

    return {
        "message": "Report successfully created!",
        "report": new_report.to_json()
    }


# Getting all Reports based on Company ID
# This will return all reports in the database
@app.get(
    "/reports/{company_id}",
    tags=["Reports"],
    description="This endpoint allows authenticated users to get all reports based on the company ID."
)
def get_all_reports(company_id: str):
    reports = [i for i in Reports.objects(company_id=company_id)]
    return {
        "message": "Reports successfully retrieved!",
        "reports": [report.to_json() for report in reports]
    }

# Updating a Report
# This will update the report status based on the report ID
@app.put(
    "/reports/update/{report_id}",
    tags=["Reports"],
    description="This endpoint allows authenticated users to update the report status of a report based on its report ID."
)
def update_report(report_id: str, status: int):
    report = Reports.objects(id=report_id).first()
    report.status = status
    report.save()
    return {
        "message": "Report successfully updated!",
        "report": report.to_json()
    }

# Deleting a Report
# This will delete a report based on the report ID
@app.delete(
    "/reports/delete/{report_id}",
    tags=["Reports"],
    description="This endpoint allows authenticated users to delete a report based on the report ID."
)
def delete_report(report_id: str):
    report = Reports.objects(id=report_id).first()
    report.delete()
    return {
        "message": "Report successfully deleted!",
        "report": report.to_json()
    }

####################################################################################################


####### USERS ######################################################################################

# Creating a user
# Note that in this case a user is a company
# This will create a new company in the database
@app.post(
    "/companies/create",
    tags=["Companies"],
    description="This endpoint allows the creation of the companies. It will generate a unique ID link for each registered company."
)
def new_company(
    company_name: str,
    company_contact: str,
    company_email: str,
    person_in_charge: str,
):
    # Create a new company
    new_company = companies.Companies(
        company_name=company_name,
        company_contact=company_contact,
        company_email=company_email,
        person_in_charge=person_in_charge,
    )

    # Generate a unique ID link for the company
    new_company.company_id = str(new_company.id)
    
    # Save the new company to the database if it doesn't exist
    if not companies.Companies.objects(company_name=company_name):
        new_company.save()
        return {
            "message": "Company successfully created!",
            "company": new_company.to_json()
        }
    else:
        return {
            "message": "Company already exists!"
        }

# Update Company Information
# This will update the company information based on the company ID
@app.put(
    "/companies/update/{company_id}",
    tags=["Companies"],
    description="This endpoint allows authenticated users to update the company information based on the company ID."
)
def update_company(
    company_id: str,
    company_name: str,
    company_contact: str,
    company_email: str,
    person_in_charge: str,
):
    company_to_update = companies.Companies.objects(id=company_id).first()
    company_to_update.company_name = company_name
    company_to_update.company_contact = company_contact
    company_to_update.company_email = company_email
    company_to_update.person_in_charge = person_in_charge
    company_to_update.save()
    return {
        "message": "Company successfully updated!",
        "company": company_to_update.to_json()
    }

####################################################################################################


####### RESOURCES ##################################################################################

# TODO - Implement the Resources API

####################################################################################################

if __name__ == "__main__":
    import uvicorn
    # Allow hot reloading
    uvicorn.run("tulay_kahel_api:app", host="127.0.0.1", port=8000 , reload=True)