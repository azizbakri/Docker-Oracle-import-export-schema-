#!/bin/bash

#execute the export of system schema with the user system/tiger
docker exec -it demo1 expdp system/oracle schemas=system DUMPFILE=dmpTEST.dmp

echo "Copying the files from the host inside the container"

#copy the dump file from the container to the host 
docker cp demo1:u01/app/oracle/admin/xe/dpdump/dmpTEST.dmp /home/aziz/Desktop/DockerOracle

echo "Export is successful"

