#!/usr/bin/with-contenv bashio

echo "Running South Lanarkshire Bin Collection addon"

mkdir -p collections

chmod +x /collections/execute-get-bin-collections.sh
sh /collections/execute-get-bin-collections.sh

echo "sh /collections/execute-get-bin-collections.sh" > /etc/periodic/hourly/collections
chmod +x /etc/periodic/hourly/collections
