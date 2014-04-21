## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    x.inv <- NULL
    set <- function(x.new) {
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


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    if (is.null(x$get.inv())) {
        x$set.inv(solve(x$get(), ...))
    }
    x$get.inv()
}
