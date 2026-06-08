#!/bin/bash

echo "=================================="
echo "ALGO=${ALGO}"
echo "POOL=${POOL}"
echo "WORKER=${WORKER}"
echo "TLS=${TLS}"
echo "=================================="

if [ -z "$POOL" ]; then
  echo "ERROR: POOL is empty"
  exit 1
fi

if [ -z "$WALLET" ]; then
  echo "ERROR: WALLET is empty"
  exit 1
fi

CMD=(
  /usr/local/bin/xmrig
  -a "${ALGO:-rx/0}"
  -o "${POOL}"
  -u "${WALLET}"
  -p "${PASS:-x}"
  --rig-id "${WORKER:-akash}"
)

if [ "${TLS}" = "true" ]; then
  CMD+=(--tls)
fi

echo "Launching:"
printf '%q ' "${CMD[@]}"
echo

exec "${CMD[@]}"
