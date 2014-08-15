\name{set.data}
\alias{set.data}

\title{Set data}

\description{The function sets key parameters necessary for the fit, such as \code{sigma}, \code{lambda} and \code{SB}}

\usage{
set.data(x, y, sigma=NA, lambda=NA, SB=NA)
}

\arguments{
  \item{x}{numeric vector, specifies grid points.}
  \item{y}{numeric vector, specifies function values.}
  \item{sigma}{numeric vector, if not \code{NA}, specifies estimated noise.}
  \item{lambda}{numeric vector, if not \code{NA}, specifies estimated mean signal magnitude.}
  \item{SB}{numeric vector, if not \code{NA}, specifies estimated coherent baseline.}
}
\details{
One way (not the simplest) to prepare experimental data for the fit. This function returns a list of the above parameters -- an object of type \code{data}. Objects of that type are used as arguments for some functions implemented in the package. In most cases only the elements \code{x} and \code{y} are required in the object \code{data}. However, all 5 elements (and one optional, see \code{\link{set.Gr}}) must be specified to execute the fit, i.e. prior to the \code{\link{do.fit}} call.

The object of that type can also be created via \code{\link{read.data}}, \code{\link{read.sqa}} and \code{\link{read.sqb}}. Parameters "sigma", "lamdba" and "SB" can be determined automatically, see \code{set data} keyword.

The general recipe for setting an object \code{data} is the following. If vectors \code{x} and \code{y} are stored in the text file, use  \code{\link{read.data}}. If they are stored in a \code{.sqb}-file, call \code{\link{read.sqb}}. If they are stored in the memory, use \code{\link{set.data}}. Then use functions \code{\link{set.sigma}}, \code{\link{set.lambda}}, and \code{\link{set.SB}}) to specify the remaining parameters.
}
\value{
A list with elements
  \item{x}{numeric vector, specifies gridpoints.}
  \item{y}{numeric vector, specifies function values.}
  \item{sigma}{numeric vector, specifies estimated noise.}
  \item{lambda}{numeric vector, specifies estimated mean signal magnitude.}
  \item{SB}{numeric vector, specifies estimated coherent baseline.}
}

\keyword{set data}