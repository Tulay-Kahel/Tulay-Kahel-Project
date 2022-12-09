"""

MongoDB Database Model for Companies

"""

from mongoengine import Document, StringField

# All models will inherit from the mongoengine Document class
class Companies(Document):
    company_name = StringField(required=True)
    company_contact = StringField(required=True)
    company_email = StringField(required=True)
    person_in_charge = StringField(required=True)

    # Initializing the Companies
    def __init__(self, company_name, company_contact, company_email, person_in_charge, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.company_name = company_name
        self.company_contact = company_contact
        self.company_email = company_email
        self.person_in_charge = person_in_charge
    
    # Converting the Companies to JSON
    def to_json(self):
        return {
            "company_id": self.generate_id(),
            "company_name": self.company_name,
            "company_contact": self.company_contact,
            "company_email": self.company_email,
            "person_in_charge": self.person_in_charge,
            "report_link": f"/reports/create/{self.generate_id()}" # TO DO: Change this on deployment
        }

    # Function to generate an ID for the Company
    def generate_id(self):
        return str(self.id)