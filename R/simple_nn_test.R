
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

mnist = read_mnist()

x_train <- mnist$train$images
y_train <- mnist$train$labels

x_test <- mnist$test$images
y_test <- mnist$test$labels


x_train_df <- as.data.frame(x_train)

x_test_df <- as.data.frame(x_test)

train = cbind(y_train, x_train_df)
test = cbind(y_test,x_test_df)


samp = sample(1:60000,size=1000,replace=FALSE)
train_samp= train[samp,]

names = names(x_train_df)

formula <- as.formula(paste("y_train ~", paste(names[!names %in% "train"], collapse = " + ")))

nn <- neuralnet(formula, train_samp, hidden=c(5,3), linear.output=T)

plot(nn)

pr.nn <- compute(nn, test)


pr.nn_ <- pr.nn$net.result*(max(train$y_train)-min(train$y_train))+min(train$y_train)
test.r <- (test$y_test)*(max(test$y_test)-min(test$y_test))+min(test$y_test)

MSE.nn <- sum((test.r - pr.nn_)^2)/nrow(test)

