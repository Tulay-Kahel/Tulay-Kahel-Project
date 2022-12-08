"""

Restful API for the Tulay Kahel Project

This contains the API EndPoints for the Tulay Kahel Web Application

"""

# IMPORTS
from fastapi import FastAPI
from db_models import reports_model as reports
from db_models.reports_model import Report
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
            "name": "Users",
            "description": "Endpoints for the Users API, which allows users to access the Tulay Kahel web application's users."
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
    new_report = reports.Report(
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
    reports = [i for i in Report.objects(company_id=company_id)]
    return {
        "message": "Reports successfully retrieved!",
        "reports": [report.to_json() for report in reports]
    }

# Deleting a Report
# This will delete a report based on the report ID
@app.delete(
    "/reports/delete/{report_id}",
    tags=["Reports"],
    description="This endpoint allows authenticated users to delete a report based on the report ID."
)
def delete_report(report_id: str):
    report = Report.objects(id=report_id).first()
    report.delete()
    return {
        "message": "Report successfully deleted!",
        "report": report.to_json()
    }

if __name__ == "__main__":
    import uvicorn
    # Allow hot reloading
    uvicorn.run("tulay_kahel_api:app", host="127.0.0.1", port=8000 , reload=True)