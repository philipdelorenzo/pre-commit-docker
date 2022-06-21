FROM ubuntu:focal

WORKDIR /worker

ENV PRE_COMMIT_HOME=/worker/.pre-commit-cache
ENV PATH="/home/linter/.local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/linter"

# Non Root please
RUN useradd -m linter
RUN usermod -aG linter linter
RUN newgrp linter

COPY .tool-versions /home/linter/.tool-versions
# Run installs of prereqs (apt)
COPY setup.sh setup.sh
COPY asdf.sh asdf.sh
COPY pre-commit.sh pre-commit.sh

RUN chown -R linter:linter /worker

# Install apt packages and system level resources
RUN bash /worker/setup.sh

USER linter
RUN bash /worker/asdf.sh

ENTRYPOINT [ "/worker/pre-commit.sh" ]
