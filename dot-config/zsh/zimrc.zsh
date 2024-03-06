# Rather than writing eval "$(something init)" and having it called on every
# shell initialisation, zmodule-eval will run the given command once and
# zcompile its output, which is then sourced. Naturally this is vastly more
# efficient. Pass the external command's name as the first argument and the
# full Zsh commandline you'd normally write inside $() as the second. For
# example, to hook Direnv into your shell:
#   zmodule-eval direnv 'direnv hook zsh'
# https://github.com/zimfw/zimfw/issues/528#issuecomment-1949609155
zmodule-eval() {
  local -r ztarget=${2//[^[:alnum:]]/-}.zsh
  zmodule custom-${1} --use mkdir --if-command ${1} \
      --cmd "if [[ ! {}/${ztarget} -nt \${commands[${1}]} ]]; then ${2} >! {}/${ztarget}; zcompile -UR {}/${ztarget}; fi" \
      --source ${ztarget}
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
zmodule-eval vivid 'echo export LS_COLORS=${(qqq)"$(vivid generate catppuccin-mocha)"}'

zmodule fzf --name zimfw-fzf
zmodule junegunn/fzf --root shell --use degit --source completion.zsh --source key-bindings.zsh

zmodule hlissner/zsh-autopair
zmodule mollifier/cd-gitroot --fpath . --autoload cd-gitroot
zmodule unixorn/git-extra-commands
zmodule xPMo/zsh-toggle-command-prefix
zmodule zsh-users/zsh-autosuggestions

(( ${+commands[brew]} )) && zmodule homebrew
zmodule-eval atuin 'atuin init zsh --disable-up-arrow'
zmodule-eval direnv 'direnv hook zsh'
zmodule-eval scmpuff 'scmpuff init --shell=zsh'

# Additional completion definitions for Zsh.
zmodule zsh-users/zsh-completions --fpath src
# Enables and configures smart and extensive tab completion.
# completion *must* be sourced after all modules that add completion definitions to fpath.
zmodule completion

# Initialise Zoxide after compinit, because it calls compdef if available.
zmodule-eval zoxide 'zoxide init zsh'

# Fish-style syntax highlighting as you type, making the Zsh experience much more friendly!
zmodule zdharma-continuum/fast-syntax-highlighting
# Hacks! The fast-theme function provides its own caching, so we only want to call it when the theme actually updates.
zmodule catppuccin/zsh-fsh --name 'catppuccin-for-fsh' --on-pull 'echo "fast-theme $PWD/themes/catppuccin-mocha.ini && echo >! $PWD/init.zsh" >! init.zsh'

unfunction zmodule-eval
