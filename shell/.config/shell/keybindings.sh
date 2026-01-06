bindkey "^[[A" history-substring-search-up

fzf-zoxide() {
  zi
  zle accept-line
}

zle -N fzf-zoxide
bindkey '^[z' fzf-zoxide
