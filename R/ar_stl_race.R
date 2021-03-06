#' Race in St. Louis by Census Tract, 2017
#'
#' @description A simple features data set containing the geometry and associated attributes
#'     for the 2013-2017 American Community Survey estimates for race in St. Louis.
#'
#' @docType data
#'
#' @usage data(ar_stl_race)
#'
#' @format A data frame with 106 rows and 24 variables:
#' \describe{
#'   \item{GEOID}{full GEOID string}
#'   \item{STATEFP}{state FIPS code}
#'   \item{COUNTYFP}{county FIPS code}
#'   \item{TRACTCE}{tract FIPS code}
#'   \item{NAMELSAD}{tract name}
#'   \item{ALAND}{area of tract land, square meters}
#'   \item{AWATER}{area of tract water, square meters}
#'   \item{TOTAL_E}{total populaton count, estimated}
#'   \item{TOTAL_M}{total populaton count, margin of error}
#'   \item{WHITE_E}{white populaton count, estimated}
#'   \item{WHITE_M}{white populaton count, margin of error}
#'   \item{BLACK_E}{black populaton count, estimated}
#'   \item{BLACK_M}{black populaton count, margin of error}
#'   \item{AIAN_E}{american indian and alskan native populaton count, estimated}
#'   \item{AIAN_M}{american indian and alskan native populaton count, margin of error}
#'   \item{ASIAN_E}{asian populaton count, estimated}
#'   \item{ASIAN_M}{asian populaton count, margin of error}
#'   \item{NHPI_E}{native hawaiian and pacific islander populaton count, estimated}
#'   \item{NHPI_M}{native hawaiian and pacific islander populaton count, margin of error}
#'   \item{OTHER_E}{other race populaton count, estimated}
#'   \item{OTHER_M}{other race populaton count, margin of error}
#'   \item{TWOPLUS_E}{two or more races populaton count, estimated}
#'   \item{TWOPLUS_M}{two or more races populaton count, margin of error}
#'   \item{geometry}{simple features geometry}
#'   }
#'
#' @source \code{tidycensus} package
#'
#' @examples
#' str(ar_stl_race)
#' head(ar_stl_race)
#' summary(ar_stl_race$ALAND)
#'
"ar_stl_race"
