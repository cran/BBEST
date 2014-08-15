\name{mPlot.results.banks}
\alias{mPlot.results.banks}
\title{Plot the background estimate for individual banks}
\description{
Plots the background estimate for individual detector banks. 
}
\usage{
mPlot.results.banks(fit.results, label.x = "x", label.y = "y",
                    xlim=NA, ylim=NA)
}
\arguments{
  \item{fit.results}{the return value of \code{\link{do.fit.banks}}.}
  \item{label.x, label.y}{characters, titles for x and y axes.}
  \item{xlim, ylim}{numeric matrices of size \code{(NB, 2)}, where \code{NB} is the number of data banks. If not \code{NA}, specify x- and y-axis limits. }  
}
\seealso{\code{\link{do.fit.banks}}}
\keyword{fit}
\keyword{plot}
