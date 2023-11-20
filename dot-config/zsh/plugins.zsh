#! zsh
: ${ZIM_HOME:=$XDG_CACHE_HOME/zim}
: ${ZIM_CONFIG_FILE:=$XDG_CONFIG_HOME/zsh/zimrc.zsh}
zstyle :zim:completion dumpfile ${XDG_CACHE_HOME:-~/.cache}/zsh/zcompdump.zsh

# Sure, I typically run MacOS, which uses a case-insensitive filesystem, but
# that doesn't mean I have to like it. ;)
zstyle ':zim:*' case-sensitivity sensitive

zstyle :zim:termtitle         hooks   preexec precmd
zstyle :zim:termtitle:preexec format '${${(A)=1}[1]}'
zstyle :zim:termtitle:precmd  format '%1~'

if [[ ! -e $ZIM_HOME/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o $ZIM_HOME/zimfw.zsh https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  zcompile $ZIM_HOME/zimfw.zsh
fi
if [[ ! $ZIM_HOME/init.zsh -nt $ZIM_CONFIG_FILE ]]; then
  source $ZIM_HOME/zimfw.zsh init -q
fi

source $ZIM_HOME/init.zsh
