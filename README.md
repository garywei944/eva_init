# One-click initialize Ubuntu instance

## Overview
`init.sh` is used to initialize many kinds of Ubuntu 20 instances including PC(Pure Ubuntu), WSL, vagrant, or server instances(AWS EC3, Vultr.com server, etc). It installs necessary dependencies and applications.

By default, the scripts won't set up my personal configurations and private keys unless the environment variable `EVA` is set.

I keep my configuration files under `./config`, custom commands under `./bin`, and some documentation under `./docs`.

## Usage
```bash
[EVA=] ./init.sh <command>
```
For instance, if I create a new server from any cloud service provider, all I need to do is to run
```bash
./init.sh server
```
and enter the password if needed, then I'm all set.

If I want to install `docker` on the machine, I'll do
```bash
./init.sh docker
```
If I want to set up the `/etc/sudoers` file so that I won't need to enter the passwd to run `sudo`, I'll do
```bash
./init.sh config_sudo
```

However, if I want to set default shell to `zsh` and import my configuration for `oh-my-zsh` and `spacemacs`, I'll do
```bash
EVA= ./init.sh config_terminal
```
All `<command>` are defined by the scripts within `src` folder and are declared within the type of bash functions.

### Type of instance
* `ariseus` - my personal computer, fix dual-system bugs and set up disk configurations
* `desktop` - virtual machine or PC with pure Ubuntu 20 installation
* `server` - AWS EC2 instance or other ubuntu server. Install `basic` and Shadowsocks R
* `wsl` - reinstall `openssh-server` and set up ssh listening port on `port 2233`.
* `vagrant` - similar to how `server` is set up, but no Shadowsocks R set up. Set up ssh listening port on `port 2233`.


### App name to be installed
* `basic` - install all development environments and necessary terminal utils, including `zsh`, `build-essential`, `python`, etc.
* `apt_desktop` - install useful software for desktop including `gparted`, `vlc`, `kazam`, etc.
* `chrome` - install the latest stable version using `.deb` package.
* `docker` - follows the official document to install docker
* `sublime` - install sublime text 3 and sublime merge via `apt`
* ... - Other available apps are included in [Optional apps](#optional-apps)

### Configurations
*Note that only `config_sudo` runs without the environment variable `$EVA` set since they all import my personal configurations*
* `config_sudo` - make `sudo` not need to enter password
* `config_git` - add git configuration and add `github.com` to `authorized_keys`
* `config_terminal` - configure `zsh`, `emacs`, and clone this repo to `~/.eva`
* `config_vim` - add vim configuration and download dependencies
* `config_server` - add `id_rsa.pub` to `authorized_keys`
* `config_shadowsocks_server` - update configuration for `shadowsocks-libev`
* `config_sublime` - download my configuration from [aris_st3](https://github.com/garywei944/aris_st3) and install dependencies.
* `config_conda` - add conda configuration
* `config_vagrant` - add `~/Vagrantfile` and set it to Ubuntu 20.04
* `config_sys` - update `/etc/default/grub` and `/etc/fstab`, specified for my PC
* `config_time` - fix win10 and ubuntu dual-system time conflict
* `config_wsl` - set up wsl according to [WSL-CLion](https://www.jetbrains.com/help/clion/how-to-use-wsl-development-environment-in-product.html)

## Optional commands
* `driver` - equivalent to run `sudo ubuntu-drivers autoinstall`
* `disable_nouveau`
* `config_cuda_11` - update `PATH` in `~/.zshrc`

## Optional apps
`init.sh` will read and install all apps within `optional_apps.txt`. They work the same way with `<command>`.
* `chrome`
* `docker`
* `albert`
* `netease_music`
* `discord`
* `pymol`
* `tweaks`
* `wine`
* `steam`
* `timeshift`
* `metasploit` - *(Deprecated since source list unavailable)*

## Performance
It takes me about 7 min to finish `./init.sh desktop` on a pure Ubuntu 20.04 VMware virtual machine using half(16) cores of AMD Ryzen 3950X. Without the script, normally it would take hours to days to fully set up an Ubuntu instance(install apps + set up configurations).

## TODO
* Install `wechat`
* Automatically set up `config_sys`
* Automatically set up `config_shadowsocks_server`
* Make a solution to update private keys and tokens regularly (for security reasons).
