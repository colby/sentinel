# Redis Sentinel

Here's a small multi-node sandbox for testing Redis Sentinel.

Uses ~~Vagrant, Virtualbox, Chef~~, Docker and.. Redis Sentinel.

### Requirements
* Docker

```sh
brew install docker docker-completion
```

### Usage

Starting: `docker compose up --remove-orphans -d --scale redis-slave=2 --scale redis-sentinel=2`

Stopping: `docker compose down`

### Endpoints

Endpoint ports are generated at random by Docker. Use `docker ps` to see what is assigned.

```sh
$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS         PORTS                      NAMES
259b695ac746   82be80696764   "/opt/bitnami/script…"   12 seconds ago   Up 3 seconds   0.0.0.0:61437->26379/tcp   sentinel_redis-sentinel_1
b7dc76fdf21c   82be80696764   "/opt/bitnami/script…"   13 seconds ago   Up 1 second    0.0.0.0:61438->26379/tcp   sentinel_redis-sentinel_2
a444bae88906   f44f575040c1   "/opt/bitnami/script…"   13 seconds ago   Up 8 seconds   0.0.0.0:61435->6379/tcp    sentinel_redis-slave_1
e1c2e92f6713   f44f575040c1   "/opt/bitnami/script…"   14 seconds ago   Up 6 seconds   0.0.0.0:61436->6379/tcp    sentinel_redis-slave_2
78db319d76ab   f44f575040c1   "/opt/bitnami/script…"   3 minutes ago    Up 2 minutes   0.0.0.0:61383->6379/tcp    sentinel_redis_1
```

#### Services

In the context to the previous `docker ps`;

* Redis: `redis://127.0.0.1:61383/0`
* Sentinal: `redis://127.0.0.1:61437/0`

```sh
$ redis-cli -p 61437
127.0.0.1:61437> info sentinel
# Sentinel
sentinel_masters:1
sentinel_tilt:0
sentinel_running_scripts:0
sentinel_scripts_queue_length:0
sentinel_simulate_failure_flags:0
master0:name=mymaster,status=ok,address=172.25.0.2:6379,slaves=2,sentinels=6
```
