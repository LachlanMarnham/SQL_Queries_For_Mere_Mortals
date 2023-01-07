CONTAINER_NAME=sqlq4mm

docker-cleanup:
	docker kill $(CONTAINER_NAME) || true
	docker container rm $(CONTAINER_NAME)

docker-run:
	docker run -d \
			   --name $(CONTAINER_NAME) \
			   -v `pwd`/admin_scripts:/admin_scripts \
			   -e POSTGRES_HOST_AUTH_METHOD=trust \
			   arm64v8/postgres:9.6

docker-shell:
	docker exec -it -u postgres $(CONTAINER_NAME) bash

docker-launch: docker-run docker-shell