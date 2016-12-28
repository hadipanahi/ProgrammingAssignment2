## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# the function below makes a list respsonsible for: setting the value of matrix, getting the value of the matrix, setting/getting the
#value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m<<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

## the function below cacluates the inverse of a given matrix using the solve methidod,
## it first checks to see if the inverse is calcualted previously or not, as it can be computationally expensive
## in case of previous calc, it retuns the cached value
##else, the inverse is calculated and stored in the cache for the future calls


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)){
    message("getting cached inverse matrix!")
    return(m)
  }
  data<-x$get()
  m<- solve(data)
  x$setinverse(m)
}
