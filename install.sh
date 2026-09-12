#!/usr/bin/env bash

set -Ee

BASHRC="$HOME/.bashrc"
START_MARK="# >>> JINX PS1 START >>>"
END_MARK="# <<< JINX PS1 END <<<"

clear

printf '\n\e[1;96m╭─ JINX PS1 SETUP ─╮\e[0m\n\n'

if [[ -t 0 ]]; then
    DEFAULT_USER="${USER:-$(id -un 2>/dev/null || printf 'user')}"

    read -r -p "Username [${DEFAULT_USER}]: " JINX_USERNAME
    JINX_USERNAME="${JINX_USERNAME:-$DEFAULT_USER}"

    read -r -p "User icon []: " JINX_USER_ICON
    JINX_USER_ICON="${JINX_USER_ICON:-}"

    read -r -p "Directory icon []: " JINX_PATH_ICON
    JINX_PATH_ICON="${JINX_PATH_ICON:-}"

    read -r -p "Arrow icon []: " JINX_ARROW_ICON
    JINX_ARROW_ICON="${JINX_ARROW_ICON:-}"

    read -r -p "Prompt icon []: " JINX_PROMPT_ICON
    JINX_PROMPT_ICON="${JINX_PROMPT_ICON:-}"

    read -r -p "Prompt symbol [₹]: " JINX_PROMPT_SYMBOL
    JINX_PROMPT_SYMBOL="${JINX_PROMPT_SYMBOL:-₹}"
else
    JINX_USERNAME="${USER:-user}"
    JINX_USER_ICON=""
    JINX_PATH_ICON=""
    JINX_ARROW_ICON=""
    JINX_PROMPT_ICON=""
    JINX_PROMPT_SYMBOL="₹"
fi

printf '\n\e[1;96mChoose a colour theme:\e[0m\n'
printf '  \e[1;96m1\e[0m) JINX Cyan\n'
printf '  \e[1;95m2\e[0m) Dracula\n'
printf '  \e[1;94m3\e[0m) Tokyo Night\n'
printf '  \e[1;93m4\e[0m) Gruvbox\n'
printf '  \e[1;96m5\e[0m) Nord\n'
printf '  \e[1;97m6\e[0m) Custom colours\n\n'

read -r -p "Select theme [1]: " THEME
THEME="${THEME:-1}"

case "$THEME" in
    1)
        THEME_NAME="JINX Cyan"

        USER_COLOR="96"
        DIR_COLOR="97"

        USER_ICON_COLOR="96"
        PATH_ICON_COLOR="94"
        ARROW_ICON_COLOR="95"
        PROMPT_ICON_COLOR="96"

        PROMPT_SYMBOL_COLOR="92"
        TILDE_COLOR="93"
        ;;
    2)
        THEME_NAME="Dracula"

        USER_COLOR="95"
        DIR_COLOR="97"

        USER_ICON_COLOR="95"
        PATH_ICON_COLOR="92"
        ARROW_ICON_COLOR="95"
        PROMPT_ICON_COLOR="96"

        PROMPT_SYMBOL_COLOR="92"
        TILDE_COLOR="96"
        ;;
    3)
        THEME_NAME="Tokyo Night"

        USER_COLOR="94"
        DIR_COLOR="97"

        USER_ICON_COLOR="94"
        PATH_ICON_COLOR="96"
        ARROW_ICON_COLOR="94"
        PROMPT_ICON_COLOR="95"

        PROMPT_SYMBOL_COLOR="96"
        TILDE_COLOR="95"
        ;;
    4)
        THEME_NAME="Gruvbox"

        USER_COLOR="33"
        DIR_COLOR="97"

        USER_ICON_COLOR="33"
        PATH_ICON_COLOR="32"
        ARROW_ICON_COLOR="31"
        PROMPT_ICON_COLOR="33"

        PROMPT_SYMBOL_COLOR="32"
        TILDE_COLOR="93"
        ;;
    5)
        THEME_NAME="Nord"

        USER_COLOR="94"
        DIR_COLOR="97"

        USER_ICON_COLOR="94"
        PATH_ICON_COLOR="34"
        ARROW_ICON_COLOR="94"
        PROMPT_ICON_COLOR="96"

        PROMPT_SYMBOL_COLOR="92"
        TILDE_COLOR="96"
        ;;
    6)
        THEME_NAME="Custom"

        printf '\n\e[1;96mUser colour\e[0m\n'
        printf '  30 Black   31 Red   32 Green   33 Yellow\n'
        printf '  34 Blue    35 Magenta   36 Cyan   37 White\n'
        printf '  90-97 Bright colours\n\n'

        read -r -p "Username colour [96]: " USER_COLOR
        USER_COLOR="${USER_COLOR:-96}"

        read -r -p "Directory colour [97]: " DIR_COLOR
        DIR_COLOR="${DIR_COLOR:-97}"

        read -r -p "User icon colour [96]: " USER_ICON_COLOR
        USER_ICON_COLOR="${USER_ICON_COLOR:-96}"

        read -r -p "Directory icon colour [94]: " PATH_ICON_COLOR
        PATH_ICON_COLOR="${PATH_ICON_COLOR:-94}"

        read -r -p "Arrow icon colour [95]: " ARROW_ICON_COLOR
        ARROW_ICON_COLOR="${ARROW_ICON_COLOR:-95}"

        read -r -p "Prompt icon colour [96]: " PROMPT_ICON_COLOR
        PROMPT_ICON_COLOR="${PROMPT_ICON_COLOR:-96}"

        read -r -p "Prompt symbol colour [92]: " PROMPT_SYMBOL_COLOR
        PROMPT_SYMBOL_COLOR="${PROMPT_SYMBOL_COLOR:-92}"

        read -r -p "Tilde colour [93]: " TILDE_COLOR
        TILDE_COLOR="${TILDE_COLOR:-93}"
        ;;
    *)
        printf '\n\e[1;93mInvalid choice. Using JINX Cyan.\e[0m\n'

        THEME_NAME="JINX Cyan"

        USER_COLOR="96"
        DIR_COLOR="97"

        USER_ICON_COLOR="96"
        PATH_ICON_COLOR="94"
        ARROW_ICON_COLOR="95"
        PROMPT_ICON_COLOR="96"

        PROMPT_SYMBOL_COLOR="92"
        TILDE_COLOR="93"
        ;;
