\name{do.fit.banks}
\alias{do.fit.banks}
\title{Estimate the background for individual banks}

\description{\code{do.fit} estimates the background for individual banks according to the Bayesian approach using the Differential Evolution algorithm }
\usage{
do.fit.banks(data, bounds.lower, bounds.upper, knots.n.left, 
             knots.n.right, x.boundary, analytical=FALSE, control, 
             save.to="")
}
\arguments{
  \item{data}{an object of type \code{data}. See \code{\link{set.data}} for details.}
  \item{bounds.lower, bounds.upper}{numerics, lower and upper bounds for the fitted spline values.}
  \item{knots.n.left, knots.n.right, x.boundary}{numerics that specify the number of knots. \code{knots.n.left} and \code{knots.n.right} knots are created on the left and on the right of \code{x.boundary} point, respectively.}
  \item{analytical}{logical. If \code{TRUE} background is approximated by an analytical function \eqn{f(x)=P_1\exp(-P_2x)x^{P_3} + P_4/[(x-P_5)^2+P_6^2]}.}
  \item{control}{list, the return value of \code{\link{set.control}}. Specifies various parameters of the Differential Evolution optimization algorithm implemented in \code{DEoptim}. }
  \item{save.to}{character, a filename for saving the results.}
}

\value{
A list of elements. Each element contains a return value of \code{\link{do.fit}} for the corresponding data bank.
}

\details{
This function simplifies the procedure for estimating the background for several detector banks by a multiple call of \code{\link{do.fit}}. Other relevant parameters are set to: \code{stdev=FALSE,  scale=NA,  p.bkg=.5}. 

For neutron scattering, the incoherent background exhibits a broad peak at low Q and decays gradually at higher Q. Hence, we suggest to use different numbers of knots for the low- and high-Q  regions. See \code{\link{BBEST-package}} for details. 
}


\seealso{
\code{\link{do.fit}}, \code{\link{BBEST-package}}
}

\keyword{fit}
