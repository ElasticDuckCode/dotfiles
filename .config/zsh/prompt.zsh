#!/usr/bin/env zsh

local NEWLINE=$'\n'
local TERM_STRING='%(!.#.>)'

# configure git plugin
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt prompt_subst

# specifiy left/right prompt format
PROMPT='%F{yellow}%n@%F{red}%m%f:%F{cyan}%(4~|.../%1~|%~)%f %F{green}${vcs_info_msg_0_}%f% ${NEWLINE}${TERM_STRING} '
RPROMPT="%D{%F %T}"
 
