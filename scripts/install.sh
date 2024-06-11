#!/bin/bash

for pkg in neovim starship ripgrep fzf bat eza fnm dust xh trash
do
	echo "-------"
	echo "Installing $pkg"
	echo "-------"
	brew install "$pkg"
done

npm i -g tldr