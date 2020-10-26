\name{set.Gr}
\alias{set.Gr}

\title{Add information on the low-r behaviour of G(r)}

\description{Function to incorporate information on the low-r  behaviour of G(r) into the Bayesian model.}

\usage{
set.Gr(data, r1=seq(0, 1, 0.005), r2=NA, rho.0,
       type1="gaussianNoise", type2=NA, sigma.f=NA, l=NA)
}
\arguments{
  \item{data}{an object of type \code{data}. See \code{\link{set.data}} for details.}
  \item{r1,r2}{numeric vectors, specify grids on which the G(r) behaviour is controlled.}
  \item{rho.0}{numeric, atomic number density of the material: a number of atoms per unit cell divided by a volume of the unit cell.}
  \item{type1, type2}{characters, specify the way to control the behavior of G(r). See details.}
  \item{sigma.f, l}{numerics or numeric vectors, specify parameters for a squared-exponential covariance function.}
}
\details{
\code{type1} can be either "gaussianNoise" or "correlatedNoise". G(r) is restricted to the \eqn{-4\pi\rho.0r1} line plus independent Gaussian noise or correlated Gaussian noise, respectively.

\code{type2} can be either "secondDeriv" or "gaussianProcess" to impose smoothness conditions over the interval \code{r2}. If \code{type2} is "secondDeriv", a minimum of the second derivative is sought. If \code{type2} is "gaussianProcess", the smoothness is controlled via the Gaussian process using parameters  sigma.f and l.

According to our experience, the most efficient way is to impose \code{type1="gaussianNoise"} and \code{type2=NA} conditions.
}
\value{
An object of type \code{data}.
}

\keyword{set data}
