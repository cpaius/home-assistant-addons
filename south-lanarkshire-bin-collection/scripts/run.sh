#!/usr/bin/with-contenv bashio

echo "Running South Lanarkshire Bin Collection addon"

sh /collections/execute-get-bin-collections.sh

python3 -m http.server 8000