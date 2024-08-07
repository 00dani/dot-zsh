#! zsh

local -a newbins

# asdf
export ASDF_CONFIG_FILE=$XDG_CONFIG_HOME/asdf/asdfrc
export ASDF_DATA_DIR=$XDG_DATA_HOME/asdf
# Don't add asdf's directories to the command path, because evaluating its
# version resolution every time you call a tool is really slow. Instead just
# configure asdf to respect XDG base directories, then rely on Direnv to
# resolve paths properly for each project, as described here:
# https://github.com/zimfw/asdf#how-to-configure-asdf-to-work-with-the-direnv-installed-with-my-system-package-manager

# docker
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker

# go
[[ -z $GOPATH ]] && export GOPATH=$XDG_DATA_HOME/go
newbins+=($XDG_DATA_HOME/go/bin)

# haskell
newbins+=(~/.cabal/bin ~/Library/Haskell/bin)
export STACK_ROOT=$XDG_DATA_HOME/stack

# less
# not exactly a 'lang' but still
export LESSHISTFILE=$XDG_DATA_HOME/less/history

# mysql
export MYSQL_HISTFILE=$XDG_DATA_HOME/mysql/history

# o'caml
export OPAMROOT=$XDG_DATA_HOME/opam
[[ -f $OPAMROOT/opam-init/init.zsh ]] && source $OPAMROOT/opam-init/init.zsh

# ooc
if (( $+commands[rock] )); then
	export -UT OOC_LIBS ooc_libs
	ooc_libs=(/usr/local/Cellar/rock/*(N) $XDG_DATA_HOME/ooc)
	newbins+=($XDG_DATA_HOME/ooc/sam/bin)
fi

# ruby
newbins+=(~/.gem/ruby/*/bin(N) /usr/local/opt/ruby/bin /usr/local/lib/ruby/gems/*/bin(N))
export BUNDLE_USER_CONFIG=$XDG_CONFIG_HOME/bundle
export BUNDLE_USER_CACHE=$XDG_CACHE_HOME/bundle
export BUNDLE_USER_PLUGIN=$XDG_DATA_HOME/bundle

# rust
export CARGO_HOME=$XDG_DATA_HOME/cargo
newbins+=($CARGO_HOME/bin)

# perl
export -UT PERL_LOCAL_LIB_ROOT perl_local_lib_root
export -UT PERL5LIB perl5lib
perl_local_lib_root=($XDG_DATA_HOME/perl5 $perl_local_lib_root)
perl5lib=($XDG_DATA_HOME/perl5/lib/perl5 $perl5lib)
newbins+=($XDG_DATA_HOME/perl5/bin)

export PERL_MB_OPT="--install_base '$XDG_DATA_HOME/perl5'";
export PERL_MM_OPT="INSTALL_BASE=$XDG_DATA_HOME/perl5";

# php
export PHIVE_HOME=$XDG_DATA_HOME/phive
# I have no idea why Composer decided that the right place to install global
# packages is $XDG_CONFIG_HOME. It *clearly* should be $XDG_DATA_HOME. But
# there you go, I guess.
newbins+=($XDG_CONFIG_HOME/composer/vendor/bin)

# postgres
export PSQL_HISTORY=$XDG_DATA_HOME/psql/history

# python
export -UT PYTHONPATH pythonpath
newbins+=(~/Library/Python/*/bin(N))
# pipenv already uses $XDG_DATA_HOME, but pyenv doesn't, so we need to
# configure it explicitly.
export PYENV_ROOT=$XDG_DATA_HOME/pyenv
export PYENV_SHELL=zsh
newbins+=($XDG_DATA_HOME/pyenv/shims $HOME/.poetry/bin)

# redis
export REDISCLI_HISTFILE=$XDG_DATA_HOME/redis/rediscli_history

# sqlite
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite/history

path=($newbins $path)
