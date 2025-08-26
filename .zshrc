export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PAGER=less
export TERM=xterm-256color
export PATH=/usr/local/bin:${PATH}:${HOME}/bin:/usr/bin:/usr/local/sbin:${HOME}/workspace/bin:${HOME}/.local/bin:/usr/local/go/bin:${HOME}/go/bin
export XDG_CONFIG_HOME=${HOME}/.config

# Default shell configuration set prompt
autoload colors
colors

# ls colors
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

local mark="%B%(!,#,$)%b"
PROMPT="[%~] (%B%F{blue}%n%f%b@%F{gray}%m%f 20%D %*)
$mark "

# RPROMPT="%* [%~]"
SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "

fpath=($fpath "${HOME}/.zsh/plugins/zsh-completions")

# Completion configuration
autoload -U compinit
compinit

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
HISTFILE=${HOME}/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 500

# plugins
[ -f ${HOME}/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source ${HOME}/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ${HOME}/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ${HOME}/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# read other settings.
[ -f ${HOME}/.zsh/alias.zsh ] && source ${HOME}/.zsh/alias.zsh
[ -f ${HOME}/.zsh/enter.zsh ] && source ${HOME}/.zsh/enter.zsh
[ -f ${HOME}/.zsh/fzf.zsh ] && source ${HOME}/.zsh/fzf.zsh
[[ $(uname -r) == *"WSL"* ]] && [ -f ${HOME}/.zsh/wsl.zsh ] && source ${HOME}/.zsh/wsl.zsh
[[ $(uname -r) == *"rodete"* ]] && [ -f ${HOME}/.zsh/rodete.zsh ] && source ${HOME}/.zsh/rodete.zsh
