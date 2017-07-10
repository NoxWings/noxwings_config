# Utils
alias foldersize='du --max-depth=1 --human-readable | sort -h -r'

# Git aliases
alias gk='gitk --all &'
alias gdk='git diff | kompare - > /dev/null 2>&1 &'
alias gcmp='git checkout master && git pull'
alias gfr='git fetch && git rebase origin/master'

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
