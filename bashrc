export TERM=xterm-256color
alias gg="git grep -n"
alias cd..="cd .."
function f() {
	find . -name "$1" 2> /dev/null
}
