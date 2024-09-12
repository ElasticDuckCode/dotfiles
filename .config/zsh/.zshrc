if [[ $(uname) == "Linux" ]] then
    distro="$(cat /etc/*-release | grep ^ID= | sed 's/ID=//g')"
    if [[ $distro != "gentoo" ]] then
        distro=$(uname)
    fi
else
    distro=$(uname)
fi
source "${ZDOTDIR:-${HOME}}/.zshrc-$distro"
