build:
	docker build -t alfalfalfa/mysql-master ./mysql-master
	docker build -t alfalfalfa/mysql-slave ./mysql-slave

connect_master:
	mysql -h 127.0.0.1 -uroot -proot -P 33306

connect_slave:
	mysql -h 127.0.0.1 -uroot -proot -P 33307

up:
	docker-compose up -d
down:
	docker-compose down
logs:
	docker-compose logs -f
