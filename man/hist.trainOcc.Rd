% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hist.trainOcc.R
\name{hist.trainOcc}
\alias{hist}
\alias{hist.trainOcc}
\title{Diagnostic distributions plot for a \code{\link{trainOcc}} object.}
\usage{
\method{hist}{trainOcc}(x, predUn = NULL, th = NULL, cab = NULL,
  main = NULL, ylim = NULL, breaks = "Scott", col = "grey",
  border = NA, xlim = NULL, add_calBoxplot = TRUE,
  noWarnRasHist = FALSE, ...)
}
\arguments{
\item{x}{an object of class \code{\link{trainOcc}}.}

\item{predUn}{a vector of unlabeled predictions (if \code{NULL} \code{x$predUn} is used, if existing).}

\item{th}{draw vertical lines in the histogram, indication for a threshold.}

\item{cab}{for a color-coded histogram a list with 
elements \code{colors} (vector of \code{R} colors, length n) and \code{breaks} (vector of numeric values, length n+1).}

\item{main}{a title for the plot. if not given the parameters of the model are added.}

\item{ylim}{the y limits of the plot.}

\item{breaks}{see identically named argument in \code{\link{hist}}}

\item{col}{a colour to be used to fill the bars.}

\item{border}{the color of the border around the bars.}

\item{add_calBoxplot}{bool. Should the positive calibration predictions be plotted? Defaults to \code{TRUE}.}

\item{noWarnRasHist}{Supresses warning when histogram is derived from raster.}

\item{...}{other arguments that can be passed to \code{\link{plot}}.}
}
\value{
Diagnostic distributions plot.
}
\description{
The histogram of the predicted unlabeled data is shown together with the 
hold-out predictions of the positive and unlabeled traning data (boxplots).
}
\details{
hist.trainOcc
}
\examples{
data(bananas)
### an underfitted model 
oc <- trainOcc (x = bananas$tr[, -1], y = bananas$tr[, 1], 
                tuneGrid=expand.grid(sigma=0.1, 
                                     cNeg=0.5, 
                                     cMultiplier=16))
### predict 10\% or the unlabeled data and plot 
# the diagnostic distributions plot
# and the model in the 2D feature space 
set.seed(123)
idx.pred <- sample(400*400, 16000)
hist(oc, predict(oc, bananas$x[][idx.pred,]), th=0)
featurespace(oc, th=0)

### an overfitted model 
oc <- trainOcc (x = bananas$tr[, -1], y = bananas$tr[, 1], 
                tuneGrid=expand.grid(sigma=1, 
                                     cNeg=32, 
                                     cMultiplier=16))
### predict 10\% or the unlabeled data and plot 
# the diagnostic distributions plot
# and the model in the 2D feature space 
set.seed(123)
idx.pred <- sample(400*400, 16000)
hist(oc, predict(oc, bananas$x[][idx.pred,]), th=0)
featurespace(oc, th=0)

### a good model 
oc <- trainOcc (x = bananas$tr[, -1], y = bananas$tr[, 1], 
                tuneGrid=expand.grid(sigma=1, 
                                     cNeg=0.0625, 
                                     cMultiplier=64))
### predict 10\% or the unlabeled data and plot 
# the diagnostic distributions plot
# and the model in the 2D feature space 
set.seed(123)
idx.pred <- sample(400*400, 16000)
hist(oc, predict(oc, bananas$x[][idx.pred,]), th=0)
featurespace(oc, th=0)
}

