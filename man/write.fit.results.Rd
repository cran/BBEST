\name{write.fit.results}
\alias{write.fit.results}

\title{Save results of the fit
}
\description{\code{write.fit.results} writes the returned value of \code{\link{do.fit}} to a specified text file.
}
\usage{
write.fit.results(fit.results, file = stop("'file' must be specified"))
}
\arguments{
  \item{fit.results}{list, the return value of \code{\link{do.fit}}.}
  \item{file}{character, the filename for saving the data.}
}
\seealso{
\code{\link{do.fit}}, \code{\link{BBEST-package}}
}
\keyword{save data}