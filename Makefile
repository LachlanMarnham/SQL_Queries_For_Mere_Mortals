CONTAINER_NAME=sqlq4mm

docker-build:
	docker build -t postgres-with-python .

docker-run:
	docker run -d \
			   --name $(CONTAINER_NAME) \
			   -v `pwd`/admin_scripts:/admin_scripts \
			   -e POSTGRES_HOST_AUTH_METHOD=trust \
			   postgres-with-python

postgres-setup:
	docker exec -it -u postgres $(CONTAINER_NAME) \
			bash -c 'python3 admin_scripts/setup_db.py'

docker-shell:
	docker exec -it -u postgres $(CONTAINER_NAME) bash

docker-launch: docker-run postgres-setup docker-shell

docker-cleanup:
	docker kill $(CONTAINER_NAME) || true
	docker container rm $(CONTAINER_NAME)
