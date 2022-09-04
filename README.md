# Dotfiles

Currently this is Unix only. Have yet to have a usecase where WSL wasn't possible, so this will break on plain windows.

### Symlink & Setup
```bash
ln -s "$(pwd)"/nvim ~/.config/nvim
ln -s "$(pwd)"/zsh ~/.config/zsh
echo "source ~/.config/zsh/.zshrc" >> ~/.zshrc
```

## Neovim

1. install [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) > 0.7
2. install [Packer](https://github.com/wbthomason/packer.nvim#quickstart)
3. move config or simlink with `ln -s ./nvim ~/.config/nvim`
4. Install desired LSP servers with `:LspInstall <servers>`

### Install
macos
```bash
brew install neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## CLI Programs
- lazygit - git TUI
- tldr - lookup common commands
- fzf - general fuzzy search
- exa - colorized ls
- dust - better du
- starship - shell prompt
- ripgrep - better grep
- fnm - node version manager
- bat - better cat
- lf - ranger, but not python

### Install
macos
```bash
for pkg in starship ripgrep lazygit fzf bat exa fnm lf dust
do
	brew install "$(pkg)"
done

npm i -g tldr
```
