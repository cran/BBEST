\name{set.lambda}
\alias{set.lambda}

\title{Set mean signal magnitude}

\description{\code{set.lambda} sets the mean height of the peaks over region x.}

\usage{
set.lambda(data, lambda=NA, lambda_1=NA, lambda_2=NA, 
           lambda_0=NA, x_1=NA, x_2=NA)
}

\arguments{
  \item{data}{an object of type \code{data}. See \code{\link{set.data}} for details.}
  \item{lambda}{numeric vector. If not \code{NA}, specifies (approximate) the mean magnitude of the signal. This estimate does not need to be accurate. \code{lambda} can be estimated as a smooth function that crosses centres of the signal peaks. }
  \item{lambda_1, lambda_2, lambda_0, x_1, x_2}{numerics. If \code{lambda} is \code{NA} help to estimate \code{lambda}. See details.}
}
\details{
\code{lambda} is calculated as a linear piecewise function which is equal to \code{lambda_0} outside the \code{[x_1,x_2]} region. Inside this region, \code{lambda} is approximated by a line connecting points \code{(x_1;lambda_1)} and \code{(x_2;lambda_2)}.
}
\value{
An object of type \code{data}. Element
  \item{lambda}{numeric vector containing an approximate mean magnitude of the signal.}
is replaced with its new value.
}


\keyword{set data}
