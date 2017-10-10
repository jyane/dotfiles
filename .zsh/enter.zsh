function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls -a
    echo
    echo
    # ls_abbrev
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo -e "\e[0;33m--- git status ---\e[0m"
        git status -sb
        echo
        echo
    fi
    zle reset-prompt
    return 0
}

zle -N do_enter
bindkey '^m' do_enter
