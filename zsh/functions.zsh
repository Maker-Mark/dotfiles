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

function tmp() {
	local rand_name="r$(LC_ALL=C tr -dc a-z0-9 </dev/urandom | head -c 6)"
	local temp_folder="/tmp/trash-dirs/${1:+$1-}$rand_name"
	mkdir -p "$temp_folder" && cd "$temp_folder" || return 1
}

function graduate() {
	folder_name=${1:-$(basename "$PWD")}

	new_path="$HOME/Workspace/$folder_name"
	if [ -d $new_path ]; then
       	echo "Error: Folder $new_path already exists. Aborting."
       	exit 1
	fi

	mv "$PWD" $new_path
	cd $new_path
}
