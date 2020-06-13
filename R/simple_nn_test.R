
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

mnist = read_mnist()

x_train <- mnist$train$images
y_train <- mnist$train$labels

x_test <- mnist$test$images
y_test <- mnist$test$labels


x_train_df <- as.data.frame(x_train)

train = cbind(y_train, x_train_df)
names = names(x_train_df)

formula <- as.formula(paste("y_train ~", paste(names[!names %in% "train"], collapse = " + ")))

nn <- neuralnet(formula, train, hidden=c(5,3), linear.output=T)


