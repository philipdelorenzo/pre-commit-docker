FROM ubuntu:focal

WORKDIR /worker

ENV PRE_COMMIT_HOME=/worker/.pre-commit-cache
ENV PATH="/sbin:/bin:/usr/sbin:/usr/bin:${HOME}/.local/bin"

# Non Root please
RUN useradd -m linter
RUN usermod -aG linter linter
RUN newgrp linter

COPY .tool-versions /home/linter/.tool-versions
# Run installs of prereqs (apt)
COPY setup.sh setup.sh
COPY asdf.sh asdf.sh

# Install CircleCi Validation tool
# NOTE: Pull this from the internet (fork it)
RUN curl -fLSs https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/master/install.sh | bash

COPY pre-commit.sh pre-commit.sh
RUN chown -R linter:linter /worker

# Install apt packages and system level resources
RUN bash /worker/setup.sh
USER linter
RUN bash /worker/asdf.sh
