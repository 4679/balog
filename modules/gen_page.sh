#!/bin/bash

gen_page() {
local page_name=${1}.md
local dest_path="$work_dir/public/$1"
local theme_path="$themes_path/$(get_config theme)"
local partials_path=${theme_path}/layouts/partials
local default_path=${theme_path}/layouts/_default
local permalink="$(get_config baseurl)$(get_page_meta $1 slug)/"
local line_start=$(expr $(cat $content_path/page/$page_name | grep -n "+++" | tail -n 1 | cut -f 1 -d :) + 1)

mkdir -p $dest_path

cat $partials_path/header.html >> $dest_path/index.html
cat $default_path/single.html >> $dest_path/index.html

mkdir -p $tmp_path/page
cat $content_path/page/$page_name | sed -n "$line_start,999999p" > $tmp_path/page/$page_name.tmp
$work_dir/libs/markdown.sh $tmp_path/page/$page_name.tmp >> $dest_path/index.html

cat $default_path/single2.html >> $dest_path/index.html
cat $partials_path/disqus.html >> $dest_path/index.html
cat $partials_path/footer.html >> $dest_path/index.html

sed -i "s/{{.Site.LanguageCode}}/$(get_config languageCode)/g" $dest_path/index.html
sed -i "s/{{ .Title }}/$(get_page_meta $1 title )/g" $dest_path/index.html
sed -i "s/{{ .Site.Title }}/$(get_config title )/g" $dest_path/index.html
sed -i "s/{{ .Site.Params.subtitle }}/$(get_config subtitle )/g" $dest_path/index.html
sed -i "s#{{ .Permalink }}#$permalink#g" $dest_path/index.html
sed -i "s#{{ .Site.BaseURL }}#$(get_config baseurl)#g" $dest_path/index.html
sed -i "s#{{ .Site.Params.about }}#$(get_config about)#g" $dest_path/index.html
sed -i "s#{{ .Site.Params.github }}#$(get_config github)#g" $dest_path/index.html
sed -i "s#{{ .Site.Params.weibo }}#$(get_config weibo)#g" $dest_path/index.html
sed -i "s#{{ .Site.Params.links }}#$(get_config links)#g" $dest_path/index.html
sed -i "s/{{ .Date }}/$(format_date $(get_page_meta $1 date ))/g" $dest_path/index.html
sed -i "s#{{ .Site.Params.profile }}#$(get_config profile)#g" $dest_path/index.html
sed -i "s/{{ .Site.Params.name }}/$(get_config name)/g" $dest_path/index.html
sed -i "s/{{ .Site.DisqusShortname }}/$(get_config disqusShortname)/g" $dest_path/index.html

echo "[$(date +%T)] " 页面标题: $(get_page_meta $1 title)
}
