#!/usr/bin/env bash
#
set -e
set -o errtrace # trace ERR through - enabled
set -o errexit  ## set -e : exit the script if any statement returns a non-true return value - enabled

SRC="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
cd "${SRC}" || exit

grep -q "[[:space:]]" <<< "${SRC}" && {
	echo "\"${SRC}\" contains whitespace. Not supported. Aborting." >&2
	exit 1
}

if [[ ! -f "${SRC}"/lib/single.sh ]]; then
	echo "Error: missing build directory structure"
	echo "Please clone the full repository https://github.com/armbian/build/"
	exit 255
fi

source "${SRC}"/lib/single.sh

logging_init

traps_init

[[ "${CONFIG_DEFS_ONLY}" != "yes" && "${PRE_PREPARED_HOST}" != "yes" ]] && git_ensure_safe_directory "${SRC}"

cli_entrypoint "$@"

display_alert "Armbian build script exiting" "very last thing" "cleanup"
