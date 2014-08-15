\name{write.fix}
\alias{write.fix}

\title{
Save a correction file for individual detector banks
}
\description{
\code{write.fix} writes corrections obtained using \code{\link{do.fit.banks}} to a specified file in a form suitable for \emph{PDFgetN}. 
}
\usage{
write.fix(fit.results, file = stop("'file' must be specified"))
}
\arguments{
  \item{fit.results}{list, the return value of \code{\link{do.fit.banks}}.}
  \item{file}{character, the filename for saving the data.}
}

\seealso{
\code{\link{read.sqa}}, \code{\link{do.fit.banks}}, \code{\link{BBEST-package}}
}

\keyword{PDFgetN}
\keyword{banks}
\keyword{save data}