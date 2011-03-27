\name{superMDS-package}
\alias{superMDS-package}
\alias{superMDS}
\docType{package}
\title{
Supervised multidimensional scaling for visualization, classification, and bipartite ranking
}
\description{
A method for implementing the supervised multidimensional scaling proposal of Witten and Tibshirani (2011)
}
\details{
\tabular{ll}{
Package: \tab superMDS\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2011-03-27\cr
License: \tab GPL >= 2\cr
LazyLoad: \tab yes\cr
}
Supervised multidimensional scaling (MDS) is a supervised version of least squares MDS. Suppose that we have a nxn dissimilarity matrix D
and we want to find a set of n configuration points z1,...,zn, each a vector of length s, so that D is well-approximated by the Euclidean distances
between the configuration points. Then least squares MDS can be used. However, suppose that we also have a vector of binary class labels associated with
the dissimilarity matrix, yi = 1 or 2 for i=1,...,n. Then we might want configuration points whose Euclidean dsitances approximate D, and also that have the 
property that zis > zjs when yi > yj. This is the objective of supervised MDS. It leads to a method for visualizing observations, as well as a classification
method. Details can be found in the paper below.
}
\author{
Daniela M. Witten

Maintainer: Daniela M. Witten <dwitten@u.washington.edu>
}
\references{
Witten and Tibshirani (2011) Supervised multidimensional scaling for visualization, classification, and bipartite ranking. 
Computational Statistics and Data Analysis 55(1): 789-801.
}
\examples{
########### Generate some data  ############
n <- 30
p <- 10
x <- matrix(rnorm(n*p),ncol=p)
y <- c(rep(1,n/2),rep(2,n/2))
xte <- matrix(rnorm(n*p),ncol=p)
yte <- c(rep(1,n/2),rep(2,n/2))
x[y==1,1:(p)] <-  x[y==1,1:(p)] + .4
x[y==2,1:(p)] <-  x[y==2,1:(p)] - .4
xte[yte==1,1:(p)] <-  xte[yte==1,1:(p)] + .4
xte[yte==2,1:(p)] <-  xte[yte==2,1:(p)] - .4    
# Done generating data  #

########### Perform SuperMDS ##############
out <- TrainSuperMDS(x=x,y=y,alpha=.4,S=2, silent=TRUE)
# A plot of the training configuration points #
par(mfrow=c(1,2))
plot(out$z, col=yte, main="Training Data", xlab="Dimension 1", ylab="Dimension 2")
testout <- TestSuperMDS(trout=out,xte=xte)
ytehat <- testout$ytehat
# A table showing the true vs predicted class labels #
print(table(ytehat,yte)) 
# A plot of the test configuration points #
plot(testout$zte, col=yte, main="Test Data", xlab="Dimension 1", ylab="Dimension 2")
}
