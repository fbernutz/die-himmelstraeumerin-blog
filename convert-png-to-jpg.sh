#!/bin/bash

# converts all png sketchnotes to type jpg,
# delete the png file afterwards

cd Resources/images/sketchnotes &&
    magick mogrify -format jpg *.png &&
    rm *.png
