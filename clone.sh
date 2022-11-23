#!/bin/bash
set -ex
REPOS=(${REPOS})
REPO_AGE=${REPO_AGE:-"1 month"}
cd /git
set +e
for repo in ${REPOS[@]}; do
  base=$(basename $repo)
  if [ -e $base -o -e $base.git ]; then
    continue
  fi
  git clone --mirror --shallow-since "$REPO_AGE" --shallow-submodules --no-single-branch $repo || \
  git clone --mirror --depth 10 --shallow-submodules --no-single-branch $repo
done
