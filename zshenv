# Initialise each of the XDG vars to their default values if they're unset.
: ${XDG_CACHE_HOME:=~/.cache}
: ${XDG_CONFIG_HOME:=~/.config}
: ${XDG_DATA_HOME:=~/.local/share}

# For XDG_RUNTIME_DIR, pick a temporary directory - officially it should be
# destroyed when the user logs out but close enough. The reason for suffixing
# /xdg-$USER is that TMPDIR does not necessarily belong to the current user
# exclusively (although it does under MacOS and PAM).
[[ -z $XDG_RUNTIME_DIR ]] && XDG_RUNTIME_DIR=${${TMPDIR-/tmp}%/}/xdg-$LOGNAME
[[ -d $XDG_RUNTIME_DIR ]] || mkdir -p $XDG_RUNTIME_DIR
export XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME XDG_RUNTIME_DIR

# The real zsh config lives in XDG_CONFIG_HOME! ;)
: ${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}
source $ZDOTDIR/zshenv
