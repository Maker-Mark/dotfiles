# display with icons
alias ls="exa --icons -a"

# better git graph
alias gl="git log --all --graph --decorate --oneline"

# force confirm
alias rm='rm -i'

# go to main branch, whether named master or main
m() {
    for branch in master main
    do
	if [ "git branch --list $branch" ]
	then
	    git checkout $(branch)
	fi
    done
}
