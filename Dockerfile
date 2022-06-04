FROM ubuntu:focal-20200720

ENV PRE_COMMIT_HOME=/.pre-commit-cache
ENV PATH="/sbin:/bin:/usr/sbin:/usr/bin:${HOME}/.local/bin"

WORKDIR /worker

# Non Root please
RUN useradd -m linter
RUN usermod -aG linter linter
RUN newgrp linter

COPY .tool-versions /home/linter/.tool-versions
COPY setup.sh setup.sh
COPY pre-commit.sh pre-commit.sh
COPY asdf.sh asdf.sh
RUN chown -R linter:linter /worker

# Install apt packages and system level resources
RUN bash /worker/setup.sh

USER linter

RUN bash /worker/asdf.sh

WORKDIR /src
