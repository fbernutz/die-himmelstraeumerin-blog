run:
	publish run

thumbs:
	./create-thumbnails.sh

clean-thumbs:
	rm -f Resources/images/sketchnotes/*-small.jpg

convert-png:
	cd Resources/images/sketchnotes &&
		magick mogrify -format jpg *.png &&
		rm -f *.png
