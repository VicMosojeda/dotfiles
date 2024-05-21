from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

import os
import json
import subprocess

mod = "mod4"

####################
##     COLORS     ##
####################

# Obtener la ruta al archivo colors.json
colors_file = os.path.expanduser('~/.cache/wal/colors.json')

# Cargar los colores desde el archivo colors.json
with open(colors_file, 'r') as file:
    colordict = json.load(file)

# Asignar los colores a variables individuales
ColorBackground = colordict['special']['background']
ColorForeground = colordict['special']['foreground']
ColorCursor = colordict['special']['cursor']
ColorA = colordict['colors']['color0']
ColorB = colordict['colors']['color1']
ColorC = colordict['colors']['color2']
ColorD = colordict['colors']['color3']
ColorE = colordict['colors']['color4']
ColorF = colordict['colors']['color5']
ColorG = colordict['colors']['color6']
ColorH = colordict['colors']['color7']
ColorI = colordict['colors']['color8']
ColorJ = colordict['colors']['color9']
ColorK = colordict['colors']['color10']
ColorL = colordict['colors']['color11']
ColorM = colordict['colors']['color12']
ColorN = colordict['colors']['color13']
ColorO = colordict['colors']['color14']
ColorP = colordict['colors']['color15']

####################
##     KEYS       ##
####################

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
    # reload config & restart
    ([mod, "shift"], "q", lazy.reload_config()),
    # quit
    ([mod], "m", lazy.shutdown()),
    # ([mod], "r", lazy.spawncmd()),

    # Shortcuts Apps
    # terminal
    ([mod], "return", lazy.spawn("warp-terminal")),
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


####################
##     GROUSPS    ##
####################

groups = [Group(i) for i in [
    "󰖟", "󰘦", "", "", "󰝚", "",
]]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])

####################
##     LAYOUTS    ##
####################

layouts = [
    layout.Columns(
        border_focus=ColorC,
        border_normal=ColorA,
        border_width=2,
        margin=5,
        # singel_border_width=0,
        # singel_margin=0,
    ),
    layout.Max(),
    layout.Floating(
        border_focus=ColorC,
        border_normal=ColorA,
        border_width=2,
        margin=2,
    ),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

####################
##     WIDGETS    ##
####################

widget_defaults = dict(
    font="Monospace Krypton",
    fontsize=15,
    padding=10,
)
extension_defaults = widget_defaults.copy()

####################
##     SCREEN     ##
####################

screens = [
    Screen(
        top=bar.Bar(
            [
                # widget.CurrentLayout(),
                widget.WidgetBox(
                    text_closed='',
                    text_open='',
                    foreground=ColorP,
                    padding=10,
                    fontsize=20,
                    close_button_location='left',
                    widgets=[
                    widget.Systray(
                        icon_size=15,
                        padding=10,
                        ),
                    ]
                ),
                widget.Prompt(),
                widget.Spacer(),
                widget.GroupBox(
                    inactive=ColorP,
                    active=ColorM,
                    block_highlight_text_color=ColorG,
                    borderwidth=0,
                    padding=10,
                    center_aligned=True,
                ),
                widget.Spacer(),
                widget.Cmus(
                    foreground=ColorE,
                    play_color=ColorH,
                    max_chars=25,
                    padding=10,
                ),
                # widget.WindowName(),
                widget.Clock(
                    format=' %H:%M %p -  %d/%m/%y',
                    foreground=ColorP,
                ),
                # widget.Chord(
                #     chords_colors={
                #         "launch": ("#ff0000", "#ffffff"),
                #     },
                #     name_transform=lambda name: name.upper(),
                # ),
                # widget.StatusNotifier(),
                widget.QuickExit(
                    default_text='',
                    foreground=ColorP,
                countdown_format='{}',
                ),
            ],
            30,
            background=ColorA + "70"
            # border_color=["ff00ff", "000000", "ff00ff", "000000"],
        ),
    ),
]

####################
##     MOUSE      ##
####################
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

####################
##     GLOBALS    ##
####################

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = False
auto_minimize = True
wl_input_rules = None
wmname = "LG3D"

####################
##     START      ##
####################

autostart = [
    "~/.config/qtile/launch.sh"
]

for x in autostart:
    os.system(x)
