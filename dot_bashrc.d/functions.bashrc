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
  local selection
  selection=$(fzf -m)

  if [[ -n "$selection" ]]; then
    echo "$selection" | xargs -d '\n' -r uwsm-app -- okular &>/dev/null &
  fi
}

# Yazi cd on quit
yad() {
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
  selected=$(fd -t f --max-depth 1 . "$OMARCHY_PATH/bin" | xargs basename -a | sed "s/^omarchy-//" | fzf -m \
    --preview "bat --force-colorization --language=bash $OMARCHY_PATH/bin/omarchy-{}" \
    --bind "alt-p:toggle-preview" \
    --bind "alt-d:preview-half-page-down,alt-u:preview-half-page-up" \
    --bind "alt-k:preview-up,alt-j:preview-down")

  if [[ -n "$selected" ]]; then
    echo "$selected" | sed "s|^|$OMARCHY_PATH/bin/omarchy-|" | xargs bat
  fi
}

# Edge text to speech
tts() {
  local filewrite
  filewrite=$1

  shift

  cd ~/Music/TTS || return && echo "Could not cd into TTS/"

  edge-tts --write-media "$filewrite.mp3" --text "$*"
}

ttsf() {
  local fileread
  fileread=$1
  local filewrite
  filewrite=$2

  shift 2

  edge-tts -f "$fileread" --write-media "$filewrite.mp3"
}

# Piper text to speech (local) (bad quality)
ttsl() {
  local filewrite
  filewrite=$1

  shift

  cd ~/Music/TTS || return && echo "Could not cd into TTS/"

  uvx --with piper-tts --with pathvalidate python3 -m piper -m en_GB-southern_english_female-low -f "$filewrite.wav" -- "$*"
}

ttslf() {
  local fileread
  fileread=$1
  local filewrite
  filewrite=$2

  shift 2

  cd ~/Music/TTS || return && echo "Could not cd into TTS/"

  uvx --with piper-tts --with pathvalidate python3 -m piper -m en_GB-southern_english_female-low -f "$filewrite.wav" --input-file "$fileread"
}

# Fzf + bat
bata() {
  local selection
  selection="$(fzf -m)"

  if [[ -n $selection ]]; then
    bat "$selection"
  fi
}

# Fix tdl closing nvim with sleeps (Omarchy)
tdl() {
  [[ -z $1 ]] && {
    echo "Usage: tdl <c|cx|codex|other_ai> [<second_ai>]"
    return 1
  }
  [[ -z $TMUX ]] && {
    echo "You must start tmux to use tdl."
    return 1
  }
  local current_dir="${PWD}"
  local editor_pane ai_pane ai2_pane
  local ai="$1"
  local ai2="$2"
  editor_pane="$TMUX_PANE"
  tmux rename-window -t "$editor_pane" "$(basename "$current_dir")"
  tmux split-window -v -p 15 -t "$editor_pane" -c "$current_dir"
  ai_pane=$(tmux split-window -h -p 30 -t "$editor_pane" -c "$current_dir" -P -F '#{pane_id}')
  if [[ -n $ai2 ]]; then
    ai2_pane=$(tmux split-window -v -t "$ai_pane" -c "$current_dir" -P -F '#{pane_id}')
    tmux send-keys -t "$ai2_pane" "$ai2" C-m
  fi
  sleep 1
  tmux send-keys -t "$ai_pane" "$ai" C-m
  sleep 1
  tmux send-keys -t "$editor_pane" "$EDITOR ." C-m
  sleep 1
  tmux select-pane -t "$editor_pane"
}
