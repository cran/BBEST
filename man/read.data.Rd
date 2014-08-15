\name{read.data}
\alias{read.data}

\title{
Read data from file
}
\description{
Reads data from a text file with columns "x", "y", and, optionally, "lambda", "sigma" and "SB". 
}
\usage{
read.data(file = stop("'file' must be specified"), ...)
}
\arguments{
  \item{file}{character, the name of the file which the data are to be read from.}
  \item{...}{further arguments to be passed to \code{read.table} (optional).}
}

\details{
This function implements one of the ways to load experimental data. The \code{file} must consist of a header with column names and several columns below. First two columns in \code{file} must be \code{x} and \code{y} values. The others could specify \code{lambda}, \code{sigma} and \code{SB}.
}

\value{
An object of type \code{data}. See \code{\link{set.data}} for details.
}





\keyword{read data}
