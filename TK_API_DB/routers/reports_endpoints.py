from fastapi import APIRouter
from db_models import reports_model as reports
from db_models.reports_model import Reports
from datetime import datetime
from utils.authenticator import authenticate_user

router = APIRouter(
    prefix="/reports",
    tags=["Reports"],
)

###### REPORTS ########################################################################################

# Creating a Report
# Users will enter their name, email, and report body
# The report will be saved to the database
# Multple parameters will be required
@router.post(
    "/create/{company_id}",
    tags=["Reports"],
    description="This endpoint allows users to create a report."
    )
def create_report(
        company_id: str,
        name1: str,
        name2: str,
        email: str,
        report_body: str,
        status: int = 0,
        date_reported: datetime = datetime.now(),
        time_reported: datetime = datetime.now()
    ):
    # Create a new report
    new_report = reports.Reports(
        company_id=company_id,
        date_reported=date_reported,
        time_reported=time_reported,
        # Name 1 is required, Name 2 is optional
        names= [name1, name2] if name2 else [name1],
        email=email,
        report_body=report_body,
        status=status,
    )

    # Save the report to the database
    new_report.save()

    return {
        "message": "Report successfully created!",
        "report": new_report.to_json()
    }


# Getting all Reports based on Company ID
# This will return all reports in the database
@router.get(
    "/{company_id}",
    tags=["Reports"],
    description="This endpoint allows authenticated users to get all reports based on the company ID."
)
def get_all_reports(
    company_id: str,
    username: str,
    password: str
):
    # NOTE: Authentication procudures are pseudo-implementation only, this will be finalized in the future
    user_authenticated = authenticate_user(username, password, company_id=company_id)
    
    # If the user is not authenticated, return a message and an empty list of reports
    if not user_authenticated:
        return {
            "message": "You are not authorized to access this reports!",
            "reports": []
        }
    
    # If the user is authenticated, return a message and the list of reports
    reports = [i for i in Reports.objects(company_id=company_id)]
    return {
            "message": "Reports successfully retrieved!",
            "retrieved_by": f"{username}",
            "reports": [report.to_json() for report in reports]
        }


# Getting a Report based on Report ID
# This will return a report based on the report ID
@router.get(
    "/{report_id}/{company_id}",
    tags=["Reports"],
    description="This endpoint allows authenticated users to get a report based on the report ID."
)
def get_report(
    report_id: str,
    company_id: str,
    username: str,
    password: str
):
    # NOTE: Authentication procudures are pseudo-implementation only, this will be finalized in the future
    user_authenticated = authenticate_user(username, password, company_id=company_id)

    # If the user is not authenticated, return a message and an empty list of reports
    if not user_authenticated:
        return {
            "message": f"You are not authorized to access this report {report_id}!",
            "report": []
        }

    # If the user is authenticated, return a message and the report based on the report ID
    report = Reports.objects(id=report_id, company_id=company_id).first()
    return {
            "message": f"Report {report_id} successfully retrieved!",
            "retrieved_by": f"{username}",
            "report": report.to_json()
        }

# Updating a Report
# This will update the report status based on the report ID
@router.put(
    "/update/{report_id}",
    tags=["Reports"],
    description="This endpoint allows authenticated users to update the report status of a report based on its report ID."
)
def update_report(
    report_id: str, 
    status: int,
    username: str,
    password: str,
    company_id: str
):
    # NOTE: Authentication procudures are pseudo-implementation only, this will be finalized in the future
    user_authenticated = authenticate_user(username, password, company_id=company_id)

    # If the user is not authenticated, return a message and an empty list of reports
    if not user_authenticated:
        return {
            "message": f"You are not authorized to update this report {report_id}!",
            "reports": []
        }
    
    # If the user is authenticated, return a message and the list of reports
    report = Reports.objects(id=report_id).first()
    report.status = status
    report.save()
    return {
        "message": "Report successfully updated!",
        "update_by": f"{username}",
        "report": report.to_json()
    }

# Deleting a Report
# This will delete a report based on the report ID
@router.delete(
    "/delete/{report_id}",
    tags=["Reports"],
    description="This endpoint allows authenticated users to delete a report based on the report ID."
)
def delete_report(
    report_id: str,
    username: str,
    password: str,
    company_id: str
):
    # NOTE: Authentication procudures are pseudo-implementation only, this will be finalized in the future
    user_authenticated = authenticate_user(username, password, company_id=company_id)

    # If the user is not authenticated, return a message and an empty list of reports
    if not user_authenticated:
        return {
            "message": f"You are not authorized to delete this report {report_id}!",
            "reports": []
        }

    # If the user is authenticated, return a message and the list of reports
    report = Reports.objects(id=report_id).first()
    report.delete()
    return {
        "message": "Report successfully deleted!",
        "deleted_by": f"{username}",
        "report": report.to_json()
    }

####################################################################################################
