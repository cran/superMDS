\name{TrainSuperMDS}
\alias{TrainSuperMDS}
\title{
Find a set of configuration points that agree with a dissimilarity matrix D and a vector of class labels y
}
\description{
Given a nxn dissimilarity matrix D and a n-vector of binary (1,2) class labels y, this function outputs a set of configuration points z1,...,zn,
each a S-vector, such that the distances between the configuration points approximate the dissimilarity matrix D, AND such that zis >= zjs tends to occur
when yi >= yj. 
}
\usage{
TrainSuperMDS(d = NULL, y, alpha = 0.5, S = 2, x = NULL, nstarts = 5, silent = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{d}{
A nxn dissimilarity matrix. If NULL, then x, a nxp data matrix, must be input instead.
}
  \item{y}{
A n-vector of binary labels, in the form of 1's and 2's. For instance, c(1,1,1,2,2) could be input if D is a 5x5 matrix.
}
  \item{alpha}{
A scalar between 0 and 1. If alpha=0 then this is just least squares MDS, and if alpha=1 then it's completely supervised.
}
  \item{S}{
The number of dimensions of the configuration points z1,...,zn. Must be at least equal to 1.
}
  \item{x}{
A nxp data matrix, to be input only if D is NULL. 
}
  \item{nstarts}{
The supervised MDS algorithm finds a local minimum for the objective. Here, specify the number of initial values to try. If nstarts>1 then the set of configuration
points corresponding to the optimal (smallest) value of the objective will be reported.
}
  \item{silent}{
Set to TRUE in order to turn off printing output to screen.
}
}
\value{
\item{z}{A nxS matrix of the configuration points obtained.}
\item{crits}{The values of the criterion obtained at the iterations of the algorithm.}
\item{stress}{The portion of the final criterion value that are due to the STRESS component of the objective function.}
\item{super}{The portion of the final criterion value that are due to the SUPERVISED component of the objective function.}
}
\references{
Witten and Tibshirani (2011) Supervised multidimensional scaling for visualization, classification, and bipartite ranking. 
Computational Statistics and Data Analysis.
}
\author{
Daniela M Witten
}
\seealso{
\code{\link{TestSuperMDS}}
}
\examples{
# Try ?superMDS for examples
}
