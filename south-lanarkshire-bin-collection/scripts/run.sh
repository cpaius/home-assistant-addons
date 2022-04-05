#!/usr/bin/with-contenv bashio

echo "Running South Lanarkshire Bin Collection addon"

mkdir -p collections
pushd collections

REFRESH_INTERVAL=$(bashio::config 'refresh_interval')
echo ${REFRESH_INTERVAL}
sh /collections/execute-get-bin-collections.sh

echo "sh /collections/execute-get-bin-collections.sh" > /etc/periodic/${REFRESH_INTERVAL}/collections
chmod +x /etc/periodic/${REFRESH_INTERVAL}/collections



popd