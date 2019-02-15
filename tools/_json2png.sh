#!/bin/bash

cd "$(dirname "$0")"

IMG_DIR=../img/
JSON_DIR=../img/json

j2p="json_to_plot_seaborn.py"
dpi=300
for json in `find $JSON_DIR -name "*.json" `; do
    fname=$(basename $json)
    png="$IMG_DIR${fname/%.json/.png}"
    if [ ! -f $png ] || [ "$json" -nt "$png" ]; then
        echo "Creatiing $png ..."
        python3 $j2p "$json" -f --dpi "$dpi" -o $png
    else
        echo "not createing $png"
    fi
done
