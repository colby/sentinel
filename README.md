# Redis Sentinel

Here's a small multi-node sandbox for testing Redis Sentinel.

Uses Vagrant, Virtualbox, Chef, and.. Redis Sentinel.

### Requirements
* Vagrant
* Virtualbox

```sh
brew cask install vagrant
brew cask install virtualbox
```

### Usage

Starting: `vagrant up --provision`
Stopping: `vagrant halt`
Removing: `vagrant destroy -f`

### Endpoints

#### IPs
* master: 192.168.3.10
* slave1: 192.168.3.11
* slave2: 192.168.3.12

#### Services
* Redis: `redis://192.168.3.10:6379/0`
* Sentinal: `redis://192.168.3.10:26379/0`

```sh
$ redis-cli -p 6379 -h 192.168.3.10 info replication
# Replication
role:master
connected_slaves:2
slave0:ip=192.168.3.11,port=6379,state=online,offset=813,lag=0
slave1:ip=192.168.3.12,port=6379,state=online,offset=813,lag=1
master_repl_offset:813
repl_backlog_active:1
repl_backlog_size:1048576
repl_backlog_first_byte_offset:2
repl_backlog_histlen:812
```
