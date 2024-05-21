if status is-interactive
    # Commands to run in interactive sessions can go here
    function fish_prompt
        set_color green
        echo -n ">"
        set_color white
        echo -n ">"
        set_color red
        echo -n "> "
        set_color purple
        echo -n "  "
        set_color cyan
        echo -n (prompt_pwd)
        set_color purple
        echo -n " "
    end
end
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
alias ls="lsd"
alias cat="bat"
alias wupdate='~/.config/waybar/wupdate.sh'

# node
set -gx PATH "/home/linuxbrew/.linuxbrew/opt/node@20/bin" $PATH >>/$HOME/.bash_profile
set -gx LDFLAGS "-L/home/linuxbrew/.linuxbrew/opt/node@20/lib"
set -gx CPPFLAGS "-I/home/linuxbrew/.linuxbrew/opt/node@20/include"
# Java variables
set -xg JAVA_HOME /home/linuxbrew/.linuxbrew/opt/openjdk
set -xg PATH $JAVA_HOME/bin $PATH

set -l foreground DCD7BA
set -l selection 2D4F67
set -l comment 727169
set -l red C34043
set -l orange FF9E64
set -l yellow C0A36E
set -l green 76946A
set -l purple 957FB8
set -l cyan 7AA89F
set -l pink D27E99

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
