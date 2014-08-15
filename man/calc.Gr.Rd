\name{calc.Gr}
\alias{calc.Gr}
\title{Calculate and plot the Pair Distribution Function}
\description{
Calculates and plots the corrected Pair Distribution Function. 
}
\usage{
calc.Gr(fit.results, rho.0, plot=TRUE, r.min = 0, r.max = 5, 
        dr = 0.01, Q.min = NA, Q.max = NA, nsd = 2, gr.compare=NA)
}  
    
\arguments{
  \item{fit.results}{the return value of \code{\link{do.fit}}.}
  \item{plot}{logical, whether to plot the PDF.}
  \item{rho.0}{numeric, the atomic number density of the material: the number of atoms per unit cell divided by a volume of the unit cell.}
  \item{r.min, r.max, dr}{numerics. Function is plotted in the region \code{[r.min, r.max]}.}
  \item{Q.min, Q.max}{numerics. To calculate the sine-Fourier transform, the total scattering function S(Q) is "terminated" at a certain \code{Q=Qmax} point. The best Qmax point to terminate S(Q) (that corresponds to the value of S(Q)-1 closest to zero) is sought in the \code{[Q.min,Q.max]} region.}
  \item{nsd}{numeric, the number of standard deviations to plot the uncertainty.}
  \item{gr.compare}{numeric vector. If not \code{NA}, specifies the function to add to the plot. Should correspond to the same grid (\code{[r.min, r.max, dr]}).}
}
\value{
A list with elements:
\item{r}{numeric vector of grid points}
\item{gr}{numeric vector, indicates the corrected Pair Distribution Function.}
\item{stdev}{numeric vector, indicates estimated standard deviation.}
}
\details{
The function uses \code{ggplot2} package for plotting. \code{ggplot2} package can be installed by typing \code{install.packges("ggplot2")}.
}

\seealso{
\code{\link{do.fit}}
}
\keyword{plot}
