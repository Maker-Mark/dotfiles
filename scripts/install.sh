#!/bin/bash

for pkg in neovim starship ripgrep fzf bat eza fnm dust xh trash hyperfine watchexec tlrc fd
do
	echo "-------"
	echo "Installing $pkg"
	echo "-------"
	brew install "$pkg"
done