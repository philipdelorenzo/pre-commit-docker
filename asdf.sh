#!/usr/bin/env bash
#set -eu pipefail

export PATH=/sbin:/bin:/usr/sbin:/usr/bin

# asdf installation
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0

# asdf setup
echo '. ~/.asdf/asdf.sh' >> ~/.bashrc
echo '. ~/.asdf/completions/asdf.bash' >> ~/.bashrc

# shellcheck disable=SC1091
bash -c '. ~/.bashrc'
. ~/.asdf/asdf.sh
. ~/.asdf/completions/asdf.bash

# nodejs/ruby prerequisites & setup
#asdf plugin-add ruby
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

# import the nodejs release team's pgp keys to main keyring
#bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

# install ruby & nodejs via asdf
asdf install

# install linters from asdf managed binaries
npm install -g --unsafe-perm markdownlint-cli
npm install --save-dev --save-exact prettier
#gem install rufo

