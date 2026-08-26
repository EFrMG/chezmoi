# Fix Nvim opening with the explorer open (Omarchy)
# It would now open up the tree hierarchy if a project exists
unset -f n

# Shallow fzf cd; cd to created directory
cda() {
  local selection
  selection=$(fd -H -t d --max-depth 1 . | fzf)

  if [[ -n "$selection" ]]; then
    builtin cd -- "$selection" || return
  fi
}
mkcd() {
  mkdir -p "$1" && builtin cd "$1" || return
}

# Okular
ok() {
  uwsm-app -- okular "$1" &>/dev/null &
}

oka() {
  local selected
  selected=$(fd -t f -d 1 -e pdf | fzf -m)

  if [[ -n "$selected" ]]; then
    echo "$selected" | xargs -d '\n' -r uwsm-app -- okular &>/dev/null &
  fi
}

# Yazi cd on quit
ad() {
  local tmp
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"

  yazi "$@" --cwd-file="$tmp"

  if [[ -f "$tmp" ]]; then
    local cwd
    cwd="$(cat "$tmp")"

    if [[ -n "$cwd" && "$cwd" != "$PWD" ]]; then
      builtin cd -- "$cwd" || return
    fi

    # Clean up the temporary file
    rm -f -- "$tmp"
  fi
}

# Search for aliases
ala() {
  alias | rg "$*"
}

# Limit cpu for a process
# This uses 100% of value per active thread;
# a $1 of "200" would mean a two-threaded CPU would work at full capacity
cpucap() {
  local quota
  quota="$1"

  shift

  systemd-run --scope -p CPUQuota="${quota}%" "$@"
}

# Remove exif information (desctructive)
unexif() {
  exiftool -all= -tagsfromfile @ -Orientation -overwrite_original "$@"
}

# Fzf search Omarchy commands + bat
omaf() {
  local selected
  selected=$(fd -t f -d 1 . "/usr/bin" | xargs basename -a | sed "s/^omarchy-//" | fzf -m \
    --preview "bat --force-colorization --language=bash $OMARCHY_PATH/bin/omarchy-{}" \
    --bind "alt-p:toggle-preview" \
    --bind "alt-d:preview-half-page-down,alt-u:preview-half-page-up" \
    --bind "alt-k:preview-up,alt-j:preview-down")

  if [[ -n "$selected" ]]; then
    echo "$selected" | sed "s|^|$OMARCHY_PATH/bin/omarchy-|" | xargs bat
  fi
}

# Fzf + bat
bata() {
  local selected
  selected="$(fzf -m)"

  if [[ -n $selected ]]; then
    bat "$selected"
  fi
}

