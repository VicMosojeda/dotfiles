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
alias wupdate='$HOME/.config/waybar/scripts/wupdate.sh'
alias wliveupdate='$HOME/.config/waybar/scripts/wliveupdate.sh'

# DEV
# Homebrew
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Node
# echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/node@20/bin:$PATH"' >> $HOME/.bash_profile
# echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/node@20/bin:$PATH"' >> $HOME/.bash_profile

# export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/node@20/lib"
# export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/node@20/include"

# Configuración de Java with Homebrew
# export JAVA_HOME="/home/linuxbrew/.linuxbrew/opt/openjdk"
# export PATH=$JAVA_HOME/bin:$PATH

# Configuración de Java with SDKman
source "$HOME/.sdkman/bin/sdkman-init.sh"
# Asegúrate de que SDKman tenga prioridad en el PATH
# export PATH="$HOME/.sdkman/candidates/java/current/bin:$PATH"

# export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
# export PATH=$JAVA_HOME/bin:$PATH

# export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

# Postgresql
# export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/postgresql@16/lib"
# export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/postgresql@16/include"

# export PKG_CONFIG_PATH="/home/linuxbrew/.linuxbrew/opt/postgresql@16/lib/pkgconfig"

# MySql
# export PATH="/home/linuxbrew/.linuxbrew/opt/mysql@8.0/bin:$PATH"
# export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/mysql@8.0/lib"
# export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/mysql@8.0/include"
# export PKG_CONFIG_PATH="/home/linuxbrew/.linuxbrew/opt/mysql@8.0/lib/pkgconfig"

# Docker
# export PATH="/home/linuxbrew/.linuxbrew/opt/docker/bin:$PATH"

# config env-var
export DB_HOST=localhost
export DB_PORT=5432
export DB_USER=postgres
export DB_PASSWORD=root12345
