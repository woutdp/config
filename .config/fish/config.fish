set fish_greeting ""

alias gst "git status"

alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."

function fuck
    eval command sudo $history[1]
end

source ~/.config/fish/config_local.fish
