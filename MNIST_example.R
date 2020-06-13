# this shows how to read the MNIST data, and gives a function to display the digit as an image

if (! require('dslabs')) {
  install.packages('dslabs')
  require('dslabs')
}

# Read MNIST Dataa
mnist = read_mnist()

# select an index and display the digit
idx   = 100
m     = mnist$train$images[idx,]
plotDigit(m, title = as.character(mnist$train$labels[idx]))

plotDigit = function(x, title = '') {
  matObj = matrix(x,nrow=28)[,28:1]
  mode(matObj) = 'numeric'
  levelplot(matObj,col.regions=cols, xlab = '', ylab = '', main = title)
}
