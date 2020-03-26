#!/bin/bash

# create a thumbnail with suffix '-small.jpg' for all jpg sketchnotes

thumbnailSuffix='-small.jpg'
pathToSketchnotes='Resources/images/sketchnotes'

# use this to regenerate all thumbnails
# rm -f $pathToSketchnotes/*$thumbnailSuffix

for image in $pathToSketchnotes/*.jpg; do
	if [[ $image != *$thumbnailSuffix ]]; then
		convert $image \
			-resize 500x500 \
			-set filename:original %t \
			-quality 70 \
			"$(dirname $image)"/%[filename:original]$thumbnailSuffix
	fi
done
