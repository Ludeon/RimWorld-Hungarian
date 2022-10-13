#!/bin/bash

INSTALLED_GAME_ROOT_PATH="${INSTALLED_GAME_ROOT_PATH:-("/c/Program Files (x86)/Steam/steamapps/common/RimWorld")}"
TARGET_LANGUAGE="${TARGET_LANGUAGE:-"Hungarian (Magyar)"}"

DIR="${BASH_SOURCE%/*}"
#echo ${DIR}
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
# override environment variables
source ./.env

CORE_PATH=${INSTALLED_GAME_ROOT_PATH}/Data/Core
DLC_ROYALTY_PATH=${INSTALLED_GAME_ROOT_PATH}/Data/Royalty
DLC_IDEOLOGY_PATH=${INSTALLED_GAME_ROOT_PATH}/Data/Ideology
DLC_TEST_PATH=${INSTALLED_GAME_ROOT_PATH}/Data/Test

# include common parts
source ./include/_common.sh
# include dependencies
source ./include/help-option.sh

while [[ $# -gt 0 ]]; do
  case "${1}" in

  -i | --info)
    echo "Language: ${TARGET_LANGUAGE}"
    echo "------------------------------"
    echo "Path:"
    echo "- Installed Game Root: ${INSTALLED_GAME_ROOT_PATH}"
    echo "- Core: ${CORE_PATH}"
    echo "- Royalty: ${DLC_ROYALTY_PATH}"
    echo "- Ideology: ${DLC_IDEOLOGY_PATH}"
    shift
    ;;

  -h | --help)
    help_option
    shift
    ;;

  -u | --update-all)
    tar_core
    tar_royalty
    tar_ideology
    shift
    ;;

  --update-core)
    clean_core
    tar_core
    shift
    ;;

  --update-royalty)
    clean_royalty
    #    update_royalty
    tar_royalty
    shift
    ;;

  --update-ideology)
    #    update_ideology
    clean_ideology
    tar_ideology
    shift
    ;;

  *)
    echo "${1} is not a valid option, try running: ${0} --help"
    ;;

  esac
  shift
done
