# Neovim config

### Requirements:
* [Neovim 7.0 or newer](https://neovim.io/)
* [Nvim Packer](https://github.com/wbthomason/packer.nvim)
* [Lua](https://www.lua.org/)
* [Python 3](https://www.python.org/)
* [Pip 3](https://www.python.org/)
* Git

#### Optionally: 
* A Nerd Font for your terminal
  * [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
  * [Nerd Font collection](https://github.com/ryanoasis/nerd-fonts)
  * Or use any font you want!

### Installation:
* Install [Neovim 7](https://neovim.io/) or newer
* Get [packer](https://github.com/wbthomason/packer.nvim):
``` bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
* Clone the config:
``` bash
git clone https://github.com/NicoDevStuff/nvim.git ~/.config/nvim/
```

* Update/Sync Plugins
```bash
nvim -c PackerSync
```
NOTE: This wil cause some errors, which are fine. Just keep running this command until there are no errors! 

* Install the Python dependencies
```bash
pip3 install pynvim
```
### Now the config is completely installed and ready to use! 🥳
