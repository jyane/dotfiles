function do_enter() {
    zle reset-prompt
    preexec
    if [ -n "$BUFFER" ]; then
        zle reset-prompt
        zle accept-line
        return 0
    fi
    echo
    ls -a
    echo
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo -e "\e[0;33m--- git status ---\e[0m"
        git status -sb
    fi
    zle accept-line
    return 0
}

zle -N do_enter
bindkey '^m' do_enter
