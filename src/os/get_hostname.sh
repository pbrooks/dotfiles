#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"\
    && . "vars.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
  print_in_purple "\n • Get hostname\n\n"
  echo $1

  if [ -z $HOSTNAME ]; then
    printf "%s" "$HOSTNAME"
    exit 0
  fi


}

main "$@"
