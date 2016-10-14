# zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

# export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8

export CLICOLOR=1
# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export PATH=/usr/local/sbin:$PATH

# export EDITOR=vim # will cause tmux ctrl+p outputs ^P

# phabricator
export PATH=$HOME/Code/arcanist/bin:$PATH

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

export HOMEBREW_GITHUB_API_TOKEN=af6a51286f97a9a0460ba0e95c1a4ddc36668df2

# nvm
export NVM_DIR=~/.nvm
export NVM_BREW_DIR=/usr/local/Cellar/nvm/0.32.0
# [ -s "$NVM_BREW_DIR/nvm.sh" ] && . "$NVM_BREW_DIR/nvm.sh"

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
alias db="mycli -u zhimaa -p zhimaa -D fan"
alias grep="grep --color=auto"
alias vim="nvim"
alias ssh="ssh_colourful"
alias sourcenvm="source $NVM_BREW_DIR/nvm.sh"

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# edit-command-line
autoload -z edit-command-line
zle -N edit-command-line
bindkey '^x^E' edit-command-line
set -k
bindkey '^[#' pound-insert
