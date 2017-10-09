#!/usr/bin/env bash

print_info() {
  printf "\e[0;35m $1\e[0m\n"
}

print_question() {
  # Print output in yellow
  printf "\e[0;33m  [?] $1\e[0m: "
}

print_success() {
  printf "\e[0;32m  [✔] $1\e[0m\n"
}

print_error() {
  printf "\e[0;31m  [✖] $1 $2\e[0m\n"
}

print_message() {
  printf "  > $1\n"
}

answer_is_yes() {
  [[ "$REPLY" =~ ^[Yy]$ ]] \
    && return 0 \
    || return 1
}

get_answer() {
  printf "$REPLY"
}

ask_for_confirmation() {
  print_question "$1 (y/n) "
  read -n 1
  printf "\n"
}

get_os() {
  declare -r OS_NAME="$(uname -s)"
  OS=""
  if [ "$OS_NAME" == "Darwin" ]; then
    OS="macOS"
  elif [ "$OS_NAME" == "Linux" ] && [ -e "/etc/lsb-release" ]; then
    OS="ubuntu"
  fi

  print_info "$OS 확인 됨"
}
