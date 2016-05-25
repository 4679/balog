#!/bin/bash

sort_file() {
ls $content_path/post | sed 's/ /\n/g' > $tmp_path/name.tmp
ls $content_path/page | sed 's/ /\n/g' > $tmp_path/page.tmp
local line=$(cat $tmp_path/name.tmp | wc -l)

while [[ $line -gt 0 ]]; do
    local filename=$(cat $tmp_path/name.tmp | sed -n "${line}p")
    local time=$(cat $content_path/post/$filename | grep "date = \"" | awk -F " = " '{print $2}' | sed 's/"//g')
    local timestamp=$(timestamp $time)
    echo "$timestamp $filename" >> $tmp_path/list.tmp
    local line=$(expr $line - 1)
done
sort -r $tmp_path/list.tmp -o $tmp_path/list.tmp
}
