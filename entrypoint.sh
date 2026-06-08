#!/bin/bash

exec /usr/local/bin/xmrig \
  -a "${ALGO:-rx/0}" \
  -o "${POOL}" \
  -u "${WALLET}" \
  -p "${PASS:-x}" \
  --rig-id "${WORKER:-akash}" \
  ${TLS:+--tls}
