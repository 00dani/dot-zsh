#! zsh
fpath=($ZDOTDIR/functions $fpath)

fpath=(${(u)^fpath:#.}(N))
# FPATH isn't exported by default like PATH is - to inherit the setting in
# non-login shells, we need to export it ourselves.
typeset -x FPATH
