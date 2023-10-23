#! zsh
: ${N_PREFIX:=$HOME/.local}
: ${NPM_CONFIG_USERCONFIG:=$XDG_CONFIG_HOME/npm/config}
: ${NODE_REPL_HISTORY:=$XDG_DATA_HOME/node/repl_history}

# The npm configuration file can't be safely committed to version control,
# because things like authorisation tokens for publishing packages to npmjs.org
# live in there. Instead, let's generate a basic npm config here if it doesn't
# already exist.
if [[ ! -a $NPM_CONFIG_USERCONFIG ]]; then
	mkdir -p $NPM_CONFIG_USERCONFIG:h
	> $NPM_CONFIG_USERCONFIG {
		echo cache=$XDG_CACHE_HOME/npm
		echo prefix=$HOME/.local
		echo store-dir=$XDG_CACHE_HOME/pnpm-store
	}
fi

# Node won't create the directory to store its own REPL history if it isn't
# there? It'll just fail to store REPL history. So let's ensure the directory
# exists by ourselves.
mkdir -p $NODE_REPL_HISTORY:h
export N_PREFIX NPM_CONFIG_USERCONFIG NODE_REPL_HISTORY
