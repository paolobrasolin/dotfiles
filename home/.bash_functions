#-*- mode: shell-script; -*-

maybe_source() {
  [ -f "$1" ] && source "$1"
}
