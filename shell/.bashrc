# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -r "$HOME/.config/shell/aliases.sh" ] && . "$HOME/.config/shell/aliases.sh"
[ -r "$HOME/.config/shell/functions.sh" ] && . "$HOME/.config/shell/functions.sh"

PS1='[\u@\h \W]\$ '
