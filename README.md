### My dotfiles.


I got tired of re-writing these, so this repo is the configuration for my personal machines...

I'll include any shell scripts necessary, plus .bashrc, profile, aliases.

I'll also have a dpkg list from my linux box that I'll try to keep current.

====

#### Ubuntu packages

Commands for the dpkg files:

```shell
sudo apt-key add Repo.keys
sudo cp -r sources.list.d /etc/apt/sources.list.d
sudo cp sources.list /etc/apt/sources.list 
sudo apt-get update
sudo apt-get install dselect
sudo dpkg --set-selections < Package.list
sudo apt-get dselect-upgrade -y
```

Fresh versions of these files created with these commands:

```shell
dpkg --get-selections > Package.list
sudo cp -r /etc/apt/sources.list.d .
sudo cp /etc/apt/sources.list sources.list
sudo apt-key exportall > Repo.keys
```