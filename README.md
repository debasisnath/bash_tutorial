#### BASIC DOCKER COMMANDS

```bash

docker compose up

docker compose up --build

docker compose up -d  

docker compose down

# Rebuild
docker compose build


docker ps -a 


# The docker exec command runs a new command in a running container. The command runs in the default working directory of the container.
# type the "exit" command or press "Ctrl + D"

docker exec -it devbox /bin/bash


#  WARNING! This will remove:
# - all stopped containers
# - all networks not used by at least one container
# - all dangling images
# - unused build cache
# and optionally, volumes.

docker system prune -a --volumes



```

####   Add the Cron Job
```bash

crontab -e


*/1 * * * * /mnt/shared/system_status_logger.sh >> /dev/null  2>&1



```


## Manually start cron after running the container
```bash 
service cron start
crontab -e
```

