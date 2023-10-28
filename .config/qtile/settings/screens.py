from libqtile.config import Screen
from libqtile import bar, widget

# colors
black = "#000000"
black_transparency = "#00000010"
white = "#ffffff"
white_transparency = "#ffffff10"
grey = "#333"
red = "#fa1505"
red_dark = "#4f0702"
blue = "#0d05fa"
blue_dark = "#030142"
green = "#0ff007"
green_dark = "#055c02"
yellow = "#f0e007"
yellow_dark = "#544e01"
orange = "#fc6805"
orange_dark = "#662a02"
purple = "#7905fc"
purple_dark = "#24034a"
pink = "#fc0589"
pink_dark = "#fc0589"
cyan = "#05f4fc"
cyan_dark = "#014042"
# festiavals
orangeyellow = "#FFB844"

screens = [
    Screen(
        top=bar.Bar(
            [
                # widget.CurrentLayout(),
                widget.GroupBox(
                    inactive=grey,
                    active=orange_dark,
                    block_highlight_text_color=orangeyellow,
                    borderwidth=0,
                    padding=10,
                    center_aligned=True,
                ),
                widget.Prompt(),
                # widget.WindowName(),
                widget.Spacer(),
                widget.Clock(
                    format='%d/%m/%y %H:%M %p',
                    foreground=cyan,
                ),
                widget.Spacer(),
                widget.Cmus(
                    foreground=purple_dark,
                    play_color=purple,
                    max_chars=25,
                ),
                # widget.Memory(),
                widget.ThermalZone(
                    fgcolor_normal=green,
                    fgcolor_high=yellow,
                    fgcolor_crit=red,
                    crit=85,
                ),
                widget.WidgetBox(
                    text_closed='',
                    text_open='',
                    padding=10,
                    fontsize=20,
                    widgets=[
                    widget.Systray(
                        icon_size=15,
                        margin=10,
                    ),
                ]
                ),
                # widget.Chord(
                #     chords_colors={
                #         "launch": ("#ff0000", "#ffffff"),
                #     },
                #     name_transform=lambda name: name.upper(),
                # ),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                # widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                # widget.QuickExit(),
            ],
            20,
            background=black_transparency,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]