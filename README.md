# One-click initialize Ubuntu instance

## Overview

`init.sh` is used to initialize many kinds of Ubuntu 20 instances including
WSL, vagrant, or server instances(AWS EC3, Vultr.com server, etc). It installs
necessary dependencies and applications.

By default, the scripts won't set up my personal configurations and private
keys unless the environment variable `EVA` is set.

## Usage

```bash
[EVA=] ./init.sh <command>
```

For instance, if I create a new server from any cloud service provider, all I
need to do is to run

```bash
./init.sh server
```

and enter the password if needed, then I'm all set.

If I want to install `docker` on the machine, I'll do

```bash
./init.sh docker
```

If I want to set up the `/etc/sudoers` file so that I won't need to enter the
passwd to run `sudo`, I'll do

```bash
./init.sh config_sudo
```

However, if I want to set default shell to `zsh` and import my configuration
for `oh-my-zsh` and `spacemacs`, I'll do

```bash
EVA= ./init.sh config_terminal
```

All `<command>` are defined by the scripts within `src` folder and are declared
within the type of bash functions.

### Type of instance

* `server` - AWS EC2 instance or other ubuntu server. Install `basic` and
  Shadowsocks R
* `sa_server` - Servers that I didn't have `sudo` permission.
* `wsl` - reinstall `openssh-server` and set up ssh listening port
  on `port 2233`.
* `vagrant` - similar to how `server` is set up, but no Shadowsocks R set up.
  Set up ssh listening port on `port 2233`.

### App name to be installed

* `basic` - install all development environments and necessary terminal utils,
  including `zsh`, `build-essential`, `python`, etc.
* `docker` - follows the official document to install docker

### Configurations

*Note that only `config_sudo` runs without the environment variable `$EVA` set
since they all import my personal configurations*

* `config_sudo` - make `sudo` not need to enter password
* `config_git` - add git configuration and add `github.com`
  to `authorized_keys`
* `config_terminal` - configure `zsh`, `emacs`, and clone this repo to `~/.eva`
* `config_vim` - add vim configuration and download dependencies
* `config_server` - add `id_rsa.pub` to `authorized_keys`
* `config_wsl` - set up wsl according
  to [WSL-CLion](https://www.jetbrains.com/help/clion/how-to-use-wsl-development-environment-in-product.html)
