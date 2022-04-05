#!/usr/bin/with-contenv bashio

echo "Running South Lanarkshire Bin Collection addon"

mkdir -p collections
pushd collections

REFRESH_INTERVAL_SECONDS=$(bashio::config 'refresh_interval_seconds')

pip3 install -r requirements.txt

echo "sh /collections/execute-get-bin-collections.sh" > /etc/periodic/hourly/collections
chmod +x /etc/periodic/hourly/collections

popd