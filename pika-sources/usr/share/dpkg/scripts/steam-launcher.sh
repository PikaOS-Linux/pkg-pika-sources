#! /bin/bash

if [[ $1 == pre ]]
then
	if grep -q steam-launcher
	then
		mkdir -p /var/lib/apt/hooks
		touch /var/lib/apt/hooks/steam-launcher
else
		exit 0
	fi
fi

if [[ $1 == post ]]
then
	if [[ -f /var/lib/apt/hooks/steam-launcher  ]]
	then
		rm -rf /etc/apt/sources.list.d/steam-stable.list || echo 'no stable steam repos'
		rm -rf /etc/apt/sources.list.d/steam.list || echo 'no steam repos'
		rm -rf /var/lib/apt/hooks/steam-launcher
	else
		exit 0
	fi
fi

