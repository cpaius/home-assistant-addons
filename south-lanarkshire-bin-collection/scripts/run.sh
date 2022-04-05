#!/usr/bin/with-contenv bashio

echo "Running South Lanarkshire Bin Collection addon"

mkdir -p collections
pushd collections
declare refresh_interval

refresh_interval=$(bashio::config 'refresh_interval')

bashio::log.info "Refresh interval ${refresh_interval}"
sh /collections/execute-get-bin-collections.sh

echo "sh /collections/execute-get-bin-collections.sh" > /etc/periodic/${refresh_interval}/collections
chmod +x /etc/periodic/${refresh_interval}/collections



popd