
<!-- README.md is generated from README.Rmd. Please edit that file -->
areal
=====

While methods to interpolate multiple spatial data sets are currently available in the ArcGIS Suite and the `R` package `sf`, `areal` offers an intuitive assortment of options to validate, interpolate, and compare fields between a source and target data set.

Installation
------------

The best way to install the released version of areal is from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("areal")
```

The development version of `areal` can be accessed from Github with `devtools`:

``` r
# install.packages("devtools")
devtools::install_github("charlie-revord/areal")
```

Usage
-----

`areal` is split into several different utilities that include: validation of source and target data (specifically tests for sf object status, shared area unit type, and shared coordinate system), unit type conversion, intersection of source and target data, source field weight calculation, and target field calculation based off source field weight.

General Use
-----------

The following showcases the capabilities of `areal` given that the source and target data are loaded in by the user alongside the package dependencies. The data is hypothetical and named "source" and "target" respectively.

``` r
# load the areal package
library(areal)

# generate result of SF comparison test
sf_result <- aw_validate_sf(source, target)

# generate result of unit comparision test
units_result <- aw_validate_units(source, target)

# generate result of coordinate test
crs_result <- aw_validate_crs(source,target)

# generate complete result of validation checks
validate_result <- aw_validate_data(source,target)

# intersect source and target shapefiles and generate
# geometric area
intersection <- aw_intersect(source, target)

# aggregate geometric area by source ID
intersection <- aw_total_id_area(intersection)

# create source area weight field
intersection <- aw_area_wght(intersection)

# create new interest variable based on area weight
intersection <- aw_popnew(intersection)

# aggregate new interest variable to target ID
final_target <- aw_aggregate(intersection)
```

Use Collective Function
-----------------------

All of the main functions' tasks can be performed in the encompassing function `aw_interpolate()`. Its use can be seen as follows:

``` r
aw_interpolate(source, target, intersection)
```

Additional Documentation
------------------------

See the package websites and vignettes. The help files can be viewed within R:

``` r
?aw_interpolate
```

About the Authors
-----------------

Charlie Revord was the chef man of this package.

Christopher Prener, Ph.D. contributed to the development of this package. He is a jedi master.
