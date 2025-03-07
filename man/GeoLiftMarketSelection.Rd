% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pre_test_power.R
\name{GeoLiftMarketSelection}
\alias{GeoLiftMarketSelection}
\title{GeoLift Market Selection algorithm based on a Power Analysis.}
\usage{
GeoLiftMarketSelection(
  data,
  treatment_periods,
  N = c(),
  X = c(),
  Y_id = "Y",
  location_id = "location",
  time_id = "time",
  effect_size = seq(-0.2, 0.2, 0.05),
  lookback_window = 1,
  include_markets = c(),
  exclude_markets = c(),
  holdout = c(),
  cpic = 1,
  budget = NULL,
  alpha = 0.1,
  normalize = FALSE,
  model = "none",
  fixed_effects = TRUE,
  dtw = 0,
  Correlations = FALSE,
  ProgressBar = FALSE,
  print = TRUE,
  run_stochastic_process = FALSE,
  parallel = TRUE,
  parallel_setup = "sequential",
  side_of_test = "two_sided",
  import_augsynth_from = "library(augsynth)",
  import_tidyr_from = "library(tidyr)"
)
}
\arguments{
\item{data}{A data.frame containing the historical conversions by
geographic unit. It requires a "locations" column with the geo name,
a "Y" column with the outcome data (units), a time column with the indicator
of the time period (starting at 1), and covariates.}

\item{treatment_periods}{List of treatment periods to calculate power for.}

\item{N}{List of number of test markets to calculate power for. If left empty (default)
and if no locations are included through \code{include_locations}, it will populate
the list of markets with the deciles of the total number of locations. If left empty
and a set of markets is provided by \code{include_locations} only the deciles larger
or equal than \code{length(include_locations)} will be used.}

\item{X}{List of names of covariates.}

\item{Y_id}{Name of the outcome variable (String).}

\item{location_id}{Name of the location variable (String).}

\item{time_id}{Name of the time variable (String).}

\item{effect_size}{A vector of effect sizes to test by default a
sequence between 0 - 25 percent in 5 percent increments: seq(0,0.25,0.05).
Make sure that the sequence includes zero.}

\item{lookback_window}{A number indicating how far back in time the simulations
for the power analysis should go. For instance, a value equal to 5 will simulate
power for the last five possible tests. By default lookback_window = 1 which
will only execute the most recent test based on the data.}

\item{include_markets}{A list of markets or locations that should be part of the
test group. Make sure to specify an N as large or larger than the number of
provided markets or locations. Empty list by default.}

\item{exclude_markets}{A list of markets or locations that won't be considered
for the test market selection, but will remain in the pool of controls. Empty
list by default.}

\item{holdout}{A vector with two values: the first one the smallest desirable
holdout and the second the largest desirable holdout. If left empty (default)
all market selections will be provided regardless of their size.}

\item{cpic}{Number indicating the Cost Per Incremental Conversion.}

\item{budget}{Number indicating the maximum budget available for a GeoLift test.}

\item{alpha}{Significance Level. By default 0.1.}

\item{normalize}{A logic flag indicating whether to scale the outcome which is
useful to accelerate computing speed when the magnitude of the data is large. The
default is FALSE.}

\item{model}{A string indicating the outcome model used to augment the Augmented
Synthetic Control Method. Augmentation through a prognostic function can improve
fit and reduce L2 imbalance metrics.
\itemize{
\item{"None":}{ ASCM is not augmented by a prognostic function. Defualt.}
\item{"Ridge":}{ Augments with a Ridge regression. Recommended to improve fit
for smaller panels (less than 40 locations and 100 time-stamps.))}
\item{"GSYN":}{ Augments with a Generalized Synthetic Control Method. Recommended
to improve fit for larger panels (more than 40 locations and 100
time-stamps. }
}}

\item{fixed_effects}{A logic flag indicating whether to include unit fixed
effects in the model. Set to TRUE by default.}

\item{dtw}{Emphasis on Dynamic Time Warping (DTW), dtw = 1 focuses exclusively
on this metric while dtw = 0 (default) relies on correlations only.}

\item{Correlations}{A logic flag indicating whether an additional column with
the correlations between the test regions and total control markets will be
included in the final output. Set to FALSE by default.}

\item{ProgressBar}{A logic flag indicating whether to display a progress bar
to track progress. Set to FALSE by default.}

\item{print}{A logic flag indicating whether to print the top results. Set to
TRUE by default.}

\item{run_stochastic_process}{A logic flag indicating whether to select test
markets through random sampling of the the similarity matrix. Given that
interpolation biases may be relevant if the synthetic control matches
the characteristics of the test unit by averaging away large discrepancies
between the characteristics of the test and the units in the synthetic controls,
it is recommended to only use random sampling after making sure all units are
similar. This parameter is set by default to FALSE.}

\item{parallel}{A logic flag indicating whether to use parallel computing to
speed up calculations. Set to TRUE by default.}

\item{parallel_setup}{A string indicating parallel workers set-up.
Set to "sequential" by default.}

\item{side_of_test}{A string indicating whether confidence will be determined
using a one sided or a two sided test.
\itemize{
\item{"two_sided":}{ The test statistic is the sum of all treatment effects, i.e. sum(abs(x)). Defualt.}
\item{"one_sided":}{ One-sided test against positive or negaative effects i.e.
If the effect being applied is negative, then defaults to -sum(x). H0: ES >= 0; HA: ES < 0.
If the effect being applied is positive, then defaults to sum(x). H0: ES <= 0; HA: ES > 0.}
}}

\item{import_augsynth_from}{Points to where the augsynth package
should be imported from to send to the nodes.}

\item{import_tidyr_from}{Points to where the tidyr package
should be imported from to send to the nodes.}
}
\value{
A list with three Data Frames. \itemize{
\item{"BestMarkets":}{Data Frame with a ranking of the best markets
based on power, Scaled L2 Imbalance, Minimum Detectable Effect, and
proportion of total KPI in the test markets.}
\item{"PowerCurves":}{Data Frame with the resulting power curves for
each recommended market.}
\item{"parameters;"}{List of parameters to plot the results.
Includes the data set, model, fixed-effects, and CPIC parameters.}
}
}
\description{
\code{GeoLiftMarketSelection} provides a ranking of test markets  for a
GeoLift test based on a power analysis.
}
