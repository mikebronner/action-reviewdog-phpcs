#!/bin/sh
set -e

if [ -n "${GITHUB_WORKSPACE}" ]; then
    cd "${GITHUB_WORKSPACE}" || exit
    git config --global --add safe.directory "${GITHUB_WORKSPACE}" || exit 1
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

php ${INPUT_EXECUTABLE} --report=checkstyle --standard=${INPUT_STANDARD} ${INPUT_TARGET_DIRECTORY} -q \
    | reviewdog -name=PHPCS -f=checkstyle -reporter=${INPUT_REPORTER} -level=${INPUT_LEVEL} -diff='git diff' -tee
