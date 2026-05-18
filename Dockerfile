FROM n8nio/n8n:latest

USER root

RUN printf '%s\n' \
  '#!/bin/sh' \
  'export N8N_PORT="${PORT}"' \
  'export N8N_LISTEN_ADDRESS=0.0.0.0' \
  'exec tini -- /docker-entrypoint.sh' \
  > /start.sh && chmod +x /start.sh

ENTRYPOINT ["/start.sh"]