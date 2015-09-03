set fish_greeting ""

alias gst "git status"
alias gall "git add ."
alias gcom "git commit -m"

alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."

alias data "cd /media/wout/Data"
alias home "cd ~"
alias projects "cd /media/wout/Data/Projects"

#Faster apt-get
alias apt 'sudo apt-get'

function fuck
    eval command sudo $history[1]
end
