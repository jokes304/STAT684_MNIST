# this shows how to read the MNIST data, and gives a function to display the digit as an image

if (! require('dslabs')) {
  install.packages('dslabs')
  require('dslabs')
}
if (! require('lattice')) {
  install.packages('lattice')
  require('lattice')
}

plotDigit = function(x, title = '') {
  matObj = matrix(x,nrow=28)[,28:1]
  mode(matObj) = 'numeric'
  levelplot(matObj,col.regions=cols, xlab = '', ylab = '', main = title)
}

# Read MNIST Data
mnist = read_mnist()

# select an index and display the digit
idx   = 100
m     = mnist$train$images[idx,]
cols=gray.colors(100)

plotDigit(m, title = as.character(mnist$train$labels[idx]))