esac

if [[ -f "$BASHRC" ]]; then
    cp "$BASHRC" "${BASHRC}.backup.$(date +%Y%m%d%H%M%S)"
fi

touch "$BASHRC"

sed -i \
    "/^${START_MARK}$/,/^${END_MARK}$/d" \
    "$BASHRC"

cat >> "$BASHRC" <<EOF

${START_MARK}

# JINX PS1 configuration
export JINX_USERNAME=$(printf '%q' "$JINX_USERNAME")
export JINX_USER_ICON=$(printf '%q' "$JINX_USER_ICON")
export JINX_PATH_ICON=$(printf '%q' "$JINX_PATH_ICON")
export JINX_ARROW_ICON=$(printf '%q' "$JINX_ARROW_ICON")
export JINX_PROMPT_ICON=$(printf '%q' "$JINX_PROMPT_ICON")
export JINX_PROMPT_SYMBOL=$(printf '%q' "$JINX_PROMPT_SYMBOL")

export JINX_USER_COLOR=$(printf '%q' "$USER_COLOR")
export JINX_DIR_COLOR=$(printf '%q' "$DIR_COLOR")
export JINX_USER_ICON_COLOR=$(printf '%q' "$USER_ICON_COLOR")
export JINX_PATH_ICON_COLOR=$(printf '%q' "$PATH_ICON_COLOR")
export JINX_ARROW_ICON_COLOR=$(printf '%q' "$ARROW_ICON_COLOR")
export JINX_PROMPT_ICON_COLOR=$(printf '%q' "$PROMPT_ICON_COLOR")
export JINX_PROMPT_SYMBOL_COLOR=$(printf '%q' "$PROMPT_SYMBOL_COLOR")
export JINX_TILDE_COLOR=$(printf '%q' "$TILDE_COLOR")

PS1='\r\[\e[1;\${JINX_USER_ICON_COLOR}m\]\${JINX_USER_ICON}\[\e[1;\${JINX_USER_COLOR}m\]\${JINX_USERNAME}\[\e[1;\${JINX_TILDE_COLOR}m\]~\[\e[1;\${JINX_PATH_ICON_COLOR}m\]\${JINX_PATH_ICON}\[\e[1;\${JINX_DIR_COLOR}m\]\w\[\e[1;\${JINX_ARROW_ICON_COLOR}m\]\${JINX_ARROW_ICON}\[\e[0m\]\n\[\e[1;\${JINX_PROMPT_ICON_COLOR}m\]\${JINX_PROMPT_ICON}\[\e[1;\${JINX_PROMPT_SYMBOL_COLOR}m\]\${JINX_PROMPT_SYMBOL}\[\e[0m\] '

${END_MARK}

EOF

printf '\n\e[1;92m✔ JINX PS1 installed successfully.\e[0m\n'
printf '\e[1;96mTheme:\e[0m %s\n' "$THEME_NAME"
printf '\e[1;96mBashrc:\e[0m %s\n\n' "$BASHRC"

printf '\e[1;93mReloading Bash configuration...\e[0m\n\n'

source "$BASHRC"
