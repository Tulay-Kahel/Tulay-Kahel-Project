from fastapi import APIRouter

router = APIRouter(
    prefix="/resources",
    tags=["Resources"],
)

####### RESOURCES ######################################################################################

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


########################################################################################################
