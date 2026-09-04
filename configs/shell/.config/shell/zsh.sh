bindkey -v
bindkey -M viins '^E' autosuggest-accept

case "$(uname -s)" in
  Darwin)
    if [ -n "${HOMEBREW_PREFIX:-}" ]; then
      brew_prefix="$HOMEBREW_PREFIX"
    elif [ -d /opt/homebrew ]; then
      brew_prefix=/opt/homebrew
    else
      brew_prefix=/usr/local
    fi
    source "$brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    source "$brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    unset brew_prefix
    ;;
  Linux)
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    ;;
esac

autoload -Uz compinit
compinit
