# Dotfiles

These are my unix dotfiles. 

While I spent a lot of time tinkering with neovim in the past, I don't have the patience to keep up with breaking changes in plugin management and language servers. I now use [AstroNvim](https://docs.astronvim.com/).

### Install

- `./scripts/install.sh` to install CLI programs used in aliases.
- `./scripts/setup.sh` to clone neovim config and symlink zsh.
- [Optional] `./scripts/config.sh` for some git configs.

## CLI Programs
- neovim - better vim
- starship - shell prompt
- ripgrep - better grep
- bat - better cat
- eza - colorized ls
- fnm - node version manager
- tldr - lookup common commands
- fzf - general fuzzy search
- dust - better du
- xh - simpler curl
- trash - faster and safer way to delete content