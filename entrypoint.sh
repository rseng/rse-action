#!/bin/bash

set -e

# define config file
if [ ! -z "${INPUT_REPO}" ]; then
    printf "Cloning ${INPUT_REPO}\n"
    git clone "${INPUT_REPO}" software
    cd software
fi

printf "Found files in workspace:\n"
ls

printf "Looking for rse install...\n"
which rse

COMMAND="rse"

# define config file
if [ ! -z "${INPUT_CONFIG}" ]; then
    COMMAND="${COMMAND} --config_file ${INPUT_CONFIG}"
fi

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
