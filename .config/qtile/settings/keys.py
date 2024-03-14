from libqtile.config import Key
from libqtile.lazy import lazy

mod = "mod4"

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # ------------ Window Configs ------------

    # Switch between windows
    ([mod], "h", lazy.layout.left()),
    ([mod], "l", lazy.layout.right()),
    ([mod], "j", lazy.layout.down()),
    ([mod], "k", lazy.layout.up()),
    # Move windows up or down in current stack
    ([mod, "shift"], "h", lazy.layout.shuffle_left()),
    ([mod, "shift"], "l", lazy.layout.shuffle_right()),
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),
    # Grow windows
    ([mod, "control"], "h", lazy.layout.grow_left()),
    ([mod, "control"], "l", lazy.layout.grow_right()),
    ([mod, "control"], "j", lazy.layout.grow_down()),
    ([mod, "control"], "k", lazy.layout.grow_up()),
    # maximize
    ([mod], "n", lazy.layout.normalize()),
    # toggle split
    ([mod, "shift"], "Return", lazy.layout.toggle_split()),
    # change layout
    ([mod], "Tab", lazy.next_layout()),
    # kill window
    ([mod], "q", lazy.window.kill()),
    # toggle floating
    ([mod], "f", lazy.window.toggle_fullscreen()),
    ([mod], "v", lazy.window.toggle_floating()),
    # reload config
    ([mod, "shift"], "q", lazy.reload_config()),
    # quit
    ([mod], "m", lazy.shutdown()),
    # ([mod], "r", lazy.spawncmd()),

    # Shortcuts Apps
    # rofi
    ([mod], "space", lazy.spawn("rofi -show drun")),
    # rofi emoji
    ([mod, "shift"], "e", lazy.spawn(
        "rofi -show emoji")),
    # rofi calc
    ([mod, "shift"], "c", lazy.spawn(
        "rofi -show calc -no-show-match -no-sort")),
    # file Manager
    ([mod], "e", lazy.spawn("thunar")),
    # screeshot
    ([mod, "shift"], "s", lazy.spawn("flameshot gui")),
    # color picker
    ([mod], "c", lazy.spawn("gpick -p")),
    # redshift
    ([mod], "r", lazy.spawn("redshift -O 2400")),
    # redshift off
    ([mod, "shift"], "r", lazy.spawn("redshift -x")),
    # vol +
    ([], "XF86AudioRaiseVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ +2%")),
    # vol -
    ([], "XF86AudioLowerVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ -2%")),
    # vol mute
    ([], "XF86AudioMute", lazy.spawn(
        "pactl set-sink-mute @DEFAULT_SINK@ toggle")),
    # player control
    # play previous
    ([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    # play-pause
    ([], "XF86AudioPlay", lazy.spawn(
        "playerctl play-pause")),
    # play next
    ([], "XF86AudioNext", lazy.spawn("playerctl next")),

    # brightnessctl
    # increase
    ([], "XF86MonBrightnessUp", lazy.spawn(
        "brightnessctl set +5%")),
    # decrease
    ([], "XF86MonBrightnessDown", lazy.spawn(
        "brightnessctl set 5%-")),
]]