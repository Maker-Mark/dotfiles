# display with icons
alias ls="eza --grid --icons -a"
# tree view
alias lt="eza --icons -a --tree"

# force confirm
alias rm='rm -i'

# better git graph
alias gl="git log --all --graph --oneline"
alias gc="git checkout"
alias gb="git blame -w -C -C -C"

# better cat
alias cat="bat"

# display paths on separate lines
alias paths="echo $PATH | tr ':' '\n'"
