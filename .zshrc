# highlighting
autoload -Uz colors && colors
# shell prompt
eval "$(starship init zsh)"


# extend history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history


# tab completion
autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
# also keep dotfiles in tab completion
_comp_option+=(globdots)


# use lf (Ctrl+o) to pick dirs
lfcd() {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
	dir="$(cat "$tmp")"
	rm -f "$tmp"
	[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s "^o" "lfcd\n"


# file sourcer
export ZDOTDIR=$HOME/.config/zsh
function zsh_add_file() {
    [ -f "$ZDOTDIR/$1.zsh" ] && source "$ZDOTDIR/$1.zsh"
}

zsh_add_file 'vi-mode'
zsh_add_file 'aliases'
zsh_add_file 'paths'