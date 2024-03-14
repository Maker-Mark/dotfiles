export ZDOTDIR=$HOME/.config/zsh

function zsh_add_file() {
    [ -f "$ZDOTDIR/$1.zsh" ] && source "$ZDOTDIR/$1.zsh"
}

function zsh_add_plugin() {
	PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
	if [ ! -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
		git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME" --depth 1
	fi

	zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin"
	zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME"
}

fpath+="$ZDOTDIR/completions"
function zsh_add_completion() {
	FILE_PATH="$ZDOTDIR/completions/$(basename $1)"

	[ ! -f $FILE_PATH ] && \
		curl "https://raw.githubusercontent.com/$1" --create-dirs -o $FILE_PATH

	zsh_add_file $FILE_PATH
}

function rnd() {
	local rand_name="$(head /dev/urandom | LC_ALL=C tr -dc A-Za-z0-9 | head -c 13)"
	local rand_folder="/tmp/$rand_name"
	mkdir -p "$rand_folder" && cd "$rand_folder" || return 1
}
