#!/bin/bash

for pkg in neovim starship ripgrep fzf bat eza fnm dust xh trash
do
	brew install "$pkg"
done

npm i -g tldr