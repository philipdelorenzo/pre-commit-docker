#!/usr/bin/env bash
set -eu pipefail

export PATH=/sbin:/bin:/usr/sbin:/usr/bin

# initial container setup
apt-get update -qq
apt-get -y install git curl gpg dirmngr

# shell check installation
apt-get -y install shellcheck

# asdf prerequisites
apt-get -y install bsdmainutils

# ruby prerequisites & setup
apt-get -y install autoconf bison build-essential libssl-dev libyaml-dev \
  libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 \
  libgdbm-dev libdb-dev

# Install CircleCi CLI
#curl -fLSs https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/master/install.sh | bash

# python & pip install
apt-get -y install python3-pip
pip3 install pre-commit==2.19.0
