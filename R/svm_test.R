
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

if (! require('tensorflow')) {
  install.packages('tensorflow')
  require('tensorflow')
}

if (! require('reshape2')) {
  install.packages('reshape2')
  require('reshape2')
}

if (! require('tfestimators')) {
  install.packages('tfestimators')
  require('tfestimators')
}

if (! require('reticulate')) {
  install.packages('reticulate')
  require('reticulate')
}

if (! require('mltools')) {
  install.packages('mltools')
  require('mltools')
}

if (! require('caret')) {
  install.packages('caret')
  require('caret')
}

if (! require('MASS')) {
  install.packages('MASS')
  require('MASS')
}

if (! require('kernlab')) {
  install.packages('kernlab')
  require('kernlab')
}

#path_to_python <- "C:/Users/Andrew/AppData/Local/r-miniconda/envs/tf/"    
#use_python(path_to_python,required=TRUE)

library(tensorflow)

#install_tensorflow(version="2.0.0", envname = "tf")

mnist = read_mnist()

train_images<-mnist$train$images/255
corrs = findCorrelation(train_images,cutoff=0.9)

train_images<-mnist$train$images[,corrs]/255
test_images <- mnist$test$images[,corrs]/255
#dt_labels <- as.factor(mnist$train$labels)
#dt_lab = as.data.frame (dt_labels)
#sdfls<-dummyVars(" ~ .",data=dt_lab)
#train_labels <- data.frame(predict(sdfls, newdata = dt_lab))

#label_1<-train_labels[1,]
#image_1<-train_images[1,]

svm_fit_linear <- ksvm(x=train_images, y = mnist$train$labels, type='C-svc', kernel='vanilladot', C=1, scale=FALSE)

svm_pred <- predict(svm_fit_linear , test_images)


acc <- table(svm_pred,mnist$test$labels)

sum(diag(prop.table(acc)))
