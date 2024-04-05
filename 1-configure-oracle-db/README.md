# Install Oracle DB with Docker

- Connect to the Oracle container executing
```
docker exec -it oracle_xe bash 
```

- Execute in container:

```
orapwd file=orapwXE password=Password123123$ entries=5

sqlplus sys/Password123123$@XE as sysdba

CREATE USER YOUR_USERNAME_HERE IDENTIFIED BY Password123123$;

GRANT DBA TO YOUR_USERNAME_HERE;
```
