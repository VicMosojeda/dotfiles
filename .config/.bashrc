#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '

PS1='\[\e[0;33m\][ \W]\[\e[0;31m\] >\[\e[0;35m\]>\[\e[0;33m\]>\[\e[0m\] '

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte.sh
fi

# Alias
alias ls='lsd'
alias cat='bat'
# Hyprland
# alias wupdate='~/.config/waybar/wupdate.sh'
# alias wliveupdate='~/.config/waybar/wliveupdate.sh'
# Qtile
alias wupdate='~/.config/qtile/wupdate.sh'
alias wliveupdate='~/.config/qtile/wliveupdate.sh'

# NVM
export NVM_DIR="$HOME/.nvm"
if [ -s "/usr/share/nvm/nvm.sh" ]; then
	. "/usr/share/nvm/nvm.sh" # Esta línea carga `nvm`
fi

# SKDMAN
source "$HOME/.sdkman/bin/sdkman-init.sh"
