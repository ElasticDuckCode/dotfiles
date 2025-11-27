#!/usr/bin/env zsh

# zsh syntax highlighting and autosuggestions
if [[ $(uname) == "Darwin" ]]; then
    export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$BREW_PATH/share/zsh-syntax-highlighting/highlighters
    source $BREW_PATH/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source $BREW_PATH/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
    export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/share/zsh-syntax-highlighting/highlighters
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

