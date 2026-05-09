# User Documentation

## Services Provided
- **Web Server:** NGINX (SSL/TLS 1.2/1.3)
- **CMS:** WordPress (PHP-FPM)
- **Database:** MariaDB

## Getting Started
- **Start the stack:** `make`
- **Stop the stack:** `make down`
- **Full reset:** `make fclean`

## Access
- **Website:** [https://lscheupl.42.fr](https://lscheupl.42.fr)
- **Admin Panel:** [https://lscheupl.42.fr/wp-admin](https://lscheupl.42.fr/wp-admin)

## Managing Credentials
Credentials are stored in the `srcs/.env` file. You will find:
- DB User/Password
- WordPress Admin/User info
- If it's the first clone, it obviously need to be added (we dont git credentials here)

## Health Check
Run `docker ps` to ensure all 3 containers show `Up`. Use `docker-compose logs -f` to monitor real-time activity.