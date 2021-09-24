# Redis Sentinel

Here's a small multi-node sandbox for testing Redis Sentinel.

Uses ~~Vagrant, Virtualbox, Chef~~, Docker and.. Redis Sentinel.

### Requirements
* Docker

```sh
brew install docker docker-completion
```

### Usage

Starting: `docker compose up -d --scale sentinel=3 --scale slave=2`
Stopping: `docker compose down`

### Endpoints

#### Services
* Redis: `redis://127.0.0.1:6379/0`
* Sentinal: `redis://127.0.0.1:26379/0`

```sh
$ redis-cli -p 60696
127.0.0.1:60696> info sentinel
# Sentinel
sentinel_masters:1
sentinel_tilt:0
sentinel_running_scripts:0
sentinel_scripts_queue_length:0
sentinel_simulate_failure_flags:0
master0:name=mymaster,status=ok,address=172.25.0.2:6379,slaves=2,sentinels=6
```
