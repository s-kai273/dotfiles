case "$(uname -s)" in
  Darwin)
    export CLICOLOR=1
    export LSCOLORS=ExGxFxdaCxDaDahbadacec
    ;;
  Linux)
    eval "$(dircolors)"
    alias ls='ls --color=auto'
    ;;
esac
