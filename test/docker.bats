#!/usr/bin/env bats

load test_helper

@test "Alpine 3.6 - install & test local worktree" {

  docker run -it --volume $(pwd -P):/opt/bats \
    alpine:3.6 \
    sh -c 'apk --no-cache add bash && '\
'cd /opt/bats/ && '\
'./install.sh /usr/local && '\
'bats test/bats.bats test/suite.bats'
}

@test "Alpine 3.6 - update (re-install) stable from local worktree" {

  # Build container with Bats installed from GIT 
  pushd docker/alpine-dev
  docker build \
    --build-arg BATS_DEV_REPO="https://github.com/bats-core/bats-core.git" \
    --build-arg BATS_DEV_BRANCH=stable \
    --tag bats:dev .
  popd

  # Verify re-install
  docker run -it --volume $(pwd -P):/opt/bats --entrypoint bash \
    bats:dev \
    -c 'apk --no-cache add bash && '\
'cd /opt/bats && '\
'./install.sh /usr/local && echo installed && '\
'bats test/bats.bats test/suite.bats'
}

@test "Baseimage - install & test local worktree" {

  docker run -it --volume $(pwd -P):/opt/bats \
    phusion/baseimage \
    sh -c 'cd /opt/bats/ && '\
'./install.sh /usr/local && '\
'bats test/bats.bats test/suite.bats'
}

#@test "Archlinux - install & test local worktree" {
#
#  docker run -it --volume $(pwd -P):/opt/bats \
#    greyltc/archlinux \
#    sh -c 'cd /opt/bats/ && '\
#'./install.sh /usr/local && '\
#'bats test/bats.bats test/suite.bats'
#}
