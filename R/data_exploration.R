
set.seed = 1

if (! require('dslabs')) {
  install.packages('dslabs')
  require('dslabs')
}
if (! require('lattice')) {
  install.packages('lattice')
  require('lattice')
}
if (! require('neuralnet')) {
  install.packages('neuralnet')
  require('neuralnet')
}
if (! require('ggplot2')) {
  install.packages('ggplot2')
  require('ggplot2')
}

if (! require('ggfortify')) {
  install.packages('ggfortify')
  require('ggfortify')
}

mnist = read_mnist()

x_train <- mnist$train$images
y_train <- mnist$train$labels



train = cbind(y_train, as.data.frame(x_train))

x_test <- mnist$test$images
y_test <- mnist$test$labels

sum = colSums(x_train)

# Find the pixels that are always 0
names(sum) = 1:784

names(sum[sum==0])

# Find the pixels that are occupied under 20 times

names(sum[sum<20])

#principal components - this step took 3 min or so on my oldish machine

x_train_prcomp <- prcomp(x_train)

summary(x_train_prcomp)

autoplot(x_train_prcomp,data=train, colour = 'y_train')

pixelrows = 0

for (i in 1:784)
{
  pixelrows = append(pixelrows,x_train[,i])
}

distribution = table(pixelrows)


