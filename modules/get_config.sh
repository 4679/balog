#!/bin/bash

get_config() {
    local config=${1}
    cat $work_dir/config.toml | grep "$config = \"" | head -n 1 |awk -F " = " '{print $2}' | sed 's/"//' | sed 's/"*$//'
}
