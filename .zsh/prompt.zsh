zmodload zsh/datetime

J_START=""
NARROW_COLUMNS=100

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
  local icon=""
  case $(uname -r) in
    *"rodete"*)
      icon=""
      ;;
    *"WSL"*)
      icon=""
      ;;
    *)
      icon=""
      ;;
  esac
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo "%F{200}%B ${icon}%f%b"
  else
    echo "%F{white}%B ${icon}%f%b"
  fi
}

function git_info() {
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
    local branch=$(git branch --show-current)
    local mod_count=$(git status -s | wc -l)
    if (( mod_count > 0 )); then
      echo "on%B%F{200}  ${branch}%f %F{red}m:${mod_count}%f%b"
    else
      echo "on%B%F{200}  ${branch}%f%b"
    fi
  fi
}

function get_path() {
  if (( COLUMNS <= NARROW_COLUMNS )); then
    echo $(pwd | sed -e "s,^$HOME,~," -e 's,\([^/]\)[^/]*/,\1/,g')
  else
    echo "%~"
  fi
}

function get_now() {
  if (( COLUMNS <= NARROW_COLUMNS )); then
    echo $(strftime "%H:%M:%S (%Z) ")
  else
    echo $(strftime "%Y-%m-%d %H:%M:%S (%Z) ")
  fi
}

function find_length() {
  for (( i = 1; i <= (COLUMNS + 10); i++ )); do
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
  local now=$(get_now)
  local mark='%B%(?.%F{green}.%F{red})❯%f%b '
  local git=$(git_info)
  local ssh=$(ssh_info)
  local path=$(get_path)
  local top_right="${duration} at %F{246}${now}%f "
  local top_left="${ssh} %B%F{cyan}${path}%f%b $git"
  local spaces=$(spacer $top_left $top_right)
  echo ''
  PROMPT=${top_left}${spaces}${top_right}$'\n'${mark}
}

SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "

setopt no_prompt_subst
autoload -Uz add-zsh-hook
add-zsh-hook precmd set_prompt
