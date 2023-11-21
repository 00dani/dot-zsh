# Rather than writing eval "$(something init)" and having it called on every
# shell initialisation, zeval will use Zim's --on-pull hook to run the command
# once and cache the output, as well as zcompile it. Pass a descriptive, unique
# name as the first argument and the Zsh command you'd normally write inside
# $() as the second. For example, to hook Direnv into your shell:
#   zeval direnv 'direnv hook zsh'
zeval() {
  zmodule https://git.00dani.me/00dani/null --name zeval-$1 --on-pull "$2 >! init.zsh"
}

# Hook a command into Zsh, only if that command is installed. Pass the
# command's name as the first argument and the commandline you want to evaluate
# as the second. Works in the same way as zeval, but silently omits the module
# from your setup if the necessary command is not installed.
zeval-if-installed() {
  (( ${+commands[$1]} )) && zeval "$@"
}

zmodule willghatch/zsh-saneopt --source saneopt.plugin.zsh
zmodule environment

# Tell Zim about my own configuration. This has two benefits:
# - My personal functions/ directory will be added to fpath, and
# - Zim will automatically zcompile anything with a .zsh extension for me! :)
zmodule $ZDOTDIR --name dot/zsh

zmodule mafredri/zsh-async --source async.zsh

zmodule input
zmodule run-help
zmodule termtitle
zmodule utility

zmodule romkatv/powerlevel10k --use degit
zeval-if-installed vivid 'echo export LS_COLORS=${(qqq)"$(vivid generate molokai)"}'

zmodule hlissner/zsh-autopair
zmodule mollifier/cd-gitroot --fpath . --autoload cd-gitroot
zmodule zsh-users/zsh-autosuggestions

(( ${+commands[brew]} )) && zmodule homebrew
zeval-if-installed direnv 'direnv hook zsh'
zeval-if-installed scmpuff 'scmpuff init --shell=zsh'

# Additional completion definitions for Zsh.
zmodule zsh-users/zsh-completions --fpath src
# Enables and configures smart and extensive tab completion.
# completion *must* be sourced after all modules that add completion definitions to fpath.
zmodule completion

# Initialise Zoxide after compinit, because it calls compdef if available.
zeval-if-installed zoxide 'zoxide init zsh'

# Fish-style syntax highlighting as you type, making the Zsh experience much more friendly!
zmodule zdharma-continuum/fast-syntax-highlighting

unfunction zeval zeval-if-installed
