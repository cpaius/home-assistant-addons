#!/usr/bin/with-contenv bashio

echo "Running South Lanarkshire Bin Collection addon"

mkdir -p collections
pushd collections

echo "sh /collections/execute-get-bin-collections.sh" > /etc/periodic/$(bashio::config 'refresh_interval')/collections
chmod +x /etc/periodic/$(bashio::config 'refresh_interval')/collections

sh /collections/execute-get-bin-collections.sh

popd