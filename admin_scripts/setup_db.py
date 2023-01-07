import glob
from subprocess import run
from time import sleep


def wait_for_postgresql() -> None:
    exit_code = 1
    while exit_code:
        sleep(2)
        result = run(['pg_ctl', 'status'])
        exit_code = result.returncode


def create_db(name: str) -> None:
    args = ['createdb', name]
    run(args)


def setup_schemas(db_name: str) -> None:
    # Exclude any non-sql scripts
    files = glob.glob('./admin_scripts/*.sql')
    # Scripts are preffixed with 00, 01 or 02.
    # We sort them because they need to be called
    # in the corresponding order
    files.sort()
    for file in files:
        args = ['psql', '-d', db_name, '-f', file]
        run(args)


if __name__ == '__main__':
    DB_NAME = 'sqlq4mm'
    wait_for_postgresql()
    create_db(DB_NAME)
    setup_schemas(DB_NAME)
