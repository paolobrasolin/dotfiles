# NOTE: .bash_profile is executed for login shells

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

. "/Users/paolobrasolin/.bashrc"

# The personal initialization file, executed for login shells

. "/usr/local/opt/nvm/nvm.sh"

# added by travis gem
[ -f /Users/paolobrasolin/.travis/travis.sh ] && source /Users/paolobrasolin/.travis/travis.sh

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# The next line enables shell command completion for gcloud.
# shellcheck shell=bash

if [ -f '/Users/paolobrasolin/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/paolobrasolin/google-cloud-sdk/completion.bash.inc'; fi

# [ -s $(mnogootex mnogoo) ] && source $(mnogootex mnogoo)

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/.liquidprompt/liquidprompt
#export PS1="\u $ "
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/Applications/LibreOffice.app/Contents/MacOS:$PATH"



alias be="bundle exec"
alias berk="bundle exec rake"
alias bers="bundle exec rails"

# added by Anaconda2 2019.07 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda2/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda2/etc/profile.d/conda.sh" ]; then
        . "/anaconda2/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

export PATH="$HOME/.cargo/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias t="/Users/paolobrasolin/.rvm/gems/ruby-2.7.0/bin/timetrap"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/paolobrasolin/google-cloud-sdk/path.bash.inc' ]; then . '/Users/paolobrasolin/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/paolobrasolin/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/paolobrasolin/google-cloud-sdk/completion.bash.inc'; fi
