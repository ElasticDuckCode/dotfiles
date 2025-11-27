#!/usr/bin/env zsh

# Add the following directories to path variable
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.opt/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export BREW_PATH="/opt/homebrew"
export BREW_BIN="$BREW_PATH/bin/brew"
if whence $BREW_BIN > /dev/null ; then
    #eval $($BREW_BIN shellenv)

    # brew paths
    export PATH="$BREW_PATH/bin:$PATH"
    export PATH="$BREW_PATH/sbin:$PATH"
    export PATH="$BREW_PATH/opt/llvm/bin:$PATH"
    export CPATH="$BREW_PATH/include:$CPATH"
    export LIBRARY_PATH="$BREW_PATH/lib:$LIBRARY_PATH"

    # llvm config
    export LDFLAGS="-L$BREW_PATH/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"
    export PATH="$BREW_PATH/opt/llvm/bin:$PATH"

    export HOMEBREW_NO_ANALYTICS=1
fi

