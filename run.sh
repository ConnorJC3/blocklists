#!/usr/bin/env bash

mkdir -p output
while read list; do
  curl $list | sed '/^[[:blank:]]*#/d;/^$/d;s/#.*//;s/^/0.0.0.0 /' > output/$(basename $list)
done < lists.txt
