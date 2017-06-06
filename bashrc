export TERM=xterm-256color
alias gg="git grep -n"
alias gut="git"
alias cd..="cd .."
alias assh="ssh -o \"StrictHostKeyChecking=no\""
alias ascp="scp -o \"StrictHostKeyChecking=no\""
alias gtags="gtags --skip-unreadable"


function f() {
	find . -name "$1" 2> /dev/null
}
function clean_build() {
	sudo git clean -xdf
	gtags & 
	./build/build_in_mock.sh
}

function up-branch() {
	git branch -D $1
	git fetch
	CURR_BRANCH=$(git rev-parse --abbrev-ref HEAD)
	git co $1
	git co $CURR_BRANCH
}

function cherry-pick-to() {
	CURR_BRANCH=$(git rev-parse --abbrev-ref HEAD)
	git co $1
	git cherry-pick $CURR_BRANCH
}

function e8-qemu-whose() {
	ps -eo pid,etime,args | grep qemu-system-x86_64 | grep -v grep | grep -v sudo | perl -pe 's|^.*?(\d+).*?((?:\d+:)?\d+:\d+).*/home/(.*?)/.*|\1 \2 \3|g'
}

function e8-qemu-kill() {
	e8-qemu-whose | grep $1 | cut -f1 -d' ' | xargs --no-run-if-empty sudo kill -9
}

function e8-packaged-build() {
	mkdir packaged_build
	cp -v --parents -rf $(cat ./build/targets/default/artifacts.txt) packaged_build/
}
