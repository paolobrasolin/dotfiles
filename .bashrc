# NOTE: .bashrc is executed for interactive non-login shells

# The individual per-interactive-shell startup file

PATH="/Users/paolobrasolin/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/paolobrasolin/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/paolobrasolin/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/paolobrasolin/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/paolobrasolin/perl5"; export PERL_MM_OPT;

export PATH=$PATH:$HOME/esp/xtensa-esp32-elf/bin
export IDF_PATH=~/esp/esp-idf

# added by Anaconda3 5.0.0 installer
# export PATH="/Users/paolobrasolin/anaconda3/bin:$PATH"
# shellcheck shell=bash

# export GOPATH=$HOME/go
# export GOBIN=$GOPATH/bin
# export PATH=$PATH:$GOBIN

export PATH=$PATH:/usr/local/sbin

export NVM_DIR="$HOME/.nvm"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# source $HOME/.asdf/asdf.sh
# source $HOME/.asdf/completions/asdf.bash

export HISTSIZE=10000
export HISTFILESIZE=10000
# append, don't overwrite
shopt -s histappend
# save history on each prompt
# PROMPT_COMMAND='$PROMPT_COMMAND; history -a'

export EDITOR=vim

export PATH=$PATH:~/Library/Haskell/bin

alias metanorma='docker run -v "$(pwd)":/metanorma/ -w /metanorma metanorma/metanorma metanorma'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

