% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{cover}
\alias{cover}
\title{Plant cover data}
\format{A data.frame with 5 variables: \code{species}, \code{year},
\code{watershed}, \code{area}, and \code{proportion}}
\usage{
cover
}
\description{
The proportion of area covered by each plant species in the prairie and
crop areas.
}
\examples{
library(dplyr)
with_life_history_trait <- cover \%>\%
  left_join(life_history_trait, by="species")
}
\seealso{
\code{\link{life_history_trait}}
}
\keyword{datasets}

