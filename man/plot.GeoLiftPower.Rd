% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plots.R
\name{plot.GeoLiftPower}
\alias{plot.GeoLiftPower}
\title{Plotting function for GeoLiftPower.}
\usage{
\method{plot}{GeoLiftPower}(
  x,
  actual_values = TRUE,
  smoothed_values = TRUE,
  show_mde = FALSE,
  breaks_x_axis = 10,
  notes = "",
  ...
)
}
\arguments{
\item{x}{GeoLiftPower object.}

\item{actual_values}{Logic flag indicating whether to include in the plot
the actual values. TRUE by default.}

\item{smoothed_values}{Logic flag indicating whether to include in the plot
the smoothed values. TRUE by default.}

\item{show_mde}{Logic flag indicating whether to include in the plot
the positive and negative MDEs. FALSE by default.}

\item{breaks_x_axis}{Numeric value indicating the number of breaks in the
x-axis of the power plot. You may get slightly more or fewer breaks that
requested based on \code{breaks_pretty()}. Set to 10 by default.}

\item{notes}{String with additional notes to add as caption.}

\item{...}{additional arguments}
}
\value{
GeoLiftPower plot.
}
\description{
Plotting function for \code{GeoLiftPower}. The function smooths the power curve
for ease of interpretation.
}
