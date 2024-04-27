# Key bindings
# ------------

export FZF_DEFAULT_OPTS="--height 40%"

# CTRL-T: cdr
fzf-cdr-widget() {
  local dir=$(cdr -l | awk '{ print $2 }' | fzf)
  if [ -n "$dir" ]; then
    BUFFER="cd ${dir}"
    zle reset-prompt
  fi
}
zle     -N   fzf-cdr-widget
bindkey '^T' fzf-cdr-widget

# CTRL-R: history search
fzf-history-widget() {
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  local num=$(fc -rl 1 | fzf --query=${${(qqq)LBUFFER}//\"/} | awk '{ print $1 }')
  if [ -n "$num" ]; then
    zle vi-fetch-history -n $num
  fi
  zle reset-prompt
}
zle     -N   fzf-history-widget
bindkey '^R' fzf-history-widget

# CTRL-H: find a file
fzf-find-file() {
  local res=$(find * | fzf --preview 'head -n 100 {}')
  if [ -n "$res" ]; then
    BUFFER="$BUFFER ${res}"
    zle reset-prompt
  fi
}
zle     -N   fzf-find-file
bindkey '^H' fzf-find-file
