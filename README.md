# SQL Queries for Mere Mortals - Solutions
Solutions to `SQL Queries for Mere Mortals` 4th Ed., by John L. Viescas. 

The contents of `./relationships`, `./schemas` and `./admin_scripts` are all
downloaded from [here](https://www.informit.com/store/sql-queries-for-mere-mortals-a-hands-on-guide-to-data-9780134858333).

For compatibility with the book, a legacy version of `Postgres` is being used.
The Docker image used is `arm64v8/postgres:9.6` which will fail on non-ARM architectures.

# Setup
1. `make docker-launch` will run the `Postgres` container, and open a shell
into it with the `postgres` user. `postgres` is the superuser, and has permissions
to create dbs, modify schemas, read/write and so on.
2. 