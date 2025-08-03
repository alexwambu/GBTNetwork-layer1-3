#!/bin/bash

# Paths and environment
CHAIN_DATA_DIR=/mnt/data/gbt-chaindata
GENESIS_FILE=genesis.json
ACCOUNT_PASSWORD=pass.txt
ACCOUNT_KEYSTORE_DIR=/mnt/data/keystore

# Step 1: Initialize GBTNetwork with genesis file
if [ ! -d "$CHAIN_DATA_DIR/geth" ]; then
  echo "Initializing chain with $GENESIS_FILE..."
  geth --datadir "$CHAIN_DATA_DIR" init "$GENESIS_FILE"
fi

# Step 2: Start GBTNetwork node
echo "Starting GBTNetwork node..."
geth \
  --datadir "$CHAIN_DATA_DIR" \
  --networkid 999 \
  --http \
  --http.addr "0.0.0.0" \
  --http.port 8545 \
  --http.corsdomain "*" \
  --http.api "eth,net,web3,miner,admin,personal" \
  --ws \
  --ws.addr "0.0.0.0" \
  --ws.port 8546 \
  --ws.origins "*" \
  --ws.api "eth,net,web3,miner" \
  --allow-insecure-unlock \
  --unlock "0xF7F965b65E735Fb1C22266BdcE7A23CF5026AF1E" \
  --password "$ACCOUNT_PASSWORD" \
  --mine \
  --miner.threads=1 \
  --nodiscover \
  --verbosity 3 \
  --syncmode "full"
