FROM ghcr.io/prefix-dev/pixi:latest

RUN apt-get update && apt-get install -y \
    make \
    && rm -rf /var/lib/apt/lists/*

COPY pyproject.toml pixi.lock /app/
RUN cd /app/ && pixi i --locked -e prod 
COPY . /app/

WORKDIR /app
# CMD ["pixi", "run", "--no-lockfile-update", "-e", "prod", "make", "start"]
CMD pixi run --locked -e prod make start
