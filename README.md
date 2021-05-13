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
