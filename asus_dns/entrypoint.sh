#!/bin/sh

echo "ASUS DNS Docker container has been started"

# Run the script once on startup
sh ./run.sh

# Run cron to keep the DNS updated if the server restarts
echo "Starting crond..."
crond -f -d 8
