source('./cachematrix.R')

m <- makeCacheMatrix(matrix(c(1, 1, 3, 2, 1, 2, 4, 1, 1), 3, 3))
print(cacheSolve(m))

m <- makeCacheMatrix(matrix(rnorm(1000000), 1000, 1000))
print(cacheSolve(m)[1, 1])
print(cacheSolve(m)[1, 1])
m$set(matrix(rnorm(1000000), 1000, 1000))
print(cacheSolve(m)[1, 1])
print(cacheSolve(m)[1, 1])
