set fish_greeting ""

alias gst "git status"
alias c "clear"

function fuck
    eval command sudo $history[1]
end

function doco
	docker-compose $argv
end

function fco -d "Fuzzy-find and checkout a branch"
	git branch --all | grep -v HEAD | string trim | fzf | xargs git checkout
end

eval (python -m virtualfish)
source ~/.config/fish/config_local.fish
