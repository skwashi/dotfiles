mkcd() { mkdir -p "$1" && cd "$1"; }

swap() {
  mv "$1" "$1._tmp" &&
  mv "$2" "$1" &&
  mv "$1._tmp" "$2"
}

git_prev() { git checkout HEAD~; }

git_next() {
  local BRANCH HASH PREV
  BRANCH=$(git show-ref | grep "$(git show-ref -s -- HEAD)" | sed 's|.*/\(.*\)|\1|' | grep -v HEAD | sort -u)
  HASH=$(git rev-parse "$BRANCH")
  PREV=$(git rev-list --topo-order HEAD.."$HASH" | tail -1)
  git checkout "$PREV"
}

mm() {
  youtube-dl ytsearch:"$@" -q -f bestaudio --no-playlist -o - | mpv --no-video --cache=256 -
}

yts() {
  youtube-dl ytsearch:"$@" -q -f bestaudio --no-playlist -o - | mpv --cache=256 -
}

yt() {
  youtube-dl -q -f bestaudio --no-playlist -o - | mpv --cache=256 -
}
