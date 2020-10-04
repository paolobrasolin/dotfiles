# shellcheck shell=bash

export EDITOR=vim

export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend # append, don't overwrite
# PROMPT_COMMAND='$PROMPT_COMMAND; history -a' # save history on each prompt

alias t="$HOME/.rvm/gems/ruby-2.7.0/bin/timetrap"
alias be="bundle exec"
alias berk="bundle exec rake"
alias bers="bundle exec rails"
alias metanorma='docker run -v "$(pwd)":/metanorma/ -w /metanorma metanorma/metanorma metanorma'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg--dotfiles/ --work-tree=$HOME'

# [ -f "$(mnogootex mnogoo)" ] && . "$(mnogootex mnogoo)"

[ -f "$HOME/.fzf.bash" ] && . "$HOME/.fzf.bash"

[ -f "${HOME}/.iterm2_shell_integration.bash" ] && . "${HOME}/.iterm2_shell_integration.bash"

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && . "$HOME/.liquidprompt/liquidprompt"

[ -f "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh" --no-use

[ -f "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"

[ -f "$HOME/google-cloud-sdk/path.bash.inc" ] && . "$HOME/google-cloud-sdk/path.bash.inc"
[ -f "$HOME/google-cloud-sdk/completion.bash.inc" ] && . "$HOME/google-cloud-sdk/completion.bash.inc"

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
