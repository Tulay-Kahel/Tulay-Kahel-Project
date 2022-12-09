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
    if resources.Directories.objects(directory_name=directory_name.lower()):
        # Directory already exists!
        return {
            "message": f"Directory already exists!"
        }
    
    # Create a new directory
    new_directory = resources.Directories(
        directory_name=directory_name.lower(),
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
@router.get(
    "/directories",
    tags=["Resources"]
)
def get_all_directories():
    get_all_directories = resources.Directories.objects()

    return {
        "message": "All directories",
        "directories": [directory.to_json() for directory in get_all_directories]
    }

# Get a specific directory based on the name of the organization
@router.get(
    "/directories/{directory_name}",
    tags=["Resources"]
)
def get_directory(
    directory_name: str
):
    directory_name = directory_name.lower()
    get_directory = resources.Directories.objects(directory_name=directory_name)

    # Check if the directory exists
    if not get_directory:
        # Directory not found!
        return {
            "message": f"Directory: {directory_name} not found!"
        }
    
    # Directory found!
    return {
        "message": f"Directory: {directory_name} found!",
        "directory": [directory.to_json() for directory in get_directory]
    }

####


#### INFORMATION

# Add an information
@router.post(
    "/informations",
    tags=["Resources"]
)
def add_information(
    info_title: str,
    info_authors: str,
    info_publication_date: str,
    info_content: str,
    info_links: str,
    info_tags: str
):
    # Check if the information already exists
    if resources.Informations.objects(info_title=info_title.title()):
        # Information already exists!
        return {
            "message": f"Information already exists!"
        }
    
    # Create a new information
    new_information = resources.Informations(
        info_title=info_title.title(),
        # Information authors are stored as a list (semicolon separated)
        info_authors = info_authors.split(";") if info_authors else [],
        info_publication_date=info_publication_date,
        info_content=info_content,
        # Information links are stored as a list (semicolon separated)
        info_links = info_links.split(";") if info_links else [],
        # Information tags are stored as a list (hash separated)
        info_tags = info_tags.split("#") if info_tags else []
    )

    new_information.save()

    return {
        "message": "Information successfully created!",
        "information": new_information.to_json()
    }


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
