for f in ~/.zsh/interactive/*; source $f
[[ -o login ]] && for f in ~/.zsh/interactive+login/*; source $f
