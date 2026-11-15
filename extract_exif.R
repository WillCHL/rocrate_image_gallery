# Script to extract exif data from photos for use in an RO-Create

library(exiftoolr)
library(dplyr)
library(data.table)

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

extract_from_vector <- function(x, str) {
    
    value <- grep(str, x, value = TRUE)
    
    return(value)
}

# Use select to develop the tag vector
img_exif_dat |> 
    select(
        c("Model", "Lens", "Keywords", "Copyright", "DigitalCreationDateTime", "Country", "State", Location, DateCreated, FileName, ISO, 
          FNumber, ExposureTime, ApertureValue, Aperture, ShutterSpeedValue, ShutterSpeed, FocalLength, `Sub-location`, `Province-State`,
          GPSLatitude, GPSLongitude, GPSPosition, GPSAltitude, GPSStatus, GPSMapDatum)
    ) |> 
    mutate(
        TSN = purrr::modify(Keywords, extract_from_vector, str = "TSN"),
        TSN = purrr::modify(TSN, function(x) {gsub("TSN", "", x)}),
        bio_link = purrr::modify(Keywords, extract_from_vector, str = "https://biodiversity")
    ) |> 
    
    # Write to csv for next stage
    fwrite("example_images.csv")
    
    








