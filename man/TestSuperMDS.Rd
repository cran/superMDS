\name{TestSuperMDS}
\alias{TestSuperMDS}
\title{
Given the configuration points of a set of training observations, and the dissimilarities between the training and test observations, compute the
configuration points for a set of test observations.
}
\description{
Suppose that we have training data observations x (of dimension nxp) with an associated binary outcome vector y of length n, 
 and that TrainSuperMDS has already been run on the training observations. Furthermore, we have test observations xte (of dimension mxp) for which we do not
have an outcome vector. This function will predict the class of the test observations, and also to compute configuration points for the test observations.
}
\usage{
TestSuperMDS(trout, xte = NULL, dtetr = NULL)
}
\arguments{
  \item{trout}{
The output of a call to TrainSuperMDS on the training data. We assume that there were n training observations which were either passed into TrainSuperMDS as a
nxn dissimilarity matrix, or as a nxp dat matrix. 
}
  \item{xte}{
The test observations, a matrix of dimension mxp. If this is NULL then must pass in dtetr. Can pass in xte only if previously passed in x when TrainSuperMDS
was called. Otherwise, pass in dtetr instead.
}
  \item{dtetr}{
A mxn data matrix with the dissimilarity between each test observation and each training observation; if NULL then must pass in xte.
}
}
\value{
\item{ytehat}{Predicted class labels for test data.}
\item{zte}{Predicted configuration points for test data; should be a matrix of dimension mxS where S is the dimension of training configuration points.}
}
\references{
Witten and Tibshirani (2011) Supervised multidimensional scaling for visualization, classificatoin, and bipartite ranking. CSDA.
}
\author{
Daniela M Witten
}
\seealso{
\code{\link{TrainSuperMDS}}
}
\examples{
# Try ?superMDS for examples.
}
