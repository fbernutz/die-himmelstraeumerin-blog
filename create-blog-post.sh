#!/usr/bin/env bash

# create new markdown page for blog post

DATE=$(date +%Y-%m-%d)
TIME=$(date +%Y-%m-%d" "%H:%M)

# ask for file name
echo $DATE
read -p "What should be the title for the new blog post? (lower case, seperated with dashes): " title
fileName="${DATE}-${title}"
path=Content/posts/"${fileName}.md"

# create file
touch $path

# fill with template content
echo "---" >> $path
echo "date: ${TIME}" >> $path
echo "description:" >> $path
echo "tags:" >> $path
echo "image: images/sketchnotes/${fileName}/preview.jpg" >> $path
echo "---" >> $path
echo "" >> $path
echo "# ${title} Title" >> $path

echo "✅ Successfully created new file for blog post!"
