"""

MongoDB Database Model for Admins

"""

from mongoengine import Document, StringField

# All models will inherit from the mongoengine Document class
class Admins(Document):
    username = StringField(required=True)
    email = StringField(required=True)
    password = StringField(required=True)
    company_id = StringField(required=True)

    # Initializing the Admins
    def __init__(self, username, email, password, company_id, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.username = username
        self.email = email
        self.password = password
        self.company_id = company_id
    
    # Converting the Admins to JSON
    def to_json(self):
        return {
            "username": self.username,
            "email": self.email,
            "encrypted_password": self.password
        }
