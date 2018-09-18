#!/bin/bash

echo "Copying files from the host to the container"
#copy the dump file from the host to the container 
docker cp /home/aziz/Desktop/DockerOracle/dmpTEST.dmp demo1:u01/app/oracle/admin/xe/dpdump

echo "Copying is successful"

docker exec -it demo1 chmod +rxw /u01/app/oracle/admin/xe/dpdump/dmpTEST.dmp

#execute the import of system schema with the user system/tiger
docker exec -it demo1 impdp system/oracle DUMPFILE=dmpTEST.dmp 

