## Below are two functions that are used to create a special object that stores 
## a matrix and caches its inverse.

## The first function, "makeCacheMatrix" creates a special "matrix" object, 
## which is really a list containing a function to
##   1. set the value of the matrix
##   2. get the value of the matrix
##   3. set the value of the inverse matrix
##   4. get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL         
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x       
        setinv <- function(inv) i <<- inv
        getinv <- function() i
        list(set = set, get = get, setinv = setinv, getinv = getinv)        
}


## The second function, "cacheSolve" calculates the inverse of the special "matrix" 
## created with the above function, "makeCacheMatrix". 
## However, it first checks to see if the inverse has already been calculated. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the matrix and sets the value of the inverse 
## in the cache via the "makeCacheMatrix" function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinv()               
        if(!is.null(i)) {
                message("getting cached data...")                
                return(i)
        }                 
        mat <- x$get()
        i <- solve(mat)                                 
        x$setinv(i)                
        return(i)
}        