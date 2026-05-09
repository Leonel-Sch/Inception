*This project has been created as part of the 42 curriculum by [lscheupl].*

## Description
Inception is a System Administration project that aims to broaden knowledge of Docker and virtualization. The goal is to set up a small infrastructure of several services (NGINX, WordPress, MariaDB) under specific rules, ensuring each service runs in a dedicated container and communicates securely.

## Project Design & Choices
This stack is built using **Docker Compose** to orchestrate the services within a custom bridge network.
*   **Design Choice:** Each service is built from a custom `Dockerfile` based on **Debian Bullseye**, ensuring transparency and security over pre-built images.

### Technical Comparisons
| Topic | Docker | Virtual Machine / Other |
| :--- | :--- | :--- |
| **Virtualization** | Shared host OS kernel (Lightweight) | Full guest OS (Heavyweight) |
| **Secrets** | Environment Variables (Used here) | Docker Secrets (More secure, but Swarm only) |
| **Network** | Custom Bridge (Isolated) | Host Network (Shared with the VM/Host) |
| **Storage** | Named Volumes (Managed by Docker) | Bind Mounts (Linked to host path) |

## Instructions
1.  **Clone** the repository.
2.  Navigate to `srcs/` and create a `.env` file with your credentials.
3.  Run `make` at the root of the project.
4.  Access the site at `https://lscheupl.42.fr`.

## Resources
*   [Docker Documentation](https://docs.docker.com/)
*   [NGINX TLS Setup Guide](https://nginx.org/en/docs/http/configuring_https_it.html)
*   **AI Usage:** AI was used as a peer-mentor for debugging network connectivity between containers and understanding the nuances of the MariaDB bootstrap process.

## Evaluations
* To crash Nginx for example `docker exec -it nginx sh -c "nginx -s stop"`
* To see the volumes `ls -la /home/lscheupl/data/wordpress`   `ls -la /home/lscheupl/data/wordpress`
* 
* 
* 
* 
* 