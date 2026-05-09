all:
	@mkdir -p /home/$(USER)/data/mariadb
	@mkdir -p /home/$(USER)/data/wordpress
	@docker-compose -f srcs/docker-compose.yml up --build

down:
	@docker-compose -f srcs/docker-compose.yml down

re: down all

clean: down
	@docker system prune -a

fclean:
	@docker-compose -f srcs/docker-compose.yml down -v
	@sudo rm -rf /home/$(USER)/data/mariadb/*
	@sudo rm -rf /home/$(USER)/data/wordpress/*
	@docker system prune -af

.PHONY: all down re clean fclean