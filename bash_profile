#Modify termial prompt
#\d – date
#\t – time
#\h – hostname
#\# – command number
#\u – username
#\W – current directory (e.g.: Desktop)
#\w – current directory path (e.g.: /Users/Admin/Desktop)
export PS1="Joby: \W$ "

export CLICOLOR=1
# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export PATH=/usr/local/sbin:$PATH

#make shell colorfull
#alias ls="ls -G" 
alias ssh="ssh_colourful"
alias m="startplay"
alias db="mysql -uzhimaa -pzhimaa fan"

#phabricator
export PATH=$HOME/Code/arcanist/bin:$PATH
source $HOME/Code/arcanist/resources/shell/bash-completion

#play framework
export PATH=$HOME/Code/Java/play-1.2.5:$PATH

#Go
export GOPATH=$HOME/Code/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export gosrc=$GOPATH/src
export gotest=$GOPATH/src/gotest

#Code
export code=$HOME/Code
export meicanplay=$code/Java/meican-web
export ansible=$code/ansible
export migration=$code/db-migrations
export diffusion=$code/Go/src/code.meican.com/diffusion
export siren=$diffusion/IVR/siren.git
export noah=$diffusion/N/noah.git
export lamech=$diffusion/L/lamech.git
export gaea=$diffusion/K/gaea.git
export hermes=$diffusion/Q/hermes.git
export doraemon=$diffusion/U/doraemon.git
export archangel=$diffusion/MIS/archangel.git
export demeter=$diffusion/DEMETER/demeter.git

#Git auto-completion
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

export HOMEBREW_GITHUB_API_TOKEN=172148979aaef219e52993f7184cf94fe13f1f56

# nvm
export NVM_DIR=~/.nvm
source /usr/local/Cellar/nvm/0.27.1/nvm.sh
