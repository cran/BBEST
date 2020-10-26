\name{do.fit}
\alias{do.fit}
\title{Estimate background}

\description{\code{do.fit} estimates the background using the Bayesian approach and Differential Evolution algorithm.}


\usage{
do.fit(data, bounds.lower, bounds.upper, scale=c(1,1), knots.x=NA,
       knots.n=NA, analytical=FALSE, stdev=TRUE, control=list(), p.bkg=.5,
	   save.to="")
}
\arguments{
  \item{data}{an object of type \code{data}. See \code{\link{set.data}} for details.}
  \item{bounds.lower, bounds.upper}{numerics specifying the lower and upper bounds for the fitted spline values.}
  \item{scale}{numeric vector which, if applicable, determines the bounds for the fitted scale parameter. The default value of \code{c(1,1)} means a no-scale fit. See details.}
  \item{knots.x}{numeric vector which, if not \code{NA}, specifies the knot positions.}
  \item{knots.n}{numeric, the number of knots. If \code{knots.x} is \code{NA} then \code{knots.n} equidistant knots will be created.}
  \item{analytical}{logical. If \code{TRUE} background is approximated by an analytical function \eqn{f(x)=P_1\exp(-P_2x)x^{P_3} + P_4/[(x-P_5)^2+P_6^2]}.}
  \item{stdev}{logical, whether to calculate the uncertainty for the estimated background. Should be set to \code{FALSE} if \code{analytical=TRUE}.}
  \item{control}{list, the return value of \code{\link{set.control}}. Specifies various parameters of the Differential Evolution optimization algorithm implemented in \code{DEoptim}.}
  \item{p.bkg}{numeric, the probability that a single pixel contains "only" a background.}
  \item{save.to}{character, a filename for saving the results.}
}
\details{
If information on the low-r behavior of G(r) is provided, the global intensity scale  and atomic displacement parameters can be fitted along with the positions of the knots,  (\code{\link{set.Gr}}). To fit normalization parameter set bounds in \code{scale} for the desired values. To fit Atomic Displacement Parameters see \code{\link{set.SB}}.

In most cases \code{p.bkg} should be set to its default value 0.5.

For further details see \code{\link{BBEST-package}}.
}

\value{
A list with elements:
\item{x}{numeric vector of grid points}
\item{curves}{list, see below.}
\item{uncrt}{list, see below.}
\item{knots}{list with elements \code{x} and \code{y} that specify the positions of the knots and the corresponding fitted intensity values, respectively.}
\item{pars}{numeric vector. If the background is approximated using the analytical function, contains all the relevant parameters \code{P}.}
\item{scale}{fitted value of the \code{scale} parameter, if used.}
\item{ADP}{fitted values of the atomic displacement parameters, if applicable.}
\item{fit.details}{list, see below.}


Element \code{curves} is a list with sub-elements:
\item{y}{numeric vector of the (normalized) function values.}
\item{bkg}{numeric vector, the estimated background.}
\item{SB}{numeric vector, the (fitted) coherent baseline.}


Element \code{uncrt} is a list with sub-elements:
\item{stdev}{numeric vector, indicates estimated standard deviations for the reconstructed signal.}
\item{stdev.r}{numeric vector, indicates estimated standard deviations for a reconstructed signal in r-space.}
\item{hess}{Hessian matrix for a \eqn{\psi(c)} function.}
\item{cov.matrix}{covariance matrix, i.e. the inverse of the Hessian.}
\item{cov.matrix.r}{covariance matrix in r-space.}


Element \code{fit.details} is a list with sub-elements:
\item{lambda}{numeric vector, the estimated mean magnitude of the signal.}
\item{sigma}{numeric vector, the estimated Gaussian noise.}
\item{knots.n}{the number of knots used in the fit.}
\item{knots.x}{knot positions used in the fit.}
\item{control}{see the \code{control} argument.}
\item{Gr}{list contacting information on the low-r behaviour of G(r) . See \code{\link{set.Gr}} for details.}
\item{n.atoms}{numeric vector, number of different atoms per unit cell.}
\item{scatter.length}{numeric vector, atomic scattering factors.}


}
\references{
Ardia, D., Mullen, K., Peterson, B. & Ulrich, J. (2011): DEoptim. R Package Version 2.2-2. \url{https://CRAN.R-project.org/package=DEoptim}.

Mullen, K.M., Ardia, D., Gil, D., Windover, D., Cline, J. (2011): DEoptim: An R Package for Global Optimization by Differential Evolution. \emph{J. Stat. Softw.}, \bold{40}(6), 1-26. \url{https://www.jstatsoft.org/article/view/v040i06}.
}

\keyword{fit}
