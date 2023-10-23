# Initialise each of the XDG vars to their default values if they're unset.
: ${XDG_CACHE_HOME:=~/.cache}
: ${XDG_CONFIG_HOME:=~/.config}
: ${XDG_DATA_HOME:=~/.local/share}
: ${XDG_STATE_HOME:=~/.local/state}

export XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME XDG_STATE_HOME

# The other four XDG directories are very easy, but XDG_RUNTIME_DIR is
# complicated. It kinda needs to be managed by a systemwide supervisor, like
# systemd, in order to meet all of the XDG Base Directory specification's
# requirements? In particular, the directory is supposed to come into being
# when you log in, live as long as you have any active sessions, and be
# destroyed when you log out - none of this can easily be done from the shell
# environment alone, especially on an operating system like macOS where your
# graphical session wasn't spawned from a shell using something like .xinitrc.
#
# We're going to assume XDG_RUNTIME_DIR will have already be set by a
# systemwide supervisor if it can possibly have been. If it hasn't - say,
# because we're on macOS - we'll compromise by using TMPDIR. Since TMPDIR has
# a different lifetime than XDG_RUNTIME_DIR is supposed to, this is an
# imperfect solution, but it's the best we can do.
if [[ ! -d $XDG_RUNTIME_DIR ]] && [[ -d $TMPDIR ]]; then
	export XDG_RUNTIME_DIR=${TMPDIR}xdg-$UID
	mkdir -p $XDG_RUNTIME_DIR
	chmod 0700 $XDG_RUNTIME_DIR
fi

# The real zsh config lives in XDG_CONFIG_HOME! ;)
: ${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}
[[ $ZDOTDIR = $HOME ]] && ZDOTDIR=$XDG_CONFIG_HOME/zsh
source $ZDOTDIR/zshenv
