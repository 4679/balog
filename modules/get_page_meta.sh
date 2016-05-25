#!/bin/bash

get_page_meta() {
    local meta_page_name=${1}
    local page_meta=${2}
    cat $content_path/page/$meta_page_name.md | grep "$page_meta = \"" | head -n 1 | awk -F " = " '{print $2}' | sed 's/"//' | sed 's/"*$//'
}
