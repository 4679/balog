#!/bin/bash

source modules/time.sh
source modules/sort.sh
source modules/get_config.sh
source modules/get_meta.sh
source modules/get_page_meta.sh
source modules/gen_post.sh
source modules/gen_page.sh
source modules/gen.sh

content_path="$(pwd)/content"
config_path="$(pwd)/config.toml"
themes_path="$(pwd)/themes"
tmp_path="$(pwd)/.tmp"
work_dir="$(pwd)"

rm -rf $tmp_path/* > /dev/null 2>&1
sort_file
echo "[$(date +%T)] "开始生成
echo "[$(date +%T)] "-----------------------
time gen
