\name{test.signal}
\alias{test.signal}
\title{A random function with a smooth background}
\description{
\code{test.signal} creates a random function that consists of peaks, a smooth background, and a Gaussian noise. 
}
\usage{
test.signal(x, lambda, sigma, x.delta, knots.n, peaks.widthRange, peaks.n)
}
\arguments{
  \item{x}{numeric vector, the x-points where data should be generated.}
  \item{lambda}{numeric, the mean signal magnitude.}
  \item{sigma}{numeric, the noise level.}
  \item{x.delta}{numeric, the minimum spacing allowed between spline knots. Defines background smoothness.}
  \item{knots.n}{numeric, a number of spline knots to generate.}
  \item{peaks.widthRange}{numeric vector, specifies range in peak widths.}
  \item{peaks.n}{numeric, the number of peaks to generate.}
}

\details{
The background is calculated as a sum of fundamental splines on the randomly generated knots. The function is a sum of the background, random peaks, and Gaussian noise.
}
\value{
An object of type \code{data} (see \code{\link{set.data}}) with the following elements added: 
  \item{knots}{list with elements \code{x} and \code{y} that specify the knot positions and knot values, respectively.}
  \item{bkg}{numeric vector containing the generated background.}
}

\examples{
# 1. Create test function 
f <- test.signal(x=seq(0,30,0.01), lambda=5, 
         sigma=0.1, x.delta=1.0, knots.n=5, 
         peaks.widthRange=c(0.1, 0.3), peaks.n=7)
	
# 2. Plot results
plot(f$x, f$y, t="l", xlab="x", ylab="f")
lines(f$x, f$bkg, col=2)
lines(f$x, f$y - f$bkg, col="gray")
legend(20, .9*max(f$y), c("test function", "background", 
       "peaks+noise"), lty=1, col=c(1,2,"gray"))

}
