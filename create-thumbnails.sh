#!/usr/bin/env bash

# create a thumbnail with suffix '-small.jpg' for all jpg sketchnotes

thumbnailSuffix='-small.jpg'

GLOBIGNORE="*$thumbnailSuffix"
for image in Resources/images/sketchnotes/*; do
	echo "converting $image"
	convert "$image" \
		-resize 500 \
		-quality 70 \
		"${image%.jpg}$thumbnailSuffix"
done
