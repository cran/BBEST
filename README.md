# BBEST

This is the R package 'BBEST' (**B**ayesian **B**ackground **EST**imation) written and maintained by Anton Gagin (anton.gagin@nist.gov).

To cite the 'BBEST' package type 

```r
citation("BBEST")
```

## Installation

Prior to using 'BBEST', **R** software environment should be installed. The **R** environment is available for Windows, MacOS and a variety of UNIX platforms, and can be downloaded at [r-project.org](http://www.r-project.org/). Manuals for **R** listed at [cran.r-project.org/manuals](http://cran.r-project.org/manuals.html) provide a good introduction to this language.

You may also wish to install and IDE for **R**, for example, [RStudio](http://www.rstudio.com/). 

To install a stable version of 'BBEST' from [CRAN](http://cran.r-project.org/package=BBEST) type in the **R** command shell or in your IDE console 

```r
install.packages('BBEST', dependencies = TRUE)
```

Or download [tar ball](http://cran.r-project.org/src/contrib/BBEST_0.1-0.tar.gz), decompress the file, and run `R CMD INSTALL`. You will have to install packages: 'DEoptim', 'aws', 'grid', 'ggplot2', 'reshape2', and 'shiny'.

## Usage

To start working with 'BBEST', load it into memory by typing:

```r
library("BBEST")
```


'BBEST' has a simple graphical user interface (GUI) that could be launched using the command

```r
runUI()
```

This function starts the application in your default web browser. This GUI might not work on Internet Explorer 9 and below.

For a listing of all the routines in 'BBEST' type

```r
library(help="BBEST")
```

To start a simple command-line guide, type

```r
guide()
```

## Example

The package contains experimental data for `Li5La3Nb2O12` bulk ceramics (see [Gagin A. & Levin I. (2014). *J. Appl. Cryst.* **47**, 2060-2068.](http://journals.iucr.org/j/issues/2014/06/00/po5021/)). The corresponding [*PDFgetN*](http://pdfgetn.sourceforge.net/) output files can be found at

`"Path_to_your_R-library/extdata"`

To use these files with 'BBEST', delete the ".txt" extensions at the end of the filenames.