#!/bin/bash

set -euo pipefail

URL_PORT="${1:-3000}"
URL_PATH="${2:-/health/status}"

curl --fail --silent --show-error -H 'User-Agent: com.goodguide.docker_base_image.internal_health_check/v1' "http://localhost:${URL_PORT}${URL_PATH}" || exit 1
