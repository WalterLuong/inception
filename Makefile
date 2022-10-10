all:
	sudo mkdir -p /home/wluong/data/html
	sudo mkdir -p /home/wluong/data/mysql
	cd srcs && docker-compose up -d --build --force-recreate

no_detach:
	sudo mkdir -p /home/wluong/data/html
	sudo mkdir -p /home/wluong/data/mysql
	cd srcs && docker-compose up --build --force-recreate

down:
	cd srcs && docker-compose down

rm_images:
	docker rmi -f $(shell docker images -qa)

rm_network:
	docker network rm $(shell docker network ls -q)

rm_volumes:
	docker volume rm $(shell docker volume ls -q)

stop:
	docker stop $(shell docker ps -qa)

start:
	docker start $(shell docker ps -qa)

rm_cont:
	docker rm $(shell docker ps -qa)

clean: rm_cont rm_images rm_volumes rm_network

fclean: clean
	sudo rm -rf /home/wluong
	
reboot:
	sudo rm -rf /home/wluong

prune:
	docker system prune -a
	sudo rm -rf /home/wluong

.PHONY: all no_detach _down rm_images rm_cont rm_network rm_volumes stop clean fclean