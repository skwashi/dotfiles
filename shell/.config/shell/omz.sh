export ZSH=/usr/share/oh-my-zsh

ZSH_THEME="af-magic"

HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
  git archlinux virtualenv npm fasd
  history-substring-search docker cp dirhistory
  gitignore git-extras git-prompt
  kubectx kube-ps1 helm kubectl pass
)

source $ZSH/oh-my-zsh.sh
