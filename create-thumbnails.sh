#!/usr/bin/env bash

# create a thumbnail with suffix '-small.jpg' for all jpg sketchnotes

thumbnailSuffix='-small.jpg'

for image in Resources/images/sketchnotes/*.jpg; do
	if [[ $image != *$thumbnailSuffix ]]; then
		convert $image \
			-resize 500x500 \
			-quality 70 \
			-set filename:original %t \
			"$(dirname $image)"/%[filename:original]$thumbnailSuffix
	fi
done
