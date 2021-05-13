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
