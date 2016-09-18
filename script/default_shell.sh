#!/bin/bash

set -euo pipefail
shopt -s dotglob

bash -x -c "$@"

tmpdirs=(
	/tmp/
	/var/cache/apk/
)

for tmpdir in ${tmpdirs[@]}; do
	[[ -d $tmpdir ]] || continue
	find $tmpdir -mindepth 1 -delete -print
done
