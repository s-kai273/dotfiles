for f in ~/.config/shell/*.sh; do
  [ -f "$f" ] && . "$f"
done

