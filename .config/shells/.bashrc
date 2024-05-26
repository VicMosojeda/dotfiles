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

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Node
echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/node@20/bin:$PATH"' >> $HOME/.bash_profile

export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/node@20/lib"
export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/node@20/include"

# Configuración de Java
export JAVA_HOME=$(brew --prefix openjdk)/libexec/openjdk.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"