export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PAGER=less
export TERM=xterm-256color

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/workspace/repos
export PATH=/usr/local/bin:${PATH}:${HOME}/bin:/usr/bin:/usr/local/sbin:/usr/texbin:${HOME}/.nodebrew/current/bin:$(brew --prefix)/bin
export XDG_CONFIG_HOME=${HOME}/.config
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$HOME/workspace/repos/github.com/jyane/grpc/bins/opt

export PROJECT_ID=$(gcloud config get-value project -q)

# for rbenv
if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
    export PATH="$HOME/.rbenv/bin:$PATH"
fi

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Default shell configuration set prompt
autoload colors
colors

# ls colors
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

local mark="%B%(!,#,->)%b"
PROMPT="[%~] (%B%F{blue}%n%f%b@%F{gray}%m%f 20%D %*)
$mark "

# RPROMPT="%* [%~]"
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
zstyle ':chpwd:*' recent-dirs-max 500

# Completion configuration
autoload -U compinit
compinit

if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

# read other settings.
[ -f ${HOME}/.cargo/env ] && source ${HOME}/.cargo/env
[ -f ${HOME}/.aliases ] && source ${HOME}/.aliases
[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ${HOME}/.zsh/enter.zsh ] && source ${HOME}/.zsh/enter.zsh
[ -f ${HOME}/.zsh/jyane-peco ] && source ${HOME}/.zsh/jyane-peco

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jyane/workspace/app/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jyane/workspace/app/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jyane/workspace/app/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jyane/workspace/app/google-cloud-sdk/completion.zsh.inc'; fi
