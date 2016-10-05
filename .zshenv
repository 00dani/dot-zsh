: ${XDG_CONFIG_HOME:=~/.config} ${XDG_CACHE_HOME:=~/.cache} ${XDG_DATA_HOME:=~/.local/share}
export XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME
: ${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}
source $ZDOTDIR/zshenv
