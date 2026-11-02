# Script to extract exif data from photos for use in an RO-Create

library(exiftoolr)

img_list <- file.list("./example_images")

exif_read(img_list[1])




