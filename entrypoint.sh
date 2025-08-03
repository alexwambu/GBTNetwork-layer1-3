#!/bin/bash

# Generate self-signed certs if not present
if [ ! -f /app/ssl/ssl-key.pem ]; then
  echo "Generating SSL certs..."
  mkdir -p /app/ssl
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /app/ssl/ssl-key.pem \
    -out /app/ssl/ssl-cert.pem \
    -subj "/CN=GBTNetwork"
fi

# Start geth
echo "Starting GBTNetwork node..."
geth --datadir /app/data init /app/genesis.json
geth --datadir /app/data \
  --networkid 999 \
  --http --http.addr 0.0.0.0 --http.port 8545 \
  --http.api personal,eth,net,web3,miner \
  --allow-insecure-unlock \
  --nodiscover \
  --mine --miner.threads=1 \
  --unlock 0 \
  --password /app/gbt.beth
