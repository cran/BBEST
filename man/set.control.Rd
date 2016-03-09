\name{set.control}
\alias{set.control}

\title{Set controls for the Differential Evolution Algorithm}
\description{
Specifies various parameters of the Differential Evolution optimization algorithm implemented in \code{DEoptim}. 
}
\usage{
set.control(CR=.85, F=.7, NP=300, itermax=2000, parallelType=1)
}
\arguments{
  \item{CR}{numeric, crossover probability from interval [0,1].}
  \item{F}{numeric, differential weighting factor from interval [0,2].}
  \item{NP}{numeric, number of population members}
  \item{itermax}{numeric, the number of iterations}
  \item{parallelType}{numeric, defines the type of parallelization to employ. \code{0} for a single-core run. If \code{parallelType=1} the program will use all the available cores, via the \code{parallel} package.}
}

\details{For the most tasks, it is best to set \code{NP} to at least 10-15 times the length of the parameter vector.}

\value{a list of elements suitable for \code{\link{do.fit}} and \code{\link{do.fit.banks}}.}

\references{
Mullen, K.M., Ardia, D., Gil, D., Windover, D., Cline, J. (2011): DEoptim: An R Package for Global Optimization by Differential Evolution. \emph{J. Stat. Softw.}, \bold{40}(6), 1-26. \url{https://www.jstatsoft.org/article/view/v040i06}.
}

\keyword{fit}