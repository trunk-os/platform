#!/bin/sh
set -e

# Create config.ts with environment variables
echo "export const config = { API_BASE_URL: '${VITE_API_BASE_URL:-http://trunk.local:5309}', ENABLE_DEBUG_TOOLS: 'false' };" > /srv/config.ts

# Start caddy
exec caddy run --config /etc/caddy/Caddyfile