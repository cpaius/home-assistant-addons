#!/usr/bin/with-contenv bashio

echo "Running South Lanarkshire Bin Collection addon"

mkdir -p collections
pushd collections

python3 -m pip install -r requirements.txt

echo "sh /collections/execute-get-bin-collections.sh" > /etc/cron.hourly/collections
chmod +x /etc/cron.hourly/collections

popd