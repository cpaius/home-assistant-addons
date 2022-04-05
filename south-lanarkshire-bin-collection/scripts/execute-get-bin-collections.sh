#!/bin/bash
source /collections/env.sh

mkdir -p ${OUTPUT_FOLDER_NAME}
pip3 install -r /collections/requirements.txt
python3 /collections/south_lanarkshire_council.py

echo ${OUTPUT_FOLDER_NAME}
ls -alrt ${OUTPUT_FOLDER_NAME}

