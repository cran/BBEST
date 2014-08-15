\name{set.SB}
\alias{set.SB}
\title{Set the coherent baseline}
\description{
\code{set.SB} sets the baseline, describing coherent neutron scattering caused by uncorrelated atomic motion or any other baseline that needs to be preserved in the recovered signal.
}
\usage{			 
set.SB(data, SB=NA, n.atoms=NA, scatter.length=NA, ADP=NA, 
       fit=FALSE, oneADP=TRUE, ADP.lim = c(0, 0.05))
}
\arguments{
  \item{data}{an object of type \code{data}. See \code{\link{set.data}} for details.}
  \item{SB}{numeric vector which, if not \code{NA}, determines the baseline. See \code{\link{BBEST-package}} for details.}
  \item{n.atoms, scatter.length, ADP}{numerics. Specify the number of atoms of each atomtype in the unit cell, atomic scattering factors and atomic displacement parameters (ADP), respectively.}
  \item{fit}{logical, whether to fit ADP.}
  \item{oneADP}{logical. If \code{TRUE} a single parameter is used for all the APDs.}
  \item{ADP.lim}{numeric vector that specifies the lower and upper bounds for the fitted ADP.}
}
\details{
Baseline \code{SB} has to be specified. If no baseline is needed fill \code{SB} with zeroes. If \code{n.atoms, scatter.length} and \code{ADP} parameters are specified, the baseline is calculated according to
\deqn{ SB(x) = 1 - \frac{ \sum_i{N_i f_i^2 e^{-ADP_i x^2}} }{ N<f^2> }(1 - \frac{<f>^2-<f^2>}{<f>^2}). }

If \code{ADP} parameters are to be fitted, indicate \code{n.atoms}, \code{scatter.length} and set parameter \code{fit} to \code{TRUE}. Set \code{oneADP} to the desired value. 
}
\value{
An object of type \code{data}. Element
  \item{SB}{numeric vector containing the baseline.}
is replaced with its new value. Element
  \item{fitADP}{a list of values.}
might be added to describe the fit details.
}

\keyword{set data}
