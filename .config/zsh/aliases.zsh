#!/usr/bin/env zsh

# Neovim
if whence "nvim" > /dev/null; then
    alias vim="nvim"
    export VISUAL=nvim
    export EDITOR="$VISUAL"
fi

# Fastfetch
if whence "fastfetch" > /dev/null; then
    alias neofetch="fastfetch"
fi

# Arm Architecture compiler, assembler, and linker
for bin in "gcc" "as" "ld"; do
    if whence "aarch64-linux-gnu-$bin" > /dev/null; then
        alias "$bin-arm64"="aarch64-linux-gnu-$bin"
    fi
done

alias ls="ls -1 --color=auto"
alias ucsdvpn="sudo openconnect --user=jmillhis vpn.ucsd.edu"
alias help="man"
alias open="gio open"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"


