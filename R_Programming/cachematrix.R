## The following is a pair of functions that cache and compute the inverse of a matrix.

## This function creates a function of "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(sol) inv <<- sol
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)  
  
}

## This function 'cacheSolve' need a input object created by 'makeCacheMatrix'
## It will return the inverse matrix of the input matrix in 'makeCacheMatrix'

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv  
}
