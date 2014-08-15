\name{mPlot.results}
\alias{mPlot.results}
\title{Plot the background estimate}
\description{
Plots the estimated background and the corrected function. 
}
\usage{
mPlot.results(fit.results, label.x = "x", label.y = "y",
              xlim=NA, ylim=NA)
}
\arguments{
  \item{fit.results}{the return value of \code{\link{do.fit}}.}
  \item{label.x, label.y}{characters, titles for x and y axes.}
  \item{xlim, ylim}{numeric vectors with two entries. If not \code{NA}, specify x- and y-axis limits. }
}
\details{
The function uses \code{ggplot2} and \code{gridExtra} packages for plotting. Packages can be installed by typing \code{install.packges("ggplot2")} and \code{install.packges("gridExtra")}.
}

\seealso{\code{\link{do.fit}}}
\keyword{fit}
\keyword{plot}
