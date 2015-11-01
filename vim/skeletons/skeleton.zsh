#!/usr/bin/env zsh

function usage() {
  echo "Usage: $(basename $0)"
}

while getopts ":" opt; do
  case $opt in
    *)
      usage
      ;;
  esac
done

