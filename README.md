# Dotfiles

Currently this is Unix only. Have yet to have a usecase where WSL wasn't possible, so this will break on plain windows.

```bash
ln -s ./nvim ~/.config/nvim
ln -s ./.zshrc ~/.zshrc
ln -s ./zsh ~/.config/zsh
```

## Neovim

1. install [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) > 0.7
2. install [Packer](https://github.com/wbthomason/packer.nvim#quickstart)
3. move config or simlink with `ln -s ./nvim ~/.config/nvim`
4. Install desired LSP servers with `:LspInstall <servers>`

## CLI Programs
- lazygit - git TUI
- tldr - lookup common commands
- fzf - general fuzzy search
- exa - colorized ls
- starship - shell prompt
- ripgrep - better grep
- fnm - node version manager
- bat - better cat
- lf - ranger, but not python
