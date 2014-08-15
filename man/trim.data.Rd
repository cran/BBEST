\name{trim.data}
\alias{trim.data}
\title{
Truncate data
}
\description{
The function truncates the data (deletes low- and high-x information).
}
\usage{
trim.data(data, x.min, x.max)
}
\arguments{
  \item{data}{an object of type \code{data}. See \code{\link{set.data}} for details.}
  \item{x.min, x.max}{numeric values determining the region to keep.}
}

\value{an object of type \code{data} with all functions cropped to the region \code{[x.min, x.max]}}


\details{Frequently, the experimental data need to be truncated to remove unwanted ranges.}



\examples{
# prepare data
x <- seq(0, 50, 0.01)
y <- .8*exp(-x)*x^4 
dat <- list(x=x, y=y)
# truncate
dat <- trim.data(dat, 1, 25)
# plot results
plot(x,y,t="l",lwd=4, col=4)
lines(dat$x, dat$y, lwd=4, col=2)
legend(15,3,c("initial", "truncated"), lty=1, col=c(4,2))
}

\keyword{set data}