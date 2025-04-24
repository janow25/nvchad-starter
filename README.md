*Informations*
This is a fork from the nvchad-starter repo. Added in Plugins are:
- Copilot
- blink
- start-page
- ...

**Installation**

```bash
git clone https://github.com/janow25/nvchad-starter.git ~/.config/nvim && nvim
```

**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

# Install nvim for with older glibc
```bash
wget https://github.com/neovim/neovim-releases/releases/download/v0.11.0/nvim-linux-x86_64.tar.gz
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -s /opt/nvim-linux-x86_64/bin/nvim /usr/bin/nvim
```
