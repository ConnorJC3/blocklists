#!/usr/bin/env bash

mkdir -p output
rm -f output/*.txt
while read list; do
  curl $list \
  | sed '/^[[:blank:]]*#/d;/^$/d;s/#.*//;s/^/0.0.0.0 /' \
  | sed '/time\.samsungcloudsolution\.com/d' \
  | sed '/cdn\.samsungcloudsolution\.com/d' \
  > output/$(basename $list)
done < lists.txt
