export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export PAGER=less
export EDITOR=emacs
export TERM=xterm-256color

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/app/go
export PATH=/usr/local/bin:${PATH}:${HOME}/bin:/usr/bin:/usr/local/sbin:/usr/texbin:${HOME}/.nodebrew/current/bin:$(brew --prefix)/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

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

[ -f ~/bin/jyane-peco ] && source ~/bin/jyane-peco
[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.zsh/.zshrc.private ] && source ~/.zsh/.zshrc.private
[ -f ~/.zsh/enter.zsh ] && source ~/.zsh/enter.zsh
if which peco > /dev/null; then
    [ -f ~/.zsh/peco-history.zsh ] && source ~/.zsh/peco-history.zsh
    [ -f ~/.zsh/peco-cdr.zsh ] && source ~/.zsh/peco-cdr.zsh
fi
