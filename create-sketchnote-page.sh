#!/usr/bin/env bash

# create new markdown pages for new sketchnotes

thumbnailSuffix='-small.jpg'

GLOBIGNORE="*$thumbnailSuffix"
for image in Resources/images/sketchnotes/*; do
	imageName="${image/Resources\/images\/sketchnotes\/}"
	fileName="${imageName%.jpg}.md"
	path=Content/sketchnotes/"${fileName}"

	# create new file
	echo "create markdown if needed: $fileName"
	touch $path

	# check if file is empty
	if [[ -z "$(find $path -type f -empty)" ]]
	then
		echo "$fileName is not new, do not change anything"
	else
		# fill with template content
		echo "---" >> $path
		echo "date: YYYY-MM-DD HH:MM" >> $path
		echo "description:" >> $path
		echo "tags:" >> $path
		echo "image: images/sketchnotes/${imageName%.jpg}$thumbnailSuffix" >> $path
		echo "sketchnoteMetadata.contentCreator:" >> $path
		echo "sketchnoteMetadata.linkToContentCreator:" >> $path
		echo "title:" >> $path
		echo "---" >> $path
		echo "" >> $path
		echo "## Detailed image description of the sketchnote" >> $path
	fi
done
