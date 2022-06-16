#!/usr/bin/env bash

export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin

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
  && if [ -d ".circleci" ]; then /home/linter/circleci config validate .circleci/config.yml; else echo "No CircleCi config found...continuing."; fi
  #&& echo "Checking Ruby code..." \
  #&& rufo . \
