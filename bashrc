export TERM=xterm-256color
alias gg="git grep -n"
alias gut="git"
alias cd..="cd .."
function f() {
	find . -name "$1" 2> /dev/null
}
function clean_build() {
	sudo git clean -xdf
	./build/build_in_mock.sh
}
function e8-qemu-whose() {
	ps -eo pid,etime,args | grep qemu-system-x86_64 | grep -v grep | grep -v sudo | perl -pe 's|^.*?(\d+).*?((?:\d+:)?\d+:\d+).*/home/(.*?)/.*|\1 \2 \3|g'
}

function e8-qemu-kill() {
	e8-qemu-whose | grep $1 | cut -f1 -d' ' | xargs --no-run-if-empty sudo kill -9
}
