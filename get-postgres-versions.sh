#!/bin/bash

curl_result=$(curl -s "https://hub.docker.com/v2/repositories/library/postgres/tags?page_size=1000")
two_months_ago=$(date -d "$(date -d '2 months ago' +'%Y-%m-01')" +'%Y-%m-%d')
names=$(echo "$curl_result" | jq -r --arg two_months_ago "$two_months_ago" '.results[] | select(.tag_last_pushed > $two_months_ago and (.name | test("^(latest|15|16)"))) | .name')

json_names=()
while IFS= read -r line; do
    json_names+=("\"$line\"")
done <<<"$names"

IFS=,
json_string="{\"versions\":[${json_names[*]}]}"
echo "$json_string"
