source('./cachematrix.R')

# Same as:
# solve(matrix(c(1, 1, 3, 2, 1, 2, 4, 1, 1), 3, 3))
m <- makeCacheMatrix(matrix(c(1, 1, 3, 2, 1, 2, 4, 1, 1), 3, 3))
print(cacheSolve(m))

# Computing inverses of large matrices is computationally expensive.
# Working implementation of caching should return the result after the second
# call to cacheSolve() much faster than after the first one.
m <- makeCacheMatrix(matrix(rnorm(1000000), 1000, 1000))
print(cacheSolve(m)[1, 1])
print(cacheSolve(m)[1, 1])
m$set(matrix(rnorm(1000000), 1000, 1000))
print(cacheSolve(m)[1, 1])
print(cacheSolve(m)[1, 1])
