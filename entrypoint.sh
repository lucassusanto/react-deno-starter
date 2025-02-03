#!/bin/sh

JSON_STRING='window.configs = { \
  "VITE_API_URL":"'"${VITE_API_URL}"'" \
}'
sed -i "s@// CONFIGURATIONS_PLACEHOLDER@${JSON_STRING}@" /app/index.html
exec "$@"
