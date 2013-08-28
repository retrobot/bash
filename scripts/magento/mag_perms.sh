#!/bin/bash

if [ `id -u` !=0 ]; then
	echo "-- you should run this as root"
fi

find . -type f -exec chmod 644 {} \;
find . -type d -exec chmod 755 {} \;

chmod 777 var/ media app/etc
