#!/bin/bash

function help_option() {
cat << EOF
Usage: ${0} ( -h )

ENVIRONMENT VARIABLES:

    TARGET_LANGUAGE            Language | Default: ${TARGET_LANGUAGE}

    INSTALLED_GAME_ROOT_PATH   File path to the installed game | Default: ${INSTALLED_GAME_ROOT_PATH}
    CORE_PATH                  File path to the Core | Default: ${CORE_PATH}
    DLC_ROYALTY_PATH           File path to the Royalty DLC | Default: ${DLC_ROYALTY_PATH}
    DLC_IDEOLOGY_PATH          File path to the Ideology DLC | Default: ${DLC_IDEOLOGY_PATH}
    DLC_BIOTECH_PATH           File path to the Biotech DLC | Default: ${DLC_BIOTECH_PATH}
    DLC_ANOMALY_PATH           File path to the Anomaly DLC | Default: ${DLC_ANOMALY_PATH}

OPTIONS:
    -h|--help                           Show this message
    -i|--info                           Show environment variables

  Tools:
    -t|--tar-all                        Update Game with standard tar files (like normal installation from Steam)

    --tar-core                          Update Core with standard tar file
    --tar-royalty                       Update Royalty DLC with standard tar file
    --tar-ideology                      Update Ideology DLC with standard tar file
    --tar-biotech                       Update Biotech DLC with standard tar file
    --tar-anomaly                       Update Anomaly DLC with standard tar file

    --remove-all-tar                    Remove all related compressed language files (*.tar)

    -e|--extract-all                    Extract all language files from tar files

    --extract-core                      Extract Core files from tar
    --extract-royalty                   Extract Royalty files from tar
    --extract-ideology                  Extract Ideology files from tar
    --extract-biotech                   Extract Biotech files from tar
    --extract-anomaly                   Extract Anomaly files from tar

    -u|--update-all                     Update All

    --update-core                       Update Core
    --update-royalty                    Update Royalty DLC files
    --update-ideology                   Update Ideology DLC files
    --update-biotech                    Update Biotech DLC files
    --update-anomaly                    Update Anomaly DLC files

    --remove-all-language-dir           Remove all language directories

    --sync                              Syncing the working instance with the game files (after cleanup tool)

EOF
}
