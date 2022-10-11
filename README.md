# My Neovim config

### Requirements:
* [Neovim 7.0 or newer](https://neovim.io/)
* [Nvim Packer](https://github.com/wbthomason/packer.nvim)
* [Lua](https://www.lua.org/)
* [NodeJS 16 or newer](https://nodejs.org/en/)
* [Npm](https://www.npmjs.com/)
* [Yarn](https://www.npmjs.com/package/yarn)
* Git
#### Optionally: 
* A Nerd Font for your terminal
  * [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
  * [Nerd Font collection](https://github.com/ryanoasis/nerd-fonts)
  * Or use any font you want!
 * Individual dependencies for the language servers
  * for example coc-python and jedi for the python programming language
  * clangd for c/c++

### Installation:
* Install Neovim 7 or newer
* Get packer:
``` bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
* Get the config:
``` bash
git clone https://github.com/NicoDevStuff/nvim.git ~/.config/nvim/
```

* Update/Sync Plugins
```bash
nvim -c PackerSync
```
* Build the [Autocompletion Engine](https://github.com/neoclide/coc.nvim)
```bash
cd ~/.local/share/nvim/site/pack/packer/start/coc.nvim
yarn install
yarn build
```

### Have fun!
