## A simple implementation of memoized matrix inverse.

## Constructs a compound data structure consisting of a matrix together with
## its cached inverse. Returns a list providing functions to retrieve/alter
## the state of the data structure.
##
## Note that doing it this way is not necessarily a good idea, as the innards
## of the cached inverse are exposed, so there are no good guarantees that
## the cached inverse does correspond to the stored matrix.
makeCacheMatrix <- function(x = matrix()) {
    x.inv <- NULL
    
    set <- function(x.new) {
        ## Binds the x parameter  in the enclosing function's scope to the new
        ## matrix; resets the cached inverse.
        x <<- x.new
        x.inv <<- NULL
    }
    get <- function () {
        x
    }
    set.inv <- function (x.inv.new) {
        x.inv <<- x.inv.new
    }
    get.inv <- function () {
        x.inv
    }
    
    list(set = set, get = get, set.inv = set.inv, get.inv = get.inv)
}


## Computes the inverse of a matrix, caching the result, and using it when
## already available. Expects the matrix in the representation created by
## makeCacheMatrix() -- will break on other inputs
cacheSolve <- function(x, ...) {
    ## Compute the inverse if cached inverse is not present, and cache it.
    if (is.null(x$get.inv())) {        
        x$set.inv(solve(x$get(), ...))
    }
    
    ## Returns the cached inverse.
    x$get.inv()
}
