#!/bin/bash 

#run the image and start the container
echo "Starting The container and initialization of database..."
docker run -p 8080:8080 -p 1521:1521 --name demo1 -e DBCA_TOTAL_MEMORY=1024 sath89/oracle-12c


