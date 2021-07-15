#! zsh
if (( $+commands[sk] )); then
	# TODO: figure out where lotabout/skim puts these Zsh support files on non-Homebrew installs
	[[ $- == *i* ]] && source /usr/local/opt/sk/share/zsh/site-functions/completion.zsh 2>/dev/null
	source /usr/local/opt/sk/share/zsh/site-functions/key-bindings.zsh
else
	bindkey '^R' history-incremental-search-backward
fi
