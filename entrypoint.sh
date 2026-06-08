#!/bin/bash

ARGS="
-a ${ALGO:-rx/0}
-o ${POOL}
-u ${WALLET}
-p ${PASS:-x}
--rig-id ${WORKER:-akash}
"

if [ "${TLS}" = "true" ]; then
  ARGS="$ARGS --tls"
fi

exec /usr/local/bin/xmrig $ARGS
