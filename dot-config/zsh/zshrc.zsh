#! zsh
# For accurate instant prompt from Powerlevel10k, we need to load up the
# correct environment from direnv first.
(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv export zsh)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Optimised compinit taking advantage of zinit's completion handling, as well
# as compiling the resulting zcompdump file. Have zinit call this once
# everything is loaded using an atload ice.
dot-zsh-compinit() {
	[[ -d $ZINIT[ZCOMPDUMP_PATH] ]] || mkdir -p ${ZINIT[ZCOMPDUMP_PATH]:h}
	zicompinit || return $?
	zicdreplay || return $?
	([[ $ZINIT[ZCOMPDUMP_PATH].zwc -nt $ZINIT[ZCOMPDUMP_PATH] ]] || zcompile $ZINIT[ZCOMPDUMP_PATH]) &!
	return 0
}

source $ZDOTDIR/plugins.zsh
for f in $ZDOTDIR/interactive/*.zsh(N); source $f

[[ -o login ]] && for f in $ZDOTDIR/interactive+login/*.zsh(N); source $f

export POWERLEVEL9K_CONFIG_FILE=${ZDOTDIR}/p10k.zsh
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/p10k.zsh
[[ ! -f $POWERLEVEL9K_CONFIG_FILE ]] || source $POWERLEVEL9K_CONFIG_FILE

# If zsh init ends with a failing command (like a conditional) the prompt will
# show the "error" colour on first launch. To avoid this, we simply end with a
# true command:
true