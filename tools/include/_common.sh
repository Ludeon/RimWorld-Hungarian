#!/usr/bin/env bash

#function include() {
#    # shellcheck disable=SC1090
#    . "$DIR/include/${1}.sh"
#}

function log() {
  echo "${1}"
}

function clean_language_dir() {
  TARGET_DIR="$2/Languages/${TARGET_LANGUAGE}/"
  log "-> Removing $1 language dir ($TARGET_DIR)"
  if [[ -d $TARGET_DIR ]]; then
    rm -r "${TARGET_DIR}"
    log "-> $1 language directory removed..."
  else
    log "-> $1 language directory does not exist..."
  fi
}

function remove_all_language_dir() {
  clean_language_dir "Core" "${CORE_PATH}"
  clean_language_dir "Royalty" "${DLC_ROYALTY_PATH}"
  clean_language_dir "Ideology" "${DLC_IDEOLOGY_PATH}"
  clean_language_dir "Biotech" "${DLC_BIOTECH_PATH}"
  clean_language_dir "Anomaly" "${DLC_ANOMALY_PATH}"
}

function remove_tar_file() {
  TAR_FILE="$2/Languages/${TARGET_LANGUAGE}.tar"
  log "-> Checking $1 tar file... ($2)"
  if [[ -f "$TAR_FILE" ]]; then
    rm "$TAR_FILE"
    log "--> $1 language tar file deleted..."
  else
    log "--> $1 language tar file does not exist..."
  fi
}

function remove_all_tar() {
  log "Removing all tar files..."
  remove_tar_file "Core" "${CORE_PATH}"
  remove_tar_file "Royalty" "${DLC_ROYALTY_PATH}"
  remove_tar_file "Ideology" "${DLC_IDEOLOGY_PATH}"
  remove_tar_file "Biotech" "${DLC_BIOTECH_PATH}"
  remove_tar_file "Anomaly" "${DLC_ANOMALY_PATH}"
}

function update() {
  log "-> Updating $1..."
  SOURCE_DIR="$DIR/../$1"
  log "--> Source: ${SOURCE_DIR}"
  cd "${SOURCE_DIR}" || exit
  TARGET_DIR="$2/Languages/${TARGET_LANGUAGE}"
  log "--> Target: ${TARGET_DIR}"
  mkdir -p "${TARGET_DIR}"
  cp -r "./" "${TARGET_DIR}"
  log "-> $1 updated."
}

function update_all() {
  log "Updating language files..."
  update "Core" "${CORE_PATH}"
  update "Royalty" "${DLC_ROYALTY_PATH}"
  update "Ideology" "${DLC_IDEOLOGY_PATH}"
  update "Biotech" "${DLC_BIOTECH_PATH}"
  update "Anomaly" "${DLC_ANOMALY_PATH}"
}

function tar_module() {
    log "-> Tar $1 language module..."
    SOURCE_DIR="$DIR/../$1"
    log "--> Source: ${SOURCE_DIR}"
    cd "${SOURCE_DIR}" || exit
    TAR_FILE="./${TARGET_LANGUAGE}.tar"
    log "--> TAR_FILE: ${TAR_FILE}"
    tar --owner=0 --group=0 --no-same-permissions -cf "${TAR_FILE}" *
    TARGET_DIR="$2/Languages/${TARGET_LANGUAGE}"
    log "--> Target: ${TARGET_DIR}"
    mv "${TAR_FILE}" "$2/Languages/"
}

function tar_all() {
    log "Tar language files..."
    tar_module "Core" "${CORE_PATH}"
    tar_module "Royalty" "${DLC_ROYALTY_PATH}"
    tar_module "Ideology" "${DLC_IDEOLOGY_PATH}"
    tar_module "Biotech" "${DLC_BIOTECH_PATH}"
    tar_module "Anomaly" "${DLC_ANOMALY_PATH}"
}

function sync_with_game() {
  log "-> Syncing with game after cleanup tool... "
  sync "Core" "${CORE_PATH}"
  sync "Royalty" "${DLC_ROYALTY_PATH}"
  sync "Ideology" "${DLC_IDEOLOGY_PATH}"
  sync "Biotech" "${DLC_BIOTECH_PATH}"
  sync "Anomaly" "${DLC_ANOMALY_PATH}"
}

function sync() {
  log "-> Syncing $1..."
  SOURCE_DIR="$2/Languages/${TARGET_LANGUAGE}"
  log "--> Source: ${SOURCE_DIR}"
  cd "${SOURCE_DIR}" || exit
  TARGET_DIR="${PROJECT_DIR}/$1"
  log "--> Target: ${TARGET_DIR}"
  mkdir -p "${TARGET_DIR}"
  cp -r "./" "${TARGET_DIR}"
  log "-> $1 synced."
}

function extract_module() {
    log "-> Extract $1 language module..."
    TAR_FILE="$2/Languages/${TARGET_LANGUAGE}.tar"
    log "--> TAR_FILE: ${TAR_FILE}"
    TARGET_DIR="$2/Languages/${TARGET_LANGUAGE}"
    log "--> Target: ${TARGET_DIR}"
    mkdir -p "${TARGET_DIR}"
#    cd "${TARGET_DIR}" || exit
    tar --owner=0 --group=0 --no-same-permissions -xf "${TAR_FILE}" -C "${TARGET_DIR}"
    remove_tar_file "Core" "${2}"
}

function extract_all() {
    log "Extract language files..."
    extract_module "Core" "${CORE_PATH}"
    extract_module "Royalty" "${DLC_ROYALTY_PATH}"
    extract_module "Ideology" "${DLC_IDEOLOGY_PATH}"
    extract_module "Biotech" "${DLC_BIOTECH_PATH}"
    extract_module "Anomaly" "${DLC_ANOMALY_PATH}"
}
