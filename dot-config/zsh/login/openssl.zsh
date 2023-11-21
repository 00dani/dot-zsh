#! zsh
: ${RANDFILE:=$XDG_CACHE_HOME/openssl/rnd}
mkdir -p $XDG_CACHE_HOME/openssl
export RANDFILE
