from libqtile.config import Group, Key, Match
from libqtile.lazy import lazy

# groups = [Group(i) for i in "12345"]

__groups = {
    1:Group("", matches=[Match(wm_class=['alacritty'])]),
    2:Group("󰖟", matches=[Match(wm_class=['brave-bin', 'google-chrome'])]),
    3:Group("󰅩", matches=[Match(wm_class=['subl', 'vim', 'nvim'])]),
    4:Group("󰝚", matches=[Match(wm_class=['spotify', 'cmus'])]),
    5:Group("󱋊", matches=[Match(wm_class=['telegram-desktop'])]),
    6:Group("󰕧", matches=[Match(wm_class=['simplescreenrecorder', 'obs-studio'])]),
}

groups = [__groups[i] for i in __groups]

def group_key(name):
    return [k for k, g in __groups.items() if  g.name == name][0]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                str(group_key(i.name)),
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                str(group_key(i.name)),
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )