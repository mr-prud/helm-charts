#!/usr/bin/env bash
for d in ${GITHUB_WORKSPACE}/charts/*/ ; do
    ${d}ci/pre-ci.sh
done
