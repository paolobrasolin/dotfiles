# ls aliases
alias l='ls -C --classify --group-directories-first --human-readable'
alias ll='l -l'
alias la='l --almost-all'

# solve the vim xterm clipboard problem the easy way
# and guarantee synctex integration through server name
alias v='gvim -v --servername vim'

# welcome to the dark side
alias e='emacsclient -t'


alias z='zathura'

# run local node module
alias npm-run-local='PATH=$(npm bin):$PATH'

# remove spaces from filenames in current folder
alias nospace="find -name '* *' -type d -or -type f | rename 's/\ /_/g'"
