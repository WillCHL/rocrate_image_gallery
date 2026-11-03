# Script to extract exif data from photos for use in an RO-Create

library(exiftoolr)
library(dplyr)

img_list <- list.files("./example_images", full.names = T)

img_exif_dat <- exif_read(img_list[1])

names(img_exif_dat)
print(img_exif_dat)

# Initial notes:
# Lots of fields, no keyword hierarchy
# Challenges:
# Extract species data from keywords

# img_exif_dat$State
# tag_vec <- c("Model", "Lens", "Keywords", "Copyright", "DigitalCreationDateTime", "Country", "State")
# Direction?  Not in 7D II data.
# Which values should be selected where duplicates exist
# Code based on export from Adobe Lightroom

# Read exif, use a tag vector for many images
img_exif_dat <- exif_read(img_list)

# Use select to develop the tag vector
img_exif_dat |> 
    select(
        c("Model", "Lens", "Keywords", "Copyright", "DigitalCreationDateTime", "Country", "State", Location, DateCreated, FileName, ISO, 
          FNumber, ExposureTime, ApertureValue, Aperture, ShutterSpeedValue, ShutterSpeed, FocalLength, `Sub-location`, `Province-State`,
          GPSLatitude, GPSLongitude, GPSPosition, GPSAltitude, GPSStatus, GPSMapDatum)
    )



# Write to csv for next stage





