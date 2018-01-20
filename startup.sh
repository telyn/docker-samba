#!/bin/bash
set -x

echo "$USERS" | while read line; do
	USERNAME="${line##*:}"
	PASSWORD="${line%%:*}"
	useradd "$USERNAME"
	echo "$PASSWORD" | smbpasswd -a "$USERNAME"
done

smbd -F --log-stdout -s /etc/samba/smb.conf < /dev/null
