# RO-Crate Photo Data for Image Gallery

The primary purpose of this repository is to explore RO-creates by using photography metat data as an example. Using the RO-Create data as a base an attempt will be made to develop a image gallery, ideal without the needs for a back-end for hosting on github.

Method overview:

* Extract EXIF data from images
* Create RO-Create template and populate
* Create image gallery site

More info on RO-Creates: [Introduction to RO-Crate 1.3](https://www.researchobject.org/ro-crate/specification/1.3/introduction.html)

## Enter EXIF

Additional EXIF data was entered using Adobe Lightroom Classic.

### Location

Location fields used:

* Country
* State
* City (where relevant)
* Sub-location (as Indigenous locality where available)
* GPS location (where available)

### Species

Species information was entered as keywords, both common name and scientific name.  The URL of the Australian Biological Resources Study - Australian Faunal Directory was added as a synonym for the scientific name of the species which will be exported and used in the RO-Crate schema.

The TNS from the [Integrated Taxonomic Information System](https://www.itis.gov/) was also added as an synonym as with the prefix 'TSN' where available.

e.g. Wedge Tailed Eagle keywords:

* Wedge-tailed eagle
* Aquila audax
* https://biodiversity.org.au/afd/taxa/a3f12b6b-68dd-4b76-8191-30726353903a (as synonym of Aquila audax)
* TNS175410 (as synonym of Aquila audax)

## Extract EXIF

## RO-Crate template

## Image gallery

Features of interest:

* Image gallery
* Map
* Keyword search

Frameworks to try:

* Quarto document
* Quarto dashboard


