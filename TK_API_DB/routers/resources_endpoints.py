from fastapi import APIRouter
from db_models import resources_model as resources

router = APIRouter(
    prefix="/resources",
    tags=["Resources"],
)

####### RESOURCES ######################################################################################

#### DIRECTORIES

# Add a directory
@router.post(
    "/directories",
    tags=["Resources"]
)
def add_directory(
    directory_name: str,
    directory_address: str,
    directory_contacts: str,
    directory_emails: str,
    directory_websites: str
    ):
    
    # Check if the directory already exists
    if resources.Directories.objects(directory_name=directory_name):
        # Directory already exists!
        return {
            "message": f"Directory already exists!"
        }
    
    # Create a new directory
    new_directory = resources.Directories(
        directory_name=directory_name,
        directory_address=directory_address,
        # Directory contacts are stored as a list (comma separated)
        directory_contacts = directory_contacts.split(",") if directory_contacts else [],
        # Directory emails are stored as a list (comma separated)
        directory_emails = directory_emails.split(",") if directory_emails else [],
        # Directory websites are stored as a list (comma separated)
        directory_websites=directory_websites.split(",") if directory_websites else []
    )

    new_directory.save()
    return {
        "message": "Directory successfully created!",
        "directory": new_directory.to_json()
    }

# Get all directories
# This are the directories for VAWC related contacts and resources
@router.get("/directories", tags=["Resources"])
def get_all_directories():
    return {"message": "Get all directories"}

# Get a specific directory based on the name of the organization
@router.get("/directories/{directory_name}", tags=["Resources"])
def get_directory(directory_name: str):
    directory_name = directory_name.lower()
    return {"message": "Get a specific directory"}

####


#### INFORMATION

# Add an information
@router.post("/informations", tags=["Resources"])
def add_information(information: str):
    return {"message": "Add an information"}

# Get all informations
# These are the informations about VAWC
@router.get("/informations", tags=["Resources"])
def get_all_informations():
    return {"message": "Get all informations"}

# Get a specific information based on the title of the information
@router.get("/informations/{info_title}", tags=["Resources"])
def get_information(info_title: str):
    info_title = info_title.lower()
    return {"message": "Get a specific information"}

####

########################################################################################################
