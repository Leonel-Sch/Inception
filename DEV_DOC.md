# Developer Documentation

## Setup & Prerequisites
- **OS:** Linux (Debian/Ubuntu preferred)
- **Tools:** Docker, Docker Compose, Make.
- **Config:** Create a `.env` file in `srcs/` using the provided template.

## Build Process
The project uses a **Makefile** to simplify Docker Compose commands.
- `make all`: Builds images and starts containers.
- `make re`: Rebuilds the images from scratch.

## Container Management
- **Enter a container:** `docker exec -it <container_name> sh`
- **Check volumes:** `docker volume ls`

## Data Persistence
Data is stored on the host machine to ensure persistence even if containers are deleted:
- **MariaDB:** `/home/lscheupl/data/mariadb`
- **WordPress:** `/home/lscheupl/data/wordpress`
These are linked via **Local Bind Volumes** defined in the `docker-compose.yml`.