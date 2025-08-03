FROM ethereum/client-go:stable

COPY genesis.json /app/genesis.json
COPY gbt.beth /app/gbt.beth
COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
