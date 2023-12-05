#! zsh
# autoloaded functions must be declared in every kind of zsh: they aren't
# inherited in the environment so non-login shells need them, and you'll want
# to call one in a script so non-interactive shells need them.
autoload count
autoload dump
autoload enphp
autoload -Uz zargs zcalc zmv
