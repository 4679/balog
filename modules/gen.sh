#!/bin/bash

gen() {
local dest_path="$work_dir/public"
local theme_path="$themes_path/$(get_config theme)"
local index_path=${theme_path}/layouts/index
local partials_path=${theme_path}/layouts/partials
local default_path=${theme_path}/layouts/_default
local baseurl="$(get_config baseurl)"
local post_index=$(cat $tmp_path/list.tmp | wc -l)
rm -rf $dest_path/*

cat $partials_path/header.html >> $dest_path/index.html
cat $index_path/index1.html >> $dest_path/index.html
sed -i "s/{{ .Title }}/Index/g" $dest_path/index.html

i=0
while [[ $i -lt $post_index ]]; do
    i=$(expr $i + 1)
    local post_name=$(cat $tmp_path/list.tmp | sed -n "${i},${i}p" | cut -f 2 -d " " | sed 's/.md//')
    local post_title=$(get_meta $post_name title)
    local post_link="$(get_config baseurl)$(get_meta $post_name slug)/"
    local post_date=$(get_meta $post_name date)
    local post_date=$(format_date $post_date)
    cat $index_path/post.html >> $dest_path/index.html
    sed -i "s#{{ .Postlink }}#$post_link#g" $dest_path/index.html
    sed -i "s#{{ .Title }}#$post_title#g" $dest_path/index.html
    sed -i "s#{{ .Date }}#$post_date#g" $dest_path/index.html
    gen_post $post_name
    echo "[$(date +%T)] " 标题: $post_title
done

cat $index_path/index2.html >> $dest_path/index.html
cat $partials_path/footer.html >> $dest_path/index.html

sed -i "s/{{ .Site.LanguageCode }}/$(get_config languageCode)/g" $dest_path/index.html
sed -i "s/{{ .Site.Title }}/$(get_config title )/g" $dest_path/index.html
sed -i "s/{{ .Site.Params.subtitle }}/$(get_config subtitle )/g" $dest_path/index.html
sed -i "s#{{ .Permalink }}#$baseurl#g" $dest_path/index.html
sed -i "s#{{ .Site.BaseURL }}#$(get_config baseurl)#g" $dest_path/index.html
sed -i "s#{{ .Site.Params.about }}#$(get_config about)#g" $dest_path/index.html
sed -i "s#{{ .Site.Params.github }}#$(get_config github)#g" $dest_path/index.html
sed -i "s#{{ .Site.Params.weibo }}#$(get_config weibo)#g" $dest_path/index.html
sed -i "s#{{ .Site.Params.links }}#$(get_config links)#g" $dest_path/index.html
sed -i "s#{{ .Site.Params.profile }}#$(get_config profile)#g" $dest_path/index.html
sed -i "s/{{ .Site.Params.name }}/$(get_config name)/g" $dest_path/index.html

local page_index=$(cat $tmp_path/page.tmp | wc -l)
p=0
while [[ $p -lt $page_index ]]; do
    p=$(expr $p + 1)
    local page_file_name=$(cat $tmp_path/page.tmp | sed -n "${p},${p}p" | sed 's/.md//')
    gen_page $page_file_name
done

cp -r $theme_path/static/* $dest_path/

echo "[$(date +%T)] "-----------------------
echo "[$(date +%T)] "一共生成了${i}篇博客 $(ls -l $content_path/page | grep ".md" | wc -l)个页面
}
