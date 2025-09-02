zmodload zsh/datetime

#    ~/workspace/src/github.com/jyane/dotfiles  on   master !6 ?1                                       INT ✘  at 23:22:19 


J_START=""

function preexec() {
  J_START=$EPOCHSECONDS
}

function command_duration() {
  if [ $J_START ]; then
    local duration=$(($EPOCHSECONDS - $J_START))
    unset J_START
    if (( duration > 3 )); then
      echo "took %F{246}%B${duration}s%b%f"
    fi
  fi
}

function ssh_info() {
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo '%F{red}%B%f%b'
  else
    echo '%F{white}%B%f%b'
  fi
}

function git_info() {
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
    local branch=$(git branch --show-current)
    echo "on%B%F{200}  ${branch}%f%b"
  fi
}

function find_length() {
  for (( i = 1; i <= (COLUMNS + 5); i++ )); do
    if ! (( ${${(%):-$1%$i(l.1.0)}[-1]} )); then
      break
    fi
  done
  echo $((i - 1))
}

function spacer() {
  local l_len=$(find_length $1)
  local r_len=$(find_length $2)
  local space_len=$((COLUMNS - l_len - r_len))
  if (( space_len < 0 )); then
    spance_len=0
  fi
  echo ${(l.space_len.. .)}
}

function set_prompt() {
  local duration=$(command_duration)
  local now=$(strftime "%Y-%m-%d %H:%M:%S (%Z) ")
  local mark='%B%(?.%F{green}.%F{red})❯%f%b '
  local git=$(git_info)
  local ssh=$(ssh_info)
  local top_right="${duration} at %F{246}${now}%f"
  local top_left="${ssh} %B%F{cyan}%~%f%b $git"
  local spaces=$(spacer $top_left $top_right)
  echo ''
  PROMPT=${top_left}${spaces}${top_right}$'\n'${mark}
}

SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "

setopt no_prompt_subst
autoload -Uz add-zsh-hook
add-zsh-hook precmd set_prompt
