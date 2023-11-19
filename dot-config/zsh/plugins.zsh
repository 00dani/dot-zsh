#! zsh

[[ ! -d $ZINIT[HOME_DIR] ]] && mkdir -p $ZINIT[HOME_DIR]
if [[ ! -d $ZINIT[BIN_DIR]/.git ]]; then
	git clone https://github.com/zdharma-continuum/zinit.git $ZINIT[BIN_DIR]
	zcompile $ZINIT[BIN_DIR]/zinit.zsh
fi
source $ZINIT[BIN_DIR]/zinit.zsh
load=light

zinit $load willghatch/zsh-saneopt

zinit $load mafredri/zsh-async
zinit $load rupa/z

zinit ice depth'1'
zinit $load romkatv/powerlevel10k

vivid_theme=molokai
(( $+commands[vivid] )) && zinit ice atclone'./build.sh' atpull'%atclone' run-atpull
zinit $load ryanccn/vivid-zsh

zinit wait lucid light-mode for \
	hlissner/zsh-autopair \
	mollifier/cd-gitroot \
	atinit"dot-zsh-compinit" \
		zdharma-continuum/fast-syntax-highlighting \
	atload"_zsh_autosuggest_start" \
		zsh-users/zsh-autosuggestions \
	blockf atpull'zinit creinstall -q .' \
		zsh-users/zsh-completions
