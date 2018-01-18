#! zsh

# Just show me the completions, *quietly*.
unsetopt list_beep

# If there are no completions, try to correct minor typos in the input.
zstyle :completion:* completer _complete _correct

# Load the nice LS_COLORS into the completion menu too. Pretty!
zstyle :completion:*:default list-colors ${(s.:.)LS_COLORS}

# Kiiiind of make colours work when listing command options. It's weird and
# messy. It works tho'.
zstyle :completion:*:options list-separator \|
zstyle :completion:*:options list-colors \
	"=(#b)(-##)([^ ]#) #(\\|)(*)=0=38;5;23=${color[bold]};${color[cyan]}=38;5;237=38;5;242" \
	"=(#b)(-##)([^ ]#)(*)=0=38;5;23=${color[bold]};${color[cyan]}" \
	"=(#b) #(\\|)(*)=0=38;5;237=38;5;242"

# List the first page, then let me menu through everything.
zmodload zsh/complist # so that listscroll is defined
zstyle :completion:* menu select
zstyle :completion:* list-prompt ' '
zstyle :completion:* select-prompt ' %F{blue}-- %m --%f'

# Permit expensive completions to cache info and therefore be usable.
zstyle :completion::complete:* use-cache on
zstyle :completion::complete:* cache-path $XDG_CACHE_HOME/zsh/compcache

# Group completions under cute headings.
zstyle :completion:* format ' %F{yellow}-- %d --%f'
zstyle :completion:*:corrections format ' %F{green}-- %d (errors: %e) --%f'
zstyle :completion:*:warnings format ' %F{red}-- no matches found --%f'
zstyle :completion:* group-name ''

# When listing directories, treat foo//bar as foo/bar, not foo/*/bar.
zstyle :completion:* squeeze-slashes true

# When completing the names of man pages, group them by section.
zstyle :completion:*:manuals    separate-sections true
zstyle :completion:*:manuals.*  insert-sections   true
