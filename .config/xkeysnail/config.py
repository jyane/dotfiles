import re
from xkeysnail.transform import *

define_modmap({
    Key.CAPSLOCK: Key.LEFT_CTRL
})

define_keymap(re.compile("Google-chrome"), {
    K("C-s"): with_mark(K("C-f")),
}, "Chrome")

define_keymap(lambda wm_class: wm_class not in ("Gnome-terminal"), {
    # Cursor
    K("C-b"): with_mark(K("left")),
    K("C-f"): with_mark(K("right")),
    K("C-p"): with_mark(K("up")),
    K("C-n"): with_mark(K("down")),

    # For mozc
    K("C-Shift-f"): [K("Shift-right"), set_mark(False)],
    K("C-Shift-b"): [K("Shift-left"), set_mark(False)],

    # Beginning/End of line
    K("C-a"): with_mark(K("home")),
    K("C-e"): with_mark(K("end")),

    # Kill line
    K("C-k"): [K("Shift-end"), K("C-x"), set_mark(False)],

    # Undo
    K("C-slash"): [K("C-z"), set_mark(False)],

    # Cancel
    K("C-g"): [K("esc"), set_mark(False)],
    K("C-left_brace"): [K("esc"), set_mark(False)],

}, "Emacs-like keys")
