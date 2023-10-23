#! zsh
if (( $+commands[bat] )); then
	alias cat=bat
fi

if (( $+commands[lsd] )); then
	alias ls=lsd
	alias tree='lsd --tree'
fi

alias lsl='ls -lh'
alias pseudo=sudo

if (( $+commands[xdg-open] )); then
	alias ]=xdg-open
else
	alias ]=open
fi

alias cdu=cd-gitroot

# make sure ELinks can detect when it's in tmux
alias elinks="STY= elinks"
