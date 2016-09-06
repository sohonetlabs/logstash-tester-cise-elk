#!/bin/bash

set -ex

GIT_REPO="puppet-controlrepo"
GIT_HOME="${HOME}/git/${GIT_REPO}"

if [ ! -d data/config ]; then
  mkdir -p data/config/{conf.d,patterns}
fi

rsync -av --delete $GIT_HOME/dist/profiles/files/etc/logstash/processor/ data/config/conf.d/
rsync -av --delete $GIT_HOME/dist/profiles/files/etc/logstash/patterns/ data/config/patterns/

./logstash-tester.sh -d data filters
