# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  archlinux
  aws
  colored-man-pages
  git
  history-substring-search
  kubectl
  vi-mode
  zsh-autosuggestions
  zsh-navigation-tools
  zsh-syntax-highlighting
)

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Include hidden files in autocomplete:
_comp_options+=(globdots)

source $ZSH/oh-my-zsh.sh

# VIM mode
export KEYTIMEOUT=20

bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey -M vicmd 'H' beginning-of-line
bindkey -M vicmd 'L' end-of-line
bindkey -M vicmd 'm' vi-repeat-find
bindkey -M vicmd 'M' vi-rev-repeat-find

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Ctrl+Space accept autosuggestions
bindkey '^ ' autosuggest-accept

# Ctrl+Enter execute autosuggestions
# Requires terminal to rebind ctrl+enter to escape sequence
bindkey '^[M' autosuggest-execute

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

source $HOME/.shellrc
if [ -f $HOME/.securerc ]; then
  source $HOME/.securerc
fi

eval "$(starship init zsh)"
