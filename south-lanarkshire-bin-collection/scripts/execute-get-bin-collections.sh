#!/bin/bash
source /env.sh

mkdir -p ${OUTPUT_FOLDER_NAME}
python3 /south_lanarkshire_council.py

echo ${OUTPUT_FOLDER_NAME}
ls -alrt ${OUTPUT_FOLDER_NAME}

