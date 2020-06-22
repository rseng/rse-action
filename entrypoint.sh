#!/bin/bash

set -e

# Have the GitHub workspace be the $PWD.
cd "${GITHUB_WORKSPACE}"

printf "Found files in workspace:\n"
ls

# define config file
if [ ! -z "${INPUT_REPO}" ]; then
    printf "Cloning ${INPUT_REPO}\n"
    git clone "${INPUT_REPO}" software
    cd software
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

# Export directory is not optional
COMMAND="${COMMAND} ${INPUT_EXPORT_DIR}"
echo "${COMMAND}"

${COMMAND}
echo $?
