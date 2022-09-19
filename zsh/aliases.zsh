# display with icons
alias ls="exa --icons -a"
# tree view
alias lt="exa --icons -a --tree"

# force confirm
alias rm='rm -i'

# node quick aliases
alias ni="npm ci"
alias ns="npm start"
alias nd="npm run dev"
alias nb="npm run build"
alias nt="npm run test"

# force confirm
alias rm='rm -i'

# better git graph
alias gl="git log --all --graph --oneline"
alias gc="git checkout"

# go to main branch, whether named master or main
gcm() {
	for branch in master main; do
		if [ "`git branch --list $branch`" ]; then
			git checkout $(branch)
		fi
	done
}
