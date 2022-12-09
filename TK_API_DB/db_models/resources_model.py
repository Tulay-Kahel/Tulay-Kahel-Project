"""

MongoDB Database Model for Resources

"""

from mongoengine import Document, StringField, ListField, DateField

# All models will inherit from the mongoengine Document class

# This is the model for the directories (contacts for VAWC related organizations, institutions, etc.)
class Directories(Document):
    directory_name = StringField(required=True)
    directory_address = StringField(required=True)
    directory_contacts = ListField(StringField(), required=True) # There could be more than one contact number
    directory_emails = StringField(required=True) # There could be more than one email address
    directory_websites = StringField(required=True) # There could be more than one website or social media accounts

    # Initializing the Directories
    def __init__(self, directory_name, directory_address, directory_contacts, directory_emails, directory_websites, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.directory_name = directory_name
        self.directory_address = directory_address
        self.directory_contacts = directory_contacts
        self.directory_emails = directory_emails
        self.directory_websites = directory_websites
    
    # Converting the Directories to JSON
    def to_json(self):
        return {
            "directory_name": self.directory_name,
            "directory_address": self.directory_address,
            "directory_contacts": self.directory_contacts,
            "directory_emails": self.directory_emails,
            "directory_websites": self.directory_websites,
            "report_link": f"/reports/create/{self.generate_id()}" # TO DO: Change this on deployment
        }


# This is the model for the information such as news, articles, etc. about VAWC
class Informations(Document):
    info_title = StringField(required=True)
    info_authors = ListField(StringField()) # There could be more than one author
    info_publication_date = DateField()
    info_content = StringField(required=True)
    info_links = ListField(StringField()) # There could be more than one link (These can be references or external links)

    # Initializing the Informations
    def __init__(self, info_title, info_authors, info_publication_date, info_content, info_links, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.info_title = info_title
        self.info_authors = info_authors
        self.info_publication_date = info_publication_date
        self.info_content = info_content
        self.info_links = info_links

    # Converting the Informations to JSON
    def to_json(self):
        return {
            "info_title": self.info_title,
            "info_authors": self.info_authors,
            "info_publication_date": self.info_publication_date,
            "info_content": self.info_content,
            "info_links": self.info_links,
            "report_link": f"/reports/create/{self.generate_id()}" # TO DO: Change this on deployment
        }