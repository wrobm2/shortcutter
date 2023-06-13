#!/bin/bash

# Where binds are stored:
SHORTCUT_FILE="$HOME/.cd_shortcuts"

cdsa() {
  if [ $# -eq 0 ]; then
    echo "Usage: cdsa [shortcut] [directory]"
    echo "Note: cdsa means cds ADD, so you are adding [shortcut] that leads to [directory]"
    return 1
  fi

  shortcut="$1"
  directory="$2"

  # if no directory stated
  if [ -z "$directory" ]; then
    directory="$PWD"
  fi

  #convert directory from parameter into absolute path 
  directory=$(realpath "$directory")

  #check if shortcut already in file
  if grep -q "^$shortcut=" "$SHORTCUT_FILE"; then
    echo "Shortcut '$shortcut' already exists"
    return 1
  fi

  # add shortcut to file 
  echo "$shortcut=$directory" >> "$SHORTCUT_FILE"
  echo "Shortcut '$shortcut' created for directory '$directory'"

}

cds() {
  if [ $# -eq 0 ]; then
    echo "Usage: cds [shortcut]"
    return 1
  fi

  shortcut="$1"

  #check if shortcut exists
  if ! grep -q "^$shortcut=" "$SHORTCUT_FILE"; then
    echo "Shortcut '$shortcut' does not exist"
    echo "use cdsa [shortcut] [directory] to add it"
    return 1
  fi

  #get the directory associated with the shortcut
  directory=$(grep "^$shortcut=" "$SHORTCUT_FILE" | cut -d= -f2)

  #Change to directory 
  cd "$directory"
}

cdsl() {
  if [ $# -eq 0 ]; then
    # list all shortcuts 
    while IFS='=' read -r shortcut directory; do
      echo "$shortcut : $directory"
    done < "$SHORTCUT_FILE"
    echo "Do note, you can delete any of these under '$SHORTCUT_FILE'"
  else
    while IFS='=' read -r shortcut directory; do
      if echo "$shortcut" | grep -q "$1"; then
        echo "$shortcut : $directory"
      fi
    done < "$SHORTCUT_FILE"
    echo "Do note, you can delete any of these under '$SHORTCUT_FILE'"
  fi
}

if [ ! -f "$SHORTCUT_FILE" ]; then
  touch "$SHORTCUT_FILE"
fi
