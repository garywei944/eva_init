# eva_bin

## Overview
`evinit.sh` is used to initialize many kinds of Ubuntu 18 instance including my personal laptop, WSL, vagrant, or server instances. It installs necessary dependencies and applications and sets up configurations according to my preference automatically.

## Usage
1. Open Terminal and `cd` into the directory containing `evinit.sh`
2. Run `bash evinit.sh <commands>`
3. `<commands>` needs to be one or many of the follows
    * common
    * ubuntu
    * wsl
    * vagrant
    * ...
  
Note that this is not the full list of `<commands>`. It could be any function defined in `evinit.sh`, `src/evapt.sh`, and `evconfig.sh`.
