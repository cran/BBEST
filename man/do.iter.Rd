\name{do.iter}
\alias{do.iter}
\title{Estimate the background}

\description{\code{do.iter} performs adaptive Bayesian  estimation of the background.}

\usage{
do.iter(fit.results, local = TRUE, eps = 1e-04, 
        n.iter = 10000, save.to = "")
}
\arguments{
  \item{fit.results}{list. The return value of \code{\link{do.fit}}.}
  \item{local}{logical. If \code{TRUE}, gradient descent method is used to find background estimation. If \code{FALSE}, Differential Evolution is used.}
  \item{eps}{numeric, the desired accuracy for spline values.}
  \item{n.iter}{numeric, number of iterations for a gradient descent method, see details.}
  \item{save.to}{character, the filename for saving the results.}
}
\details{
An adaptation of neutron scattering data for a Bayesian background separation procedure. The method is detailed elsewhere*.

First, use the function \code{\link{do.fit}} to estimate the background \emph{from} the low-r information in G(r). \code{do.iter} procedure estimates the background \emph{without} low-r information, calculates the difference between the two estimates, subtracts this difference from the scattering data and finds the new estimate of the background. 
}

\value{ 
An object \code{fit.results} with modified elements \code{fit.results$curves$bkg}, 	\code{fit.results$curves$y}	and \code{fit.results$curves$corr}. See \code{\link{do.fit}} for details.  
  
}
\references{
*Gagin, A. and Levin, I. Hydrogen background estimation in neutron total scattering experiments. Submitted for publication.
}



\keyword{fit}
