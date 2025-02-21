% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plots.R
\name{plot.MultiCellPower}
\alias{plot.MultiCellPower}
\title{Plotting function for MultiCellPower}
\usage{
\method{plot}{MultiCellPower}(
  x,
  actual_values = TRUE,
  smoothed_values = FALSE,
  show_mde = TRUE,
  breaks_x_axis = 10,
  stacked = TRUE,
  ...
)
}
\arguments{
\item{x}{A MultiCellMarketSelection object.}

\item{actual_values}{Logic flag indicating whether to include in the plot
the actual values. TRUE by default.}

\item{smoothed_values}{Logic flag indicating whether to include in the plot
the smoothed values. TRUE by default.}

\item{show_mde}{Logic flag indicating whether to include in the plot
the positive and negative MDEs. FALSE by default.}

\item{breaks_x_axis}{Numeric value indicating the number of breaks in the
x-axis of the power plot. You may get slightly more or fewer breaks that
requested based on \code{breaks_pretty()}. Set to 10 by default.}

\item{stacked}{Logic flag indicating whether to stack all the Multi-Cell plots
together vertically or to output each one of them separately. Set to TRUE by
default.}

\item{...}{additional arguments}
}
\value{
MultiCellPower plot.
}
\description{
Plotting function for \code{MultiCellPower}. This function plots the
Power Curves for all given test markets
latest possible test given the data and duration as well as the power curve
across historical simulations for a given merket_id and cell_id.
}
