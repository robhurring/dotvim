#!/usr/bin/env zsh

usage() {
  echo "Usage: $(basename $0) [FLAGS] <ARGS>"
  echo "Flags:"
  echo "  -h    Print help"
  echo
  exit 1
}

while getopts ":h" opt; do
  case $opt in
    \?|h)
      usage
      ;;
  esac
done
shift $((OPTIND-1))

if [ $# -eq 0 ]; then
  usage
fi

# --> Main



