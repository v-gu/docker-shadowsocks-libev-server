#!/usr/bin/env bash
set -e

# ====== generate arguments ======
if [[ "${SS_UDP}" =~ ^[Tt][Rr][Uu][Ee]|[Yy][Ee][Ss]|1|[Ee][Nn][Aa][Bb][Ll][Ee]$ ]]; then
    SS_UDP_FLAG="-u "
else
    SS_UDP_FLAG=""
fi
if [[ "${SS_FASTOPEN}" =~ ^[Tt][Rr][Uu][Ee]|[Yy][Ee][Ss]|1|[Ee][Nn][Aa][Bb][Ll][Ee]$ ]]; then
    SS_FASTOPEN_FLAG="--fast-open "
else
    SS_FASTOPEN_FLAG=""
fi
# ====== generate arguments ======


echo "Starting Shadowsocks-libev in server mode ..."
exec ss-server \
     -s ${SS_SERVER_TARGET_ADDR} \
     -p ${SS_SERVER_TARGET_PORT} \
     -b ${SS_SERVER_LISTEN_ADDR} \
     -l ${SS_SERVER_LISTEN_PORT} \
     -k ${SS_PASSWORD} \
     -t ${SS_TIMEOUT} \
     -m ${SS_METHOD} \
     -d ${SS_DNS} \
     ${SS_UDP_FLAG} \
     ${SS_FASTOPEN_FLAG} \
     >${SS_LOG} 2>&1
