# Initialise each of the XDG vars to their default values if they're unset.
: ${XDG_CACHE_HOME:=~/.cache}
: ${XDG_CONFIG_HOME:=~/.config}
: ${XDG_DATA_HOME:=~/.local/share}
: ${XDG_STATE_HOME:=~/.local/state}

export XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME XDG_STATE_HOME

# The real zsh config lives in XDG_CONFIG_HOME! ;)
: ${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}
source $ZDOTDIR/zshenv
