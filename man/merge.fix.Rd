\name{fix.merge}
\alias{fix.merge}

\title{
Merge .fix files
}
\description{
\code{fix.merge} merges several .fix files into a specified file in a form suitable for \emph{PDFgetN}. 
}
\usage{
fix.merge(outfile, infile1, infile2, ...)
}
\arguments{
  \item{outfile}{character, the filename for saving the data.}
  \item{infile1, infile2, ...}{files to merge.}
}

\seealso{
\code{\link{write.fix}}, \code{\link{read.sqa}}, \code{\link{do.fit.banks}}, \code{\link{BBEST-package}}
}

\keyword{PDFgetN}
\keyword{banks}
\keyword{save data}