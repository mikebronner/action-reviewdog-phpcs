#!/bin/sh
set -e

if [ -n "${GITHUB_WORKSPACE}" ]; then
    cd "${GITHUB_WORKSPACE}" || exit
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

php /usr/local/bin/phpcs.phar --report=checkstyle --standard=${INPUT_STANDARD} ${INPUT_TARGET_DIRECTORY}\
    | reviewdog -name=PHPCS -f=checkstyle -reporter=${INPUT_REPORTER} -level=${INPUT_LEVEL} -diff='git diff'
