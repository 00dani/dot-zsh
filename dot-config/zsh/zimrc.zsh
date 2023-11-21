zmodule willghatch/zsh-saneopt --source saneopt.plugin.zsh
zmodule environment

zmodule mafredri/zsh-async --source async.zsh

zmodule input
zmodule run-help
zmodule termtitle
zmodule utility

zmodule romkatv/powerlevel10k --use degit
zmodule ryanccn/vivid-zsh --cmd 'vivid_theme=molokai source {}/vivid-zsh.plugin.zsh' --on-pull '(( ${+commands[vivid]} )) && ./build.sh'

zmodule hlissner/zsh-autopair
zmodule mollifier/cd-gitroot --fpath . --autoload cd-gitroot
zmodule kiesman99/zim-zoxide
zmodule zsh-users/zsh-autosuggestions

(( ${+commands[brew]} )) && zmodule homebrew

# Additional completion definitions for Zsh.
zmodule zsh-users/zsh-completions --fpath src
# Enables and configures smart and extensive tab completion.
# completion *must* be sourced after all modules that add completion definitions.
zmodule completion

# Fish-style syntax highlighting as you type, making the Zsh experience much more friendly!
zmodule zdharma-continuum/fast-syntax-highlighting
