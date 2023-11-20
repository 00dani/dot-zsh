#! zsh

# Tweaks to vi mode:
bindkey 'jj' vi-cmd-mode # inoremap jj <Esc>
bindkey -M vicmd K run-help # 'keywordprg'

# Backward-kill long paths one directory at a time.
autoload -U backward-kill-word-match
zle -N backward-kill-word-match
bindkey '^W' backward-kill-word-match
zstyle ':zle:backward-kill-word-match' word-style unspecified
zstyle ':zle:backward-kill-word-match' word-chars ' /'

# Make ^Z resume your suspended job if there is one.
autoload fancy-ctrl-z
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
