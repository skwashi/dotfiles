# TRAMP / dumb terminal guard
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

# oh-my-zsh
source ~/.config/shell/omz.sh

# shared shell components
[[ -r ~/.config/shell/aliases.sh ]] && source ~/.config/shell/aliases.sh
[[ -r ~/.config/shell/functions.sh ]] && source ~/.config/shell/functions.sh
[[ -r ~/.config/shell/keybindings.sh ]] && source ~/.config/shell/keybindings.sh
[[ -r ~/.config/shell/prompt.sh ]] && source ~/.config/shell/prompt.sh
[[ -r ~/.config/shell/vterm.sh ]] && source ~/.config/shell/vterm.sh

# completions (zsh-native; OMZ expects this)
autoload -U compinit compdef
compinit

# tools
eval "$(zoxide init zsh)"
