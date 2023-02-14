#!/bin/bash
set -e

# Wait until MongoDB is up
until mongo --eval "print(\"waiting for MongoDB to be available...\")"
do
  sleep 2
done

# Create the root user
echo "Creating root user..."
mongo <<EOF
use Litegix_Backend
db.createUser({
  user: "${MONGO_INITDB_ROOT_USERNAME}",
  pwd: "${MONGO_INITDB_ROOT_PASSWORD}",
  roles: [ { role: "root", db: "admin" } ]
})
EOF

# Start MongoDB with authentication
echo "Starting MongoDB with authentication..."
exec mongod --auth
