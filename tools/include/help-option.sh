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

OPTIONS:
    -h|--help                           Show this message
    -i|--info                           Show environment variables

  Tools:
    -u|--update-all                     Update All

    --update-core                       Update Core
    --update-royalty                    Update Royalty
    --update-ideology                   Update Ideology

EOF
}
