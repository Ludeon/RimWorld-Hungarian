#!/usr/bin/env bash

#function include() {
#    # shellcheck disable=SC1090
#    . "$DIR/include/${1}.sh"
#}

function log() {
  echo "${1}"
}

function clean_core() {
  log "Cleaning Core language files..."
  TARGET_DIR="${DLC_ROYALTY_PATH}/Languages/${TARGET_LANGUAGE}/"
  log "-> ${TARGET_DIR}"
  rm -r "${TARGET_DIR}"
}

function update_core() {
  log "Update Core..."
  #  ls -lat "${CORE_PATH}/Languages/Hungarian (Magyar)/"
  SOURCE_DIR="$DIR/../Core"
  log "source: ${SOURCE_DIR}"
  cd "${SOURCE_DIR}" || exit
  TARGET_DIR="${CORE_PATH}/Languages/${TARGET_LANGUAGE}"
  log "target: ${TARGET_DIR}"
  mkdir -p "${TARGET_DIR}"
  cp -r "./" "${TARGET_DIR}"
}

function tar_core() {
  log "Update Core with tar language file..."
  #  ls -lat "${CORE_PATH}/Languages/Hungarian (Magyar)/"
  SOURCE_DIR="$DIR/../Core"
  log "source: ${SOURCE_DIR}"
  cd "${SOURCE_DIR}" || exit
  TAR_FILE="./${TARGET_LANGUAGE}.tar"
  log "${TAR_FILE}"
  #  tar -cf "${TAR_FILE}" ./*
  tar --owner=0 --group=0 --no-same-permissions -cf "${TAR_FILE}" *
  TARGET_DIR="${CORE_PATH}/Languages/${TARGET_LANGUAGE}"
  log "target: ${TARGET_DIR}"
  mv "${TAR_FILE}" "${CORE_PATH}/Languages/"
}

function clean_royalty() {
  log "Cleaning Royalty language files..."
  TARGET_DIR="${DLC_ROYALTY_PATH}/Languages/${TARGET_LANGUAGE}/Keyed"
  log "-> ${TARGET_DIR}"
  rm -r "${TARGET_DIR}"
}

function update_royalty() {
  log "Update Royalty..."
  #  ls -lat "${DLC_ROYALTY_PATH}"
  #  ls -lat "${DLC_TEST_PATH}"
  #  ls -lat "$DIR/../Royalty"
  SOURCE_DIR="$DIR/../Royalty"
  log "source: ${SOURCE_DIR}"
  cd "${SOURCE_DIR}" || exit
  TARGET_DIR="${DLC_ROYALTY_PATH}/Languages/${TARGET_LANGUAGE}"
  log "target: ${TARGET_DIR}"
  mkdir -p "${TARGET_DIR}"
  cp -r "./" "${TARGET_DIR}"
}

function tar_royalty() {
  log "Update Royalty with tar language file..."
  SOURCE_DIR="$DIR/../Royalty"
  log "source: ${SOURCE_DIR}"
  cd "${SOURCE_DIR}" || exit
  TAR_FILE="./${TARGET_LANGUAGE}.tar"
  log "${TAR_FILE}"
  tar --owner=0 --group=0 --no-same-permissions -cf "${TAR_FILE}" *
  TARGET_DIR="${DLC_ROYALTY_PATH}/Languages/${TARGET_LANGUAGE}"
  log "target: ${TARGET_DIR}"
  mv "${TAR_FILE}" "${DLC_ROYALTY_PATH}/Languages/"
}

function update_ideology() {
  log "Update Ideology..."
  ls -lat "${DLC_IDEOLOGY_PATH}"
}

function tar_ideology() {
  log "Update Ideology with tar language file..."
  SOURCE_DIR="$DIR/../Ideology"
  log "source: ${SOURCE_DIR}"
  cd "${SOURCE_DIR}" || exit
  TAR_FILE="./${TARGET_LANGUAGE}.tar"
  log "${TAR_FILE}"
  tar --owner=0 --group=0 --no-same-permissions -cf "${TAR_FILE}" *
  TARGET_DIR="${DLC_ROYALTY_PATH}/Languages/${TARGET_LANGUAGE}"
  log "target: ${TARGET_DIR}"
  mv "${TAR_FILE}" "${DLC_IDEOLOGY_PATH}/Languages/"
}
