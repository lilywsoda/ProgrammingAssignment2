## These following two functions cache the value of the inverse
## so that when we need it again, it can be looked up in the cache 
## rather than recomputed

## The function makeCacheMatrix creates a special "matrix" object 
## that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv, 
       getinv = getinv)
}


## The function cacheSolve receives the special "matrix" returned 
## by makeCacheMatrix above, and returns the inverse of that matrix.
## When the inverse has already been calculated (and the matrix has not changed), 
## the function retrieves the inverse from the cache.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(m)
  inv
}
