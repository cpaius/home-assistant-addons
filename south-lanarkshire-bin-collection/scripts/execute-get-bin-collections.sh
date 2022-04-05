#!/bin/bash
source $HOME/.bash_profile
source /collections/env.sh

mkdir -p ${OUTPUT_FOLDER_NAME}
python3 /collections/south_lanarkshire_council.py

echo ${OUTPUT_FOLDER_NAME}
ls -alrt ${OUTPUT_FOLDER_NAME}

