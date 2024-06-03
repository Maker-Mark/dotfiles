# display with icons
alias ls="eza --grid --icons -a"
# tree view
alias lt="eza --icons -a --tree"

# force confirm
alias rm='rm -i'

# node quick aliases
alias ni="npm ci"
alias ns="npm start"
alias nd="npm run dev"
alias nb="npm run build"
alias nt="npm run test"


alias y="yarn"
alias ya="yarn add"
alias ys="yarn start"

# force confirm
alias rm='rm -i'

# better git graph
alias gl="git log --all --graph --oneline"
alias gc="git checkout"
alias rebase-main="gc main && git pull && gc - && git rebase main"
alias gb="git blame -w -C -C -C"

# better cat
alias cat="bat"

