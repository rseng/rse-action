#!/bin/bash

set -e

# Have the GitHub workspace be the $PWD.
cd "${GITHUB_WORKSPACE}"

printf "Found files in workspace:\n"
ls

# define config file
if [ ! -z "${INPUT_REPO}" ]; then
    if [ -d "${INPUT_REPO}" ]; then
        printf "Found ${INPUT_REPO}\n"
        cd ${INPUT_REPO}
    else
        printf "Cloning ${INPUT_REPO}\n"
        git clone "${INPUT_REPO}" software
        cd software
   fi
fi

printf "Found files in repository:\n"
ls

printf "Looking for rse install...\n"
which rse

COMMAND="rse"

# define config file, needs to be same for server start and export
export RSE_CONFIG_FILE=${INPUT_CONFIG}

# Now we are at export level args
COMMAND="${COMMAND} export"

# force overwrite?
if [ ! -z "${INPUT_FORCE}" ]; then
    COMMAND="${COMMAND} --force"
fi

# A url prefix can be defined to export for some GitHub pages prefix
if [ ! -z "${INPUT_PREFIX}" ]; then
    printf "Prefix: ${INPUT_PREFIX}\n"
    export RSE_URL_PREFIX=${INPUT_PREFIX}
fi

# Export directory is not optional, relative to GITHUB_WORKSPACE so on host
COMMAND="${COMMAND} --type static-web ${GITHUB_WORKSPACE}/${INPUT_EXPORT_DIR}"
echo "${COMMAND}"

${COMMAND}
echo $?
