#!/usr/bin/env zsh

# tab completion
autoload -Uz compinit promptinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
promptinit

# use vi mode
bindkey -v
KEYTIMEOUT=5

# zsh history
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# bind home, end, delete so that any terminal will recognize
bindkey  "^[[1~"  beginning-of-line
bindkey  "^[[4~"  end-of-line
bindkey  "^[[3~"  delete-char
