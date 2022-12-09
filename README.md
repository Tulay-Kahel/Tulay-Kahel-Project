# Tulay Kahel Project
"Building bridges towards a VAW-Free Workplace"

## About
Tulay Kahel (orange bridge, a pun on “kulay kahel” and the fact that the company/employer (via the webapp) serves more like a bridge between the VAW-affected individuals/survivors and VAWC partners.
### The Team
- Product Manager: [Nikko Gabriel J. Hismaña](https://github.com/nikko-gabriel)
- Lead Developer: [John Markton M. Olarte](https://github.com/GravitonXD)
- Lead Designer (UI/UX): [Erru G. Torculas](mailto:egtorculas@up.edu.ph)

## Project Befits
### Immediate Benefits
- Encourage employees to report (either in person or via the webapp) as they’ll be aware that the company assists VAW-affected individuals/survivors 
- Enable companies/employers to assist and help report VAWC cases among their employees
- Enable employee well-being
- Improve company/employer publicity and reputation
### Secondary Benefits
- Raise awareness on VAWC, and that employers also have a role in ending VAWC
- Raise awareness and becoming an extension of Anti-VAWC partners (e.g. IACVAWC, UPV GAD, UGSAD)

## Running the Project (Development and Testing)
### Prerequisites (Backend)
- Python 3.6+, preferably 3.11
- Docker Compose
- MongoDB Compass (optional)
### Python Libraries
- FastAPI
- mongoengine
- uvicorn
### Setup (Backend)
- Clone the repository
- Activate the MongoDB Container

Note: Make sure that you are in the root directory where the docker-compose.yml file is located
```bash
cd ./TK_API_DB
```

Use Docker Compose to build the container
```bash
docker-compose build
```

```bash
docker-compose up
```

You can use MongoDB Compass to connect, view, and edit the database

- Run the API

Note: Make sure that you are in the root directory where the tulay_kahel_api.py file is located

```bash
cd ./TK_API_DB
```

Run the API server using Python
```bash
python3 tulay_kahel_api.py
```

### Prequisites (Frontend)
- Flutter (latest stable version as of December 2022)
### Flutter Libraries
- Material Design
### Setup (Frontend)