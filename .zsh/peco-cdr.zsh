function peco-cdr () {
    local dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$dir" ]; then
        BUFFER="cd ${dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^t' peco-cdr
