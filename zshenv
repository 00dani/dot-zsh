# Initialise each of the XDG vars to their default values if they're unset.
: ${XDG_CACHE_HOME:=~/.cache}
: ${XDG_CONFIG_HOME:=~/.config}
: ${XDG_DATA_HOME:=~/.local/share}
: ${XDG_STATE_HOME:=~/.local/state}

# For XDG_RUNTIME_DIR, pick a temporary directory - the spec actually
# *requires* that it's destroyed when the user logs out, so that's handled by a
# file in zlogout. The reason for suffixing /xdg-$UID is that TMPDIR does not
# necessarily belong to the current user exclusively (although it does under
# MacOS and PAM). This is especially true if $TMPDIR isn't set at all and /tmp
# is used!
[[ -z $XDG_RUNTIME_DIR ]] && XDG_RUNTIME_DIR=${${TMPDIR-/tmp}%/}/xdg-$UID
if ! [[ -d $XDG_RUNTIME_DIR ]]; then
	mkdir -p $XDG_RUNTIME_DIR
	chmod 0700 $XDG_RUNTIME_DIR
fi
export XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME XDG_STATE_HOME XDG_RUNTIME_DIR

# The real zsh config lives in XDG_CONFIG_HOME! ;)
: ${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}
source $ZDOTDIR/zshenv
