\name{prepare.banks.data}
\alias{prepare.banks.data}
\title{
Prepare data for estimating the background 
}
\description{
\code{prepare.banks.data} sets all the fit parameters, such as \code{sigma}, \code{lambda} and \code{SB} for a set of detector banks.
}
\usage{
prepare.banks.data(data, n.banks=4, lambda_1, lambda_2, lambda_0, 
                   x_1, x_2, n.atoms, scatter.length, ADP, n.regions)
}
\arguments{
  \item{data}{list of objects of type \code{data}. See \code{\link{read.sqa}} and \code{\link{set.data}} for details.}
  \item{n.banks}{numeric, number of banks.}
  \item{lambda_1, lambda_2, lambda_0, x_1, x_2}{parameters to be passed to \code{\link{set.lambda}}.}
  \item{n.atoms, scatter.length, ADP}{parameters to be passed to \code{\link{set.SB}}.}
  \item{n.regions}{parameter to be passed to \code{\link{set.sigma}}.}
}
\details{
This function simplifies setting the fit parameters for a set of detector banks by a multiple call of \code{\link{set.sigma}}, \code{\link{set.SB}}, and \code{\link{set.lambda}}.
}

\value{
A list of objects of type \code{data} suitable for \code{\link{do.fit.banks}}.
}

\seealso{
\code{\link{set.sigma}}, \code{\link{set.SB}}, \code{\link{set.lambda}} 
}

\keyword{set data}
