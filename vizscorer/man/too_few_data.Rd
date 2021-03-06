% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/too_few_data.R
\name{too_few_data}
\alias{too_few_data}
\title{look for overshooting in case of a plot for with too few data}
\usage{
too_few_data(plot_object, data_threshold)
}
\arguments{
\item{plot_object}{the ggplot object being analysed}

\item{data_threshold}{a custom threshold to define too many data}
}
\value{
TRUE in case too few data points are observed, FALSE in the opposite site.
}
\description{
this function checks for the presence of too few data to deserve a plot. Based on data visualization literature it is assumed that twenty data points can be considered a significant threshold
}
