#!/bin/bash

get_meta() {
    local meta_file_name=${1}
    local meta=${2}
    cat $content_path/post/$meta_file_name.md | grep "$meta = \"" | head -n 1 | awk -F " = " '{print $2}' | sed 's/"//' | sed 's/"*$//'
}
