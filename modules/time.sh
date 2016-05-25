#!/bin/bash

timestamp() {
echo $(date -d "$1" +%s)
}

format_date() {
    echo $(date -d "$1" +"$(get_config dateFormat)")
}
