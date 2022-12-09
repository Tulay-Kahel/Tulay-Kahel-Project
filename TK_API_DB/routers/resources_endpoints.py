from fastapi import APIRouter

router = APIRouter(
    prefix="/resources",
    tags=["Resources"],
)

####### RESOURCES ######################################################################################

#### DIRECTORIES

# Add a directory
@router.post("/directories", tags=["Resources"])
async def add_directory(directory: str):
    return {"message": "Add a directory"}

# Get all directories
# This are the directories for VAWC related contacts and resources
@router.get("/directories", tags=["Resources"])
async def get_all_directories():
    return {"message": "Get all directories"}

# Get a specific directory based on the name of the organization
@router.get("/directories/{directory_name}", tags=["Resources"])
async def get_directory(directory_name: str):
    directory_name = directory_name.lower()
    return {"message": "Get a specific directory"}

####


#### INFORMATION

# Add an information
@router.post("/informations", tags=["Resources"])
async def add_information(information: str):
    return {"message": "Add an information"}

# Get all informations
# These are the informations about VAWC
@router.get("/informations", tags=["Resources"])
async def get_all_informations():
    return {"message": "Get all informations"}

# Get a specific information based on the title of the information
@router.get("/informations/{info_title}", tags=["Resources"])
async def get_information(info_title: str):
    info_title = info_title.lower()
    return {"message": "Get a specific information"}

####

########################################################################################################
