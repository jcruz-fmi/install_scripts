#install dependencies
sudo apt update
sudo apt install postgresql-client
sudo apt install postgresql-client-common

#create a docker-compose.yaml file
version: '3'

services:
  db:
    image: postgres
    restart: always
    environment:
      POSTGRES_USER: CHANGEME
      POSTGRES_PASSWORD: CHANGEME
      POSTGRES_DB: fmi_db
    volumes:
      - ./data:/var/lib/postgresql/data
    ports:
      - "5432:5432"

#run the docker-compose file
docker-compose up -d

#login to the db
psql -h 127.0.0.1 -p 5432 -U CHANGEME -d fmi_db

#create the metabase db
CREATE DATABASE metabase;

#create docker container
sudo docker run -d -p 3000:3000 \
  -e "MB_DB_TYPE=postgres" \
  -e "MB_DB_DBNAME=metabase" \
  -e "MB_DB_PORT=5432" \
  -e "MB_DB_USER=CHANGEME" \
  -e "MB_DB_PASS=CHANGEME" \
  -e "MB_DB_HOST=127.0.0.1" \
   --name metabase metabase/metabase
