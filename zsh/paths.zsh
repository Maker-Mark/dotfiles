export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/share/go/bin:$PATH
export PATH=$HOME/.fnm:$PATH

[ -f $HOME/.cargo ] && source $HOME/.cargo/env
eval "$(fnm env)"
