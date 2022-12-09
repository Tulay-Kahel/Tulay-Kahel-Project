from db_models import companies_model as companies
from db_models.companies_model import Companies
from fastapi import APIRouter
from datetime import datetime
from utils.authenticator import authenticate_user

router = APIRouter(
    prefix="/companies",
    tags=["Companies"],
)

####### COMPANIES ######################################################################################

# Creating a Company
# This will create a new company in the database
@router.post(
    "/create",
    tags=["Companies"],
    description="This endpoint allows the creation of the companies. It will generate a unique ID link for each registered company."
)
def new_company(
    company_name: str,
    company_contact: str,
    company_email: str,
    person_in_charge: str,
):
    # Save the new company to the database if it doesn't exist
    if companies.Companies.objects(company_name=company_name):
        # Company already exists!
        return {
            "message": f"Company:{company_name} already exists!"
        }
    
    # Create a new company
    new_company = companies.Companies(
        company_name=company_name,
        company_contact=company_contact,
        company_email=company_email,
        person_in_charge=person_in_charge,
    )
    # Generate a unique ID link for the company
    new_company.company_id = str(new_company.id)
    new_company.save()
    return {
        "message": "Company successfully created!",
        "company": new_company.to_json()
    }

# Update Company Information
# This will update the company information based on the company ID
@router.put(
    "/update/{company_id}",
    tags=["Companies"],
    description="This endpoint allows authenticated users to update the company information based on the company ID."
)
def update_company(
    company_id: str,
    company_name: str,
    company_contact: str,
    company_email: str,
    person_in_charge: str,
    username: str,
    password: str
):
    # NOTE: Authentication procudures are pseudo-implementation only, this will be finalized in the future
    user_authenticated = authenticate_user(username, password, company_id=company_id)

    # If the user is not authenticated, return a message and an empty list of reports
    if not user_authenticated:
        return {
            "message": f"You are not authorized to update the information in this company!",
            "reports": []
        }
    
    # If the user is authenticated, return a message and the list of reports
    company_to_update = companies.Companies.objects(id=company_id).first()
    company_to_update.company_name = company_name
    company_to_update.company_contact = company_contact
    company_to_update.company_email = company_email
    company_to_update.person_in_charge = person_in_charge
    company_to_update.save()
    return {
        "message": "Company successfully updated!",
        "updated_by": f"{username}",
        "company": company_to_update.to_json()
    }

# Delete Company
# This will delete a company based on the company ID
@router.delete(
    "/delete/{company_id}",
    tags=["Companies"],
    description="This endpoint allows authenticated users to delete a company based on the company ID."
)

def delete_company(
    company_id: str,
    username: str,
    password: str
):
    # NOTE: Authentication procudures are pseudo-implementation only, this will be finalized in the future
    user_authenticated = authenticate_user(username, password, company_id=company_id)

    # If the user is not authenticated, return a message and an empty list
    if not user_authenticated:
        return {
            "message": f"You are not authorized to delete any reports in this company!",
            "reports": []
        }
    
    # If the user is authenticated, return a message and the list of deleted company details
    company_to_delete = companies.Companies.objects(id=company_id).first()
    company_to_delete.delete()

    return {
        "message": "Company successfully deleted!",
        "company": company_to_delete.to_json()
    }

####################################################################################################
