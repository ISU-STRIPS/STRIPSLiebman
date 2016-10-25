#' Plant cover data
#'
#' The proportion of area covered by each plant species in the prairie and
#' crop areas.
#'
#' @format A data.frame with 5 variables: \code{species}, \code{year},
#' \code{watershed}, \code{area}, and \code{proportion}
#'
#' @seealso \code{\link{life_history_trait}}
#'
#' @examples
#' library(dplyr)
#' with_life_history_trait <- cover %>%
#'   left_join(life_history_trait, by="species")
"cover"

#' Life history trait
#'
#' Life history trait coded as eXotic/Native, Annual/Perennial, and D/M
#'
#' @format A data.frame with two variables: \code{species} and
#' \code{life_history_trait}
#'
#' @seealso \code{\link{cover}}
#'
#' @examples
#' library(dplyr)
#' with_cover <- cover %>%
#'   left_join(life_history_trait, by="species")
"life_history_trait"
