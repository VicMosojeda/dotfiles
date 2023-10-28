from libqtile import layout
from libqtile.config import Click, Drag
from libqtile.lazy import lazy

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

mod = "mod4"

layouts = [
    layout.Columns(
        # border_focus_stack=["#d75f5f", "#8f3d3d"], 
        border_focus=[orangeyellow],
        border_width=1,
        singel_border_width=0,
        margin=2,
        singel_margin=0,
    ),
    layout.Max(),
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

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None
