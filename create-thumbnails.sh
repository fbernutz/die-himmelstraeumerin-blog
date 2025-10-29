#!/usr/bin/env bash
#
# Generate thumbnails with suffix '-small.jpg' for sketchnote images, only if missing or outdated.
#

thumbnailSuffix='-small.jpg'
imageDir="Resources/images/sketchnotes"

GLOBIGNORE="*$thumbnailSuffix"
for image in "$imageDir"/*.jpg; do
    thumbnail="${image%.jpg}$thumbnailSuffix"

    # Skip if thumbnail exists and is newer than source
    if [[ -f "$thumbnail" && "$thumbnail" -nt "$image" ]]; then
        continue
    fi

    echo "converting $image"
    convert "$image" \
        -resize 500 \
        -quality 70 \
        "$thumbnail"
done
