#!/bin/bash

set -euo pipefail

URL_PORT="${1:-3000}"
URL_PATH="${2:-/health/status}"

curl --fail --silent --show-error "http://localhost:${URL_PORT}${URL_PATH}" || exit 1
