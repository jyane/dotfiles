export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export PAGER=less
export TERM=xterm-256color

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/app/go
export PATH=/usr/local/bin:${PATH}:${HOME}/bin:/usr/bin:/usr/local/sbin:/usr/texbin:${HOME}/.nodebrew/current/bin:$(brew --prefix)/bin
export XDG_CONFIG_HOME=${HOME}/.nvim
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:/Users/jyane/anaconda3/bin
# export PATH=
export C_INCLUDE_PATH=$HOME/Dropbox/competitive/lib/

# for rbenv
if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
    export PATH="$HOME/.rbenv/bin:$PATH"
fi

# Default shell configuration set prompt
autoload colors
colors

# ls colors
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

local mark="%B%(!,#,->)%b"
PROMPT="%B%F{blue}%n%f%b@%F{gray}%m%f $mark "
RPROMPT="[%~]"
SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "

setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
setopt noautoremoveslash
setopt nolistbeep
setopt auto_menu
setopt auto_list
setopt auto_param_slash
setopt list_types
setopt magic_equal_subst
setopt complete_in_word

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' list-colors ''

# Keybind configuration
bindkey -e

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# Command history configuration
HISTFILE=${HOME}/.zsh/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# Completion configuration
autoload -U compinit
compinit

if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

function separate(){
    echo -n $fg_bold[yellow]
    local len=$(($COLUMNS-18))
    for i in $(seq 1 $len); do
        echo -n '_'
    done
    echo -n $reset_color
}

zle -N separate
bindkey '^o' separate

function git-changed-files(){
  git status --short | peco | awk '{print $2}'
}
alias -g F='$(git-changed-files)'

# read other settings.
[ -f ${HOME}/.aliases ] && source ${HOME}/.aliases
[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ${HOME}/.zsh/enter.zsh ] && source ${HOME}/.zsh/enter.zsh
[ -f ${HOME}/.zsh/jyane-peco ] && source ${HOME}/.zsh/jyane-peco

# docker
eval $(docker-machine env dev)

# set master password.
echo 'Please enter master password.'
read -s password
export JYANE_PASS="${password}"

if [ -f ${HOME}/.zsh/.zshrc.private.aes256 ]; then
  local line
  # read secret enviroment variables.
  cat ${HOME}/.zsh/.zshrc.private.aes256 | jyane-crypt decrypt --stdio | while read line; do
    eval "${line}"
  done
fi

export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi
