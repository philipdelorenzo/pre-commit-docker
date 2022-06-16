#!/usr/bin/env bash

# source asdf setup
. ~/.bashrc
# shellcheck disable=SC1090
. ~/.asdf/asdf.sh

# Add this safe directory so we can check the code
git config --global --add safe.directory /src

cd /src || exit 1 && pre-commit run --all-files \
  && echo "[ADDON] - Checking HTML files (prettier)..." \
  && npx prettier --write . \
  && echo "[ADDON] - Checking CircleCi Config (circleci)..." \
  && if [ -d "/src/.circleci" ]; then /home/linter/circleci config validate /src/.circleci/config.yml; else echo "No CircleCi config found...continuing."; fi
  #&& echo "Checking Ruby code..." \
  #&& rufo . \
