## Start Docker Container 
```
docker-compose up
```
#### What it does ?
* Creates and starts containers: If the containers don't already exist, Docker Compose will create them based on the configuration in the docker-compose.yml file.
* Starts services: The services defined in the docker-compose.yml (like web, db, redis, etc.) are all started.
* Builds images (if necessary): If the images for your services don't exist, or if you’ve made changes to your Dockerfile, docker-compose up will build them automatically.
* Networks containers: Docker Compose automatically creates a network to allow your containers to communicate with each other.
* Volumes: If any services define persistent data (e.g., databases), Docker Compose will automatically create volumes to store that data.
* Logs in the foreground: By default, docker-compose up will stream the logs from the containers to your terminal. This lets you see the output of your containers as they run.

## Open Interactive Terminal Session 
```
docker exec -it mysql-master bash
docker exec -it mysql-slave bash
```
#### What it does ?
It drops you into a bash shell inside the container, so you can:
* Navigate the filesystem
* Run commands
* Debug issues
* Inspect running processes

## Log ino Master / Slave Database 
```
mysql -u root -p
```

## Create Replication User On Master
```
CREATE USER 'replica_user'@'%' IDENTIFIED BY 'replica_password';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
FLUSH PRIVILEGES;
```
#### What it does ?
Replication user that the slave server will use to authenticate and connect to the master serve

## Database Status 
```
show database status;
```

## Slave setup 
```
docker exec -it mysql-slave bash
mysql -u root -p
stop slave;
 CHANGE MASTER TO
       MASTER_HOST = 'mysql-master',
       MASTER_USER = 'root',
       MASTER_PASSWORD = 'root',
       MASTER_LOG_FILE = 'mysql-bin.000003',
       MASTER_LOG_POS = 514;
reset slave;
start slave;
show status slave\G

```
 
