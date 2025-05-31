#!/bin/bash
set -e

# Start tailscaled in the background
/usr/sbin/tailscaled &

# Wait for tailscaled to be ready
until tailscale status &>/dev/null; do
  sleep 0.5
done

echo "Tailscale is running."

# If TS_AUTHKEY is set, bring up Tailscale
if [ -n "$TS_AUTHKEY" ]; then
  tailscale up --authkey=$TS_AUTHKEY --hostname=${TS_HOSTNAME:-docker-playwright-ts}
fi

# Execute the container's main command
exec "$@"
