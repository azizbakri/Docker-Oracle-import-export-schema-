# Docker Databases Import/Export Schemas
Import and export schemas on an Oracle database running on docker container
## Getting Started
This project contains three script files: 
* The first one pulls the image from dockerhub then starts and initialize a database on a container.  
* The second one export a schema into dump file on your host.  
* The third one import a schema from your dump file to the database  

**Note1:** Before running the export or import script you need to change the host path and the name of the dump file in the commands into your host path and your file name.  
## Prerequisites
You need to install Docker on your machine. You can find it here https://www.docker.com
## Running and Testing

### First step: Pull the image from dockerhub and run the database on a container
* Run the first script file "RunOracleImageDatabase.sh"  

**Note2:** Wait for the initialization of the database to complete. You will see the message "Database ready to use. ;)" when it ends.  


### Second step: Export of a schema
* **see note1**  Open "exportTEST.sh" and change ```/hostpath``` in the commands to the wanted path in your machine and ```dmpTEST.sh``` to your desired name.  
* Run the script file  

**Note3:** The schema is exported with the command ```docker exec -it demo1 expdp...``` to dump file inside the container then the file is copied from the container to the host with the command ```docker cp...```  


### Third step: Import of a schema
* **see note1**  Open "importTEST.sh" and change ```/hostpath``` in the commands to the path of your dump file and change ```dmpTEST.dmp``` to the name of your dump file.
* Run the script file  

**Note4:** The dump file is copied from the host to the container then with the command ```docker cp...``` then the command ```docker exec -it demo1 chmod +rxw...``` gives the right to the container to use the file then the schema is imported with ```docker exec -it demo1 impdp..```  
**Note5:** In case of error in the import verify that a dump file doesn't already exist inside the directory ```u01/app/oracle/admin/xe/dpdump/``` inside the container with the same name of the dump file you're using. If it exists delete it  
## Built With
Docker  
Oracle Image      
For more information about the image see https://hub.docker.com/r/sath89/oracle-12c/ 
