#!/usr/bin/with-contenv bashio

echo "Running South Lanarkshire Bin Collection addon"

mkdir -p collections
pushd collections

REFRESH_INTERVAL_SECONDS=$(bashio::config 'refresh_interval_seconds')

pip install -r requirements.txt

echo "sh /collections/execute-get-bin-collections.sh" > /etc/cron.hourly/collections
chmod +x /etc/cron.hourly/collections

popd