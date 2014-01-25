## Language setting
export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export PAGER=less
export EDITOR=emacs
export TERM=xterm-256color

## PATH
export PATH=/usr/local/bin:${PATH}:~/bin/:${HOME}/bin:/usr/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/texbin

# for rbenv
PATH=$PATH:$HOME/bin
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"

## Default shell configuration set prompt
autoload colors
colors

# ls colors
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

local mark="%B%(!,#,->)%b"
PROMPT="%B%F{blue}%n%f%b@%F{gray}%m%f $mark "
# [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%B%n%b@%F{white}%m%f $mark "
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

## Keybind configuration
bindkey -e

## historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

## Command history configuration
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

## Completion configuration
autoload -U compinit
compinit

## enter -> ls
function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls -a
    # ls_abbrev
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo
        echo -e "\e[0;33m--- git status ---\e[0m"
        git status -sb
    fi
    zle reset-prompt
    return 0
}
zle -N do_enter
bindkey '^m' do_enter


# antigen
if [[ -f $HOME/.antigen/antigen.zsh ]]; then
  source $HOME/.antigen/antigen.zsh

  # antigen use oh-my-zsh

  # autojump がなぜか動かない
  antigen-bundles <<EOBUNDLES
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-completions
EOBUNDLES

  # Tell antigen that you're done.
  antigen-apply
fi

# autojump
[[ -s `brew --prefix`/etc/autojump.zsh ]] && . `brew --prefix`/etc/autojump.zsh


[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.zshrc.private ] && source ~/.zshrc.private
