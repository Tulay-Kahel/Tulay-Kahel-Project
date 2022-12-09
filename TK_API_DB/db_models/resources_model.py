"""

MongoDB Database Model for Resources

"""

from mongoengine import Document, StringField, ListField

# All models will inherit from the mongoengine Document class

# This is the model for the directories (contacts for VAWC related organizations, institutions, etc.)
class Directories(Document):
    pass


# This is the model for the information such as news, articles, etc. about VAWC
class Informations(Document):
    pass