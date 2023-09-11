#!/bin/bash

f() {
  local black=$(tput setaf 0)
  local red=$(tput setaf 1)
  local green=$(tput setaf 2)
  local yellow=$(tput setaf 3)
  local lime_yellow=$(tput setaf 190)
  local powder_blue=$(tput setaf 153)
  local blue=$(tput setaf 4)
  local magenta=$(tput setaf 5)
  local cyan=$(tput setaf 6)
  local white=$(tput setaf 7)
  local bright=$(tput bold)
  local blink=$(tput blink)
  local reverse=$(tput smso)
  local underline=$(tput smul)

  local reset=$(tput sgr0)
  local title_width=15
  local title_format="${blue}%-${title_width}s${reset}"

  case $1 in
    'info')
      echo "${title_format}%s\\n"
      ;;
    'error')
      echo "${title_format}${red}%s${reset}\\n"
      ;;
  esac
}

# Convinience for printing
log() {
  local title=$1

  printf "$(f info)" "${title}" "${@:2}"
}

error() {
  local title=$1

  printf "$(f error)" "${title}" "${@:2}" 1>&2
}

wrap_output() {
  local title=$1

  while IFS= read -r line; do
    log "${title}" "${line}"
  done
}
  
check_asdf_dependency() {
  if ! asdf &>/dev/null; then
    echo "Required dependency asdf is missing"
    return 1;
  fi
}

check_bundler_dependency() {
  if ! bundler -v &>/dev/null; then
    echo "Required dependency bundler is missing"
    return 1;
  fi
}

check_pg_dependency() {
  if ! pg_ctl --help &>/dev/null; then
    echo "Required dependency postgres is missing"
    return 1;
  fi
}

# Install necessary system requirements
check_asdf_dependency | wrap_output "ASDF"
asdf install | wrap_output "ASDF"

# Make sure we have a databasde
check_pg_dependency | wrap_output "PostgreSQL"
# TODO check if database has been initialized, and if not initialize it
# pg_ctl init | wrap_output "PostgreSQL"
# TODO check if it's already started before attempting to start
# TODO add a non-default user and password for the database
pg_ctl start | wrap_output "PostgreSQL"

# the pg gem needs to be installed to point at the asdf pg
gem install pg -- --with-pg-config=$(asdf where postgres)/bin/pg_config --with-pg-include=$(asdf where postgres)/include --with-pg-lib=$(asdf where postgres)/lib | wrap_output "PostgreSQL Gem"

# intall ruby gems
check_bundler_dependency | wrap_output "Bundler"
bundle install | wrap_output "Bundler"

# Create database and do first migration
./bin/rails db:setup | wrap_output "DB Setup"
./bin/rails db:migrate | wrap_output "DB Migrate"

## Tailwind CSS
./bin/rails tailwindcss:install | wrap_output "Tailwind"
