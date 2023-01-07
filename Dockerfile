FROM arm64v8/postgres:9.6

RUN apt-get -y update || true
RUN apt-get install -y python3