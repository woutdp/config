set fish_greeting ""

alias gst "git status"
alias gall "git add ."

alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."

#Faster apt-get
alias apt 'sudo apt-get'

function fuck
    eval command sudo $history[1]
end
