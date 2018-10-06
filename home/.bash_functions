#-*- mode: shell-script; -*-

# Source file only if it exists.
maybe_source_script() {
  [ -f "$1" ] && source "$1"
}

# Add folder to path only if it exists.
maybe_export_path() {
  [ -d "$1" ] && export PATH="$1:$PATH"
}
