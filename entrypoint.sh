#!/bin/bash

echo "ENTRYPOINT WORKING"
echo "ALGO=${ALGO}"
echo "POOL=${POOL}"
echo "WORKER=${WORKER}"
echo "TLS=${TLS}"

if [ -z "$POOL" ]; then
  echo "POOL is empty"
  exit 1
fi

if [ -z "$WALLET" ]; then
  echo "WALLET is empty"
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
