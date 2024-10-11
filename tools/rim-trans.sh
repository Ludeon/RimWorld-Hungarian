#!/bin/bash

INSTALLED_GAME_ROOT_PATH="${INSTALLED_GAME_ROOT_PATH:-("/c/Program Files (x86)/Steam/steamapps/common/RimWorld")}"
TARGET_LANGUAGE="${TARGET_LANGUAGE:-"Hungarian (Magyar)"}"

DIR="${BASH_SOURCE%/*}"
PROJECT_DIR=$(dirname "$(pwd)")
#echo ${DIR}
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
# override environment variables
source ./.env

CORE_PATH=${INSTALLED_GAME_ROOT_PATH}/Data/Core
DLC_ROYALTY_PATH=${INSTALLED_GAME_ROOT_PATH}/Data/Royalty
DLC_IDEOLOGY_PATH=${INSTALLED_GAME_ROOT_PATH}/Data/Ideology
DLC_BIOTECH_PATH=${INSTALLED_GAME_ROOT_PATH}/Data/Biotech
DLC_ANOMALY_PATH=${INSTALLED_GAME_ROOT_PATH}/Data/Anomaly
#DLC_TEST_PATH=${INSTALLED_GAME_ROOT_PATH}/Data/Test

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
    echo "- Project Root: ${PROJECT_DIR}"
    echo "- Installed Game Root: ${INSTALLED_GAME_ROOT_PATH}"
    echo "- Core: ${CORE_PATH}"
    echo "- Royalty: ${DLC_ROYALTY_PATH}"
    echo "- Ideology: ${DLC_IDEOLOGY_PATH}"
    echo "- Biotech: ${DLC_BIOTECH_PATH}"
    echo "- Anomaly: ${DLC_ANOMALY_PATH}"
    shift
    ;;

  -h | --help)
    help_option
    shift
    ;;

  # Tar section

  -t | --tar-all)
    tar_all
    remove_all_language_dir
    shift
    ;;

  --tar-core)
    log "Tar Core"
    tar_module "Core" "${CORE_PATH}"
    clean_language_dir "Core" "${CORE_PATH}"
    shift
    ;;

  --tar-royalty)
    log "Tar Royalty"
    tar_module "Royalty" "${DLC_ROYALTY_PATH}"
    clean_language_dir "Royalty" "${DLC_ROYALTY_PATH}"
    shift
    ;;

  --tar-ideology)
    log "Tar Ideology"
    tar_module "Ideology" "${DLC_IDEOLOGY_PATH}"
    clean_language_dir "Ideology" "${DLC_IDEOLOGY_PATH}"
    shift
    ;;

  --tar-biotech)
    log "Tar Biotech"
    tar_module "Ideology" "${DLC_BIOTECH_PATH}"
    clean_language_dir "Ideology" "${DLC_BIOTECH_PATH}"
    shift
    ;;

  --tar-anomaly)
    log "Tar Anomaly"
    tar_module "Anomaly" "${DLC_ANOMALY_PATH}"
    clean_language_dir "Anomaly" "${DLC_ANOMALY_PATH}"
    shift
    ;;

  --remove-all-tar)
    remove_all_tar
    shift
    ;;

  # Update section

  -u | --update-all)
    update_all
    remove_all_tar
    shift
    ;;

  --update-core)
    log "Updating Core"
    clean_language_dir "Core" "${CORE_PATH}"
    update "Core" "${CORE_PATH}"
    remove_tar_file "Core" "${CORE_PATH}"
    shift
    ;;

  --update-royalty)
    log "Updating Royalty"
    clean_language_dir "Royalty" "${DLC_ROYALTY_PATH}"
    update "Royalty" "${DLC_ROYALTY_PATH}"
    remove_tar_file "Royalty" "${DLC_ROYALTY_PATH}"
    shift
    ;;

  --update-ideology)
    log "Updating Ideology"
    clean_language_dir "Ideology" "${DLC_IDEOLOGY_PATH}"
    update "Ideology" "${DLC_IDEOLOGY_PATH}"
    remove_tar_file "Ideology" "${DLC_IDEOLOGY_PATH}"
    shift
    ;;

  --update-biotech)
    log "Updating Biotech"
    clean_language_dir "Biotech" "${DLC_BIOTECH_PATH}"
    update "Biotech" "${DLC_BIOTECH_PATH}"
    remove_tar_file "Biotech" "${DLC_BIOTECH_PATH}"
    shift
    ;;

  --update-anomaly)
    log "Updating Anomaly"
    clean_language_dir "Anomaly" "${DLC_ANOMALY_PATH}"
    update "Anomaly" "${DLC_ANOMALY_PATH}"
    remove_tar_file "Anomaly" "${DLC_ANOMALY_PATH}"
    shift
    ;;

  --remove-all-language-dir)
    remove_all_language_dir
    shift
    ;;

  --sync)
    sync_with_game
    shift
    ;;

  -e | --extract-all)
    tar_all
    extract_all
    shift
    ;;

  --extract-core)
    log "Extract Core"
    clean_language_dir "Core" "${CORE_PATH}"
    extract_module "Core" "${CORE_PATH}"
    shift
    ;;


  --extract-royalty)
    log "Extract Royalty"
    clean_language_dir "Royalty" "${DLC_ROYALTY_PATH}"
    extract_module "Royalty" "${DLC_ROYALTY_PATH}"
    shift
    ;;

  --extract-ideology)
    log "Extract Ideology"
    clean_language_dir "Ideology" "${DLC_IDEOLOGY_PATH}"
    extract_module "Ideology" "${DLC_IDEOLOGY_PATH}"
    shift
    ;;

  --extract-biotech)
    log "Extract Biotech"
    clean_language_dir "Ideology" "${DLC_BIOTECH_PATH}"
    extract_module "Ideology" "${DLC_BIOTECH_PATH}"
    shift
    ;;

  --extract-anomaly)
    log "Extract Anomaly"
    clean_language_dir "Anomaly" "${DLC_ANOMALY_PATH}"
    extract_module "Anomaly" "${DLC_ANOMALY_PATH}"
    shift
    ;;

  *)
    echo "${1} is not a valid option, try running: ${0} --help"
    ;;

  esac
  shift
done
