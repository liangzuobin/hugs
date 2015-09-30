#Modify termial prompt
#\d – date
#\t – time
#\h – hostname
#\# – command number
#\u – username
#\W – current directory (e.g.: Desktop)
#\w – current directory path (e.g.: /Users/Admin/Desktop)
export PS1="Joby: \W $ "

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export PATH=/usr/local/sbin:$PATH

#make shell colorfull
#alias ls="ls -G" 
alias ssh="ssh_colourful"

#phabricator
export PATH=$HOME/Code/arcanist/bin:$PATH
source $HOME/Code/arcanist/resources/shell/bash-completion

#play framework
export PATH=$HOME/Code/Java/play-1.2.5:$PATH

#Go
export GOROOT=/usr/local/Cellar/go/1.5.1/libexec
export GOPATH=$HOME/Code/Go
export GOBIN=$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:$GOBIN

#go test
export gotest=$GOPATH/src/gotest

#code.meican.com/diffusition
export diffusion=$HOME/Code/Go/src/code.meican.com/diffusion
export siren=$diffusion/IVR/siren.git
export noah=$diffusion/N/noah.git
export lamech=$diffusion/L/lamech.git
export gaea=$diffusion/K/gaea.git
export hermes=$diffusion/Q/hermes.git
export doraemon=$diffusion/U/doraemon.git
export archangel=$diffusion/MIS/archangel.git
export demeter=$diffusion/DEMETER/demeter.git

#For golang plugins of IntelliJ IDEA
#launchctl setenv GOPATH $GOPATH
#launchctl setenv GOROOT $GOROOT

#Git auto-completion
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

# nvm
export NVM_DIR=~/.nvm
source /usr/local/Cellar/nvm/0.27.1/nvm.sh
