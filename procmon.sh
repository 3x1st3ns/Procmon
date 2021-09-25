#!/bin/bash
echo "[*] It may take a little while, please wait a little while"
sleep 2

old_process=$(ps -eo command)

while true; do
	new_process=$(ps -eo command)
	diff <(echo "$old_process") <(echo "$new_process") | grep "[\>\<]" | grep -v -E 'procmon|command|kworker'
	old_process=$new_process
done
