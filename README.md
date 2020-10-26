# BBEST

This is the R package 'BBEST' (**B**ayesian **B**ackground **EST**imation) written and maintained by Anton Gagin (av.gagin@gmail.com).

Please cite Gagin A. & Levin I. (2014). *A Bayesian approach to removal of incoherent scattering from neutron total-scattering data*. *J. Appl. Cryst.* **47**, 2060-2068 in publications that use this method.

To see the package citation information, type 

```r
citation("BBEST")
```

## Installation

Prior to using 'BBEST', **R** software environment should be installed. The **R** environment is available for Windows, MacOS and a variety of UNIX platforms, and can be downloaded at [r-project.org](https://www.r-project.org/). Manuals for **R** listed at [cran.r-project.org/manuals](https://cran.r-project.org/manuals.html) provide a good introduction to this language.

You may also wish to install and IDE for **R**, for example, [RStudio](https://rstudio.com/). 

To install a stable version of 'BBEST' from [CRAN](https://cran.r-project.org/package=BBEST) type in the **R** command shell or in your IDE console 

```r
install.packages('BBEST', dependencies = TRUE)
```

Or download [tar ball](https://cran.r-project.org/package=BBEST/index.html), decompress the file, and run `R CMD INSTALL`. You will have to install packages: 'DEoptim', 'aws', 'grid', 'ggplot2', 'reshape2', and 'shiny'.

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

Below is an example describing application of 'BBEST' to subtraction of an incoherent-scattering background from the neutron total scattering data collected on the powder sample of garnet Li5La3Nb2O12 using NPDF diffractometer at the Lujan Center for Neutron Scattering (see [Gagin A. & Levin I. (2014). *J. Appl. Cryst.* **47**, 2060-2068.](https://onlinelibrary.wiley.com/doi/abs/10.1107/S1600576714023796)). The data has been preprocessed using [*PDFgetN*](http://pdfgetn.sourceforge.net/) to generate S(Q) bank by bank (the .sqa file). We also include the blended S(Q) (the .sqb file) obtained after performing initial background subtraction in 'BBEST' using individual banks. The corresponding *PDFgetN* output files can be found at

`"Path_to_your_R-library/extdata"`

To use these files with 'BBEST', delete the ".txt" extensions at the end of the filenames.


### I. FITTING THE BACKGROUND FOR INDIVIDUAL BANKS

1. Start [RStudio](https://rstudio.com/)

2. Install the package by typing the following command in the Rstudio console:

```r
install.packages('BBEST', dependencies = TRUE)
```
  
3. Load the package into memory by typing 

```r
library(BBEST)
library(shiny)
```

4. Start the GUI by typing 

```r
runUI()
```

or, if the browser is working incorrectly, type 

```r
runUI <- function() runApp(system.file('gui', package='BBEST')) 
runUI()
```

5. Read the data by pressing the "*Choose file*" button and selecting the *npdf_07275.sqa file*. 

    The data from Bank 1 will be displayed in the plot window. Use the pulldown menu next to the plot window to select the bank to be displayed.

    The progress bar highlights letters "x" and "y" in green, which indicates that the data is ready for processing. Letters "G(r)" and "SB" are grey, indicating that these functions are optional.   Finally, "lambda", "epsilon", and "DifEv" are red, indicating that these parameters must be specified before the fit.

6. In the Main Menu on the left, select "*Set additional parameters*". This will open a panel "*Prepare Data*".

7. The "*truncate data*" option is currently available only for the blended data, not for individual banks.  Therefore, this feature is inactive when working with multiple banks.  

8. Set "*Useful signal level*".  At present, the same settings apply to all the banks.  

Here, x_1 and x_2 specify the Q-range for a useful signal (i.e., the signal is significantly greater than zero); lambda_1 can be set at one half the intensity of the strongest peak above the background (select the strongest peak in all the banks); lambda_2 is the approximate level of the signal at x_2; lambda_0 is a small positive number (usually, similar to the noise level).  In essence, function *lambda* specifies an upper estimate of the signal level.  

Use the plot to estimate the *lambda* parameters.  You can rescale the plot by selecting "*Plot Options*" from the main menu and use the slidebars to adjust the display range.  Remember to select the correct bank number in both "*Select Plot to Change*" and "*Plot window*" panels.  

A left mouse click in the plot window activates a crosshair and displays point coordinates. For the current data, the useful signal range can be set from x_1=1 to x_2=10.  The most intense peak is seen at 3.02 Å^-1^ in bank 4.  A half of its intensity (above the background) is approximately lambda_1=20. Lambda_2, the signal level at x=10, can be set at 0.2.  Lambda_0 (signal beyond x=10 Å^-1^) is set at some small number, say 0.05.  

In the "Useful signal level" window, type

```r
1.1, 10, 8, 0.2, 0.05
```

No need to press Enter; the lambda-function will be calculated and displayed automatically.  To see the entire range you may need to rescale the plot using   "*Plot options*" in the *Main Menu*. 

NOTE: The exact settings for lambda parameters are not critical; however, it's important that the signal level is not set too low. 

9. Set a baseline. 

The sample has a cubic garnet crystal structure with the nominal formula Li5La3Nb2O12.  The atoms occupy five Wyckoff positions with their multiplicities (times the occupancies determined using Rietveld refinements) specified in parenthesis:  La (24), Li (15.708), Li (24.288), O (96), and Nb (16). Rietveld refinements returned the   following isotropic (Uiso) values of atomic displacement parameters (ADP) for these five sites: La-0.01285 Å^2^, Li-0.01646 Å^2^, Li-0.0328 Å^2^, O-0.0136 Å^2^, Nb-0.0187 Å^2^. 

Therefore, the parameters for calculating the coherent-scattering baseline are set as following:

* In the field "*Type number of atoms of each type per unit cell*", type

```r
24.000, 15.708, 24.288, 96.000, 16.000 	
```

* In the filed "*Type neutron scattering lengths*", type

```r
8.240, -1.900, -1.900,  5.805,  7.054  
```

* In the field "*Type ADP(s)*", type 

```r
0.01285, 0.01646, 0.0328, 0.0136, 0.0187
```

'BBEST' will calculate and plot the corresponding baseline.

10. Estimate the noise level

These data feature a large number of intense Bragg peaks below Q=10 Å^-1^ and smooth behaviour for larger Q-values. Therefore, it's best to estimate the noise level by dividing the entire Q-range into a certain number of regions (i.e., 4)  
Therefore, in the field "*Type number of regions or bounds for a signal-free region*", type

```r
4
```

and in the field "*Type threshold scale (degree of smoothing)*"
```r
1,1,2,5
```

for  smoother estimate at high Q-value.

Once the calculation is finished, 'BBEST' will display the estimated noise level (+/- 2 std) using red lines. To check the quality of this estimate, select "*Plot Options*" and adjust the plot limits as necessary to obtain a magnified view of the noise levels.

11. Fit the background for all the banks.  

Select an option "*Optimize background with DifEv*" in the Main Menu.

You can leave "*Number of population members*", "*Number of iterations*", "*CR*", "*F*", and "*scale factor*" at their default values.

Specify the intensity range within which the background will be searched for in the "Lower and upper bounds for background" field.  It is better to    allow for a somewhat wider range.  The bounds can be estimated by eye.  For example, for the present data, you can select

```r
-3, 8
```

For individual banks, we recommend fitting the background using the 6-parameter analytical function, not splines.  

Press "*Start fit*".   A progress bar will appear at the top right. This fit can take from up to 25 minutes or so.

After the fit is complete, you can view the results by selecting the "*Fit Results Plot*" tab in the menu above the plot window. 
  
For downloading the results, select "*Fit results*" in the Main Menu. Download the *.fix* file for using it in *PDFgetN*.

For saving the fit itself, download the results as the .RData file.

12. To perform steps 5-11 for each bank individually, use command-line functions 

```r
sqa.split()
```

and

```r
fix.merge()
```

(see [reference manual](https://cran.r-project.org/package=BBEST/index.html).)


### II. FITTING the BACKGROUND FOR A BLENDED S(Q)

1. In *PDFgetN* press "*delete all*" button, specify the correction (*.fix*) file that we've just created, and press "*create S(Q)*" button (or "*automatic normalization*"). *PDFgetN* will create an *.sqb*-file that contains the blended S(Q) function. In this example, the *npdf_07275.sqb* file has been already generated.

2. Load *npdf_07275.sqb* file.

3. Select "*Set additional parameters*" in the Main Menu.

4. In the "*Truncate data*" field, type 

```r
0.87, 20
```

The data contains unphysical features below Q=0.88 Å^-1^ and mostly noise above 20.8 Å^-1^.

5. Repeat all the steps for the background fitting:

* In the "*Useful signal level*" field, type

```r
1.1, 10, 10, 0.2, 0.05
```

Select "*Baseline*"

* In the "*Type number of atoms of each type per unit cell*" field, type

```r
24.000, 15.708, 24.288, 96.000, 16.000 	
```

* In the "*Type neutron scattering lengths*" field, type

```r
8.240, -1.900, -1.900,  5.805,  7.054  
```

* In the "*Type ADP(s)*" field, type

```r
0.01285, 0.01646, 0.0328, 0.0136, 0.0187
```

* In the "*Type number of regions or bounds for a signal-free region*" field, type 

```r
4
```

* In the "*Type threshold scale (degree of smoothing)*" field, type 

```r
1, 1, 2, 5
```

6. Select the "*Set real-space condition*" option from the main menu and check "*Use low-r conditions*". 

* Type number density of the material

```r
0.08380058
```

* Set "*minimum r*" to

```r
0
```

* and "*maximum r*" to

```r
0.8
```

* Set "*grid spacing dr*" to

```r
0.01
```

Press "*Submit*".

7. Set Differential Evolution Parameters by selecting "*Optimize background with DifEv*" and setting

* "*Number of population members*" to 

```r
150
```

* "*Number of iterations*" to 

```r
500
```

* "*Crossover probability (CR)*" to 

```r
0.85
```

* "*Differential weighting factor (F)*' to 

```r
0.7
```

* "*Lower and upper bounds for scale factor fit*" to 

```r
0.1, 3
``` 

This will permit rescaling.

* "*Lower and upper bounds for background*" to 

```r
-2, 2
```

8. Select "*spline functions*" in the "*Fit background with*" field.

* Set "*Number of splines or spline knot positions*" to 

```r
0,  1,  2,  3,  4,  5, 6,  8, 11, 14, 17, 20
```

9. Press "*Start Fit*". 

10. Select "*Fit Results Plot*" to view the fit and "*Fit results*" in the main menu to save the results in a text format or as a binary file that contains R-objects. 

11. The G(r) can be calculated from the background-subtracted data and saved as a text file.  The plot of G(r) can be saved as well.

12.  You can proceed with the iterative algorithm, which includes the following steps:

  (i) Estimate the background using the Q-space Bayesian model;

  (ii) Calculate the difference between the G(r) obtained using the two models for r< 1 Å

  (iii) Convert this difference into Q-space and add it to the estimate of the baseline SB

  (iv) Minimize the target function for the new G(r)-corrected model

Steps (i) and (iv) can be performed using either Gradient Descent Algorithm (GDA) or DEA. GDA is faster but tends to converge to a local minimum. DEA is slower but performs global optimization. The DEA will use the same parameters as were specified for the initial fit.


