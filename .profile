# shellcheck shell=sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="$HOME/.cargo/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export PATH="/Applications/LibreOffice.app/Contents/MacOS:$PATH"

export PATH="$HOME/perl5/bin${PATH:+:${PATH}}"
export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"

export PATH="${PATH:+${PATH}:}$HOME/esp/xtensa-esp32-elf/bin"
export IDF_PATH=$HOME/esp/esp-idf

export PATH="${PATH:+${PATH}:}/usr/local/sbin"
export PATH="${PATH:+${PATH}:}$HOME/.local/bin"

export NVM_DIR="$HOME/.nvm"

# export PATH="${PATH:+${PATH}:}$HOME/Library/Haskell/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="${PATH:+${PATH}:}$HOME/.rvm/bin"
