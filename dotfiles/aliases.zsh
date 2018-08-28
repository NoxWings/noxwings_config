# Utils
alias foldersize='du --max-depth=1 --human-readable | sort -h -r'
alias installed-packages='aptitude search "!~M ~i"'
alias phoenix='rm -rf node_modules && rm -rf package-lock.json && npm i'

# Git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

alias gk='gitk --all &'
alias ggg='git gui &'
alias gdk='git diff | kompare - > /dev/null 2>&1 &'
alias gcmp='git checkout master && git pull'
alias gfr='git fetch && git rebase origin/master'
alias gsfr='git stash -u && gfr && git stash pop'
alias gdbCandidates='git branch --merged | egrep -v "(^\*|master|dev)"'
alias gdbAll='gdbCandidates | xargs git branch -D'
alias glog='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)"'

# Testing aliases
function unit-test {
    if [[ $# = 0 ]]; then
        ./node_modules/mocha/bin/mocha test/unit
    else
        ./node_modules/mocha/bin/mocha $@
    fi
}
function client-test {
    if [[ $# = 0 ]]; then
        rspec --color --default-path test test/client/*
    else
        rspec --color --default-path test $@
    fi
}
alias client-test-chrome="CHROME=1 client-test"

# Configure the fuck command
eval $(thefuck --alias)
