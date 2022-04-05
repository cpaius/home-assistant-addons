#!/usr/bin/with-contenv bashio

echo "Running South Lanarkshire Bin Collection addon"

mkdir -p collections
pushd collections
declare refresh_interval


sh /collections/execute-get-bin-collections.sh

echo "sh /collections/execute-get-bin-collections.sh" > /etc/periodic/hourly/collections
chmod +x /etc/periodic/hourly/collections



popd