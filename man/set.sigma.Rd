\name{set.sigma}
\alias{set.sigma}

\title{
Set the experimental uncertainty 
}
\description{
This function either sets the pointwise experimental uncertainty or estimates it using \code{wmtsa} library.
}
\usage{
set.sigma(data, sigma=NA, x.bkg.only=NA, n.regions=10, thresh.scale=1)
}

\arguments{
  \item{data}{an object of type \code{data}. See \code{\link{set.data}} for details.}
  \item{sigma}{numeric vector which, if not \code{NA}, determines the pointwise experimental uncertainty.}
  \item{x.bkg.only}{if parameter \code{sigma} is \code{NA}, determines the peak-free region used to estimate the noise.}
  \item{n.regions}{if both parameters \code{sigma} and \code{x.bkg.only} are \code{NA}, the grid is split into \code{n.regions} equal regions. The noise is then estimated for each of these regions. See details}
  \item{thresh.scale}{numeric vector or scalar which is used to amplify or attenuate the threshold values for a wavelet shrinkage. }
}
\value{
An object of type \code{data}. Elements 
  \item{sigma}{numeric vector containing the estimated noise level.}
  \item{smoothed}{if both parameters \code{sigma} and \code{x.bkg.only} are \code{NA} contains a smoothed estimate of the regression function.}
are replaced with their new values.
}
\details{
We assume the experimental uncertainty to have  a Gaussian distribution with x-dependent amplitude. Splitting the grid into \code{n.regions} segments and estimating Gaussian standard deviations over each of these segments allows us to approximate the true distribution.

The function uses \code{wavShrink} package that performs a decimated discrete wavelet transform for signal smoothing. The use of \code{thresh.scale} argument signifies a departure from a model driven estimate of the thresholds and can be used to tweak the levels to obtain a smoother or rougher result. 
}
\references{
Percival, D. B. and Walden, A. T. (2000): Wavelet Methods for Time Series Analysis, \emph{Cambridge University Press}. 

Percival, D. B. (2013): wmtsa: Wavelet Methods for Time Series Analysis Version 2.0-0. \url{http://CRAN.R-project.org/package=wmtsa}.
}

\examples{
# Setting x and y
x <- seq(.7, 30, 0.01)
y <- sin(x) 
# Adding x-dependent noise
y <- y + rnorm(sd=0.05+x/240, n=length(x))

# estimating noise
dat <- list(x=x, y=y)
dat <- set.sigma(dat, n.regions=1)
# use
# dat <- set.sigma(dat, n.regions=5)
# to see the difference


# Plotting results: noisy function and a
# smoothed estimate +/- 2 standard deviations
plot(x, y, t="l")
lines(dat$x, dat$smoothed, col=3, lwd=2)
lines(dat$x, dat$smoothed+2*dat$sigma, col=2)
lines(dat$x, dat$smoothed-2*dat$sigma, col=2)
abline(v=seq(min(x), max(x),length=5), col=4)

}
\keyword{set data}
