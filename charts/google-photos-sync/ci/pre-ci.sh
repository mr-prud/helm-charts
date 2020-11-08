#!/usr/bin/env bash

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
 echo ${SCRIPTDIR}

mkdir -p ${GITHUB_WORKSPACE}/data/config/ ${GITHUB_WORKSPACE}/data/storage/
envsubst < ${SCRIPTDIR}/github-values.tpl > ${SCRIPTDIR}/github-values.yaml

