# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH_THEME="robbyrussell"
ZSH_THEME="dracula"

plugins=(git autojump)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

export CLICOLOR=1
# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export PATH=/usr/local/sbin:$PATH

# phabricator
export PATH=$HOME/Code/arcanist/bin:$PATH
source $HOME/Code/arcanist/resources/shell/bash-completion

# play framework
export PATH=$HOME/Code/Java/play-1.2.5:$PATH

# Go
export GOPATH=$HOME/Code/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$GOPATH/bin:$PATH
export PATH=$GOROOT/bin:$PATH

export gosrc=$GOPATH/src
export gotest=$GOPATH/src/gotest

# Python
export PATH=$PATH:$HOME/Library/Python/2.7/bin

export HOMEBREW_GITHUB_API_TOKEN=0c759035b18eb7f7ca592d665fb06ee6286a2ffd

# nvm
export NVM_DIR=~/.nvm
source /usr/local/Cellar/nvm/0.27.1/nvm.sh

# rust
export CARGO_HOME=$HOME/.cargo
export PATH=$PATH:$CARGO_HOME/bin
export RUST_SRC_HOME=$HOME/Code/Rust/rust/
export RUST_SRC_PATH=$RUST_SRC_HOME/src

# Git auto-completion
if [ -f ~/.git-completion.zsh ]; then
	. ~/.git-completion.zsh
fi

alias m="startplay"
alias db="mysql -uzhimaa -pzhimaa fan"
alias grep="grep --color=auto"
alias emacs="/usr/local/Cellar/emacs-mac/emacs-24.5-z-mac-5.15/bin/emacsclient"
alias vim="nvim"
alias vi="macvim -v"
alias ssh="ssh_colourful"
