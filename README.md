# Redis Sentinel

Here's a small multi-node sandbox for testing Redis Sentinel.

Uses ~~Vagrant, Virtualbox, Chef,~~ Docker and.. Redis Sentinel.

### Requirements
* Docker

```sh
brew install docker docker-completion
```

### Usage

Starting: `docker compose up -d`

If you need more hosts you can scale slaves and sentinels using `--scale`

`docker compose up -d --scale redis-slave=2 --scale redis-sentinel=3`

Stopping: `docker compose down`

### Endpoints

Endpoint ports are generated at random by Docker. Use `docker ps` to see what
is assigned.

```sh
$ docker ps
CONTAINER ID   ...   PORTS                      NAMES
259b695ac746   ...   0.0.0.0:61437->26379/tcp   sentinel_redis-sentinel_1
b7dc76fdf21c   ...   0.0.0.0:61438->26379/tcp   sentinel_redis-sentinel_2
a444bae88906   ...   0.0.0.0:61435->6379/tcp    sentinel_redis-slave_1
e1c2e92f6713   ...   0.0.0.0:61436->6379/tcp    sentinel_redis-slave_2
78db319d76ab   ...   0.0.0.0:61383->6379/tcp    sentinel_redis_1
```

From the example above the endpoints to use would be
* Redis: `redis://127.0.0.1:61383/0`
* Sentinel: `redis://127.0.0.1:61437/0`

You can directly connect to them via `redis-cli`

```sh
$ redis-cli -p 61437
127.0.0.1:61437> info sentinel
# Sentinel
sentinel_masters:1
sentinel_tilt:0
sentinel_running_scripts:0
sentinel_scripts_queue_length:0
sentinel_simulate_failure_flags:0
master0:name=mymaster,status=ok,address=172.25.0.2:6379,slaves=2,sentinels=3
```
