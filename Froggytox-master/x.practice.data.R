######PCA GENERATED DATA###########


######Generating random numbers######


#generate random numbers for data set 
a <- rnorm(100,3,200)
a
#generating related numbers
b<--2*a
b
#plot relationship between a and b
plot(a,b)
#create data frame for a and b
a.b<-data.frame(a,b)
a.b

#generate more random numbers
x <- rnorm(100,3,6)
#generate  more unrelated numbers
y <-rnorm(100,6,3)
#plot relationship between x and y
plot(x,y)
#create data frame for x and y
x.y<-data.frame(x,y)
x.y

######plotting pca#######

#individaul first (attempting to understand pca relationships better)

#creating pca a.b
pca.a.b <- prcomp(t(a.b), scale=TRUE)
#plotting pca a.b
plot(pca.a.b$x[,1], pca.a.b$x[,2])

#creating pca x.y
pca.x.y<- prcomp(t(x.y), scale=TRUE)
#plotting pca x.y
plot(pca.x.y$x[,1], pca.x.y$x[,2])


#running pca with a,b,x and y
#creating data frame
a.b.x.y<-data.frame(a,b,x,y)
#running pca
pca.a.b.x.y<- prcomp(t(a.b.x.y), scale=TRUE)
#plotting pca
plot(pca.a.b.x.y$x[,1], pca.a.b.x.y$x[,2])
#note there are now four data points instead of 2

#######generating scree plots########

#making a scree plot a.b
#finding the squared value of the standerd deviation of pca
pca.var.a.b <- pca.a.b$sdev^2
#converting to percentage
pca.var.a.b.per <- round(pca.var.a.b/sum(pca.var.a.b)*100, 1)
pca.var.a.b.per
#Plotting on bargraph
barplot(pca.var.a.b.per, main="Scree Plot", xlab="Principal Component", ylab="Percent Variation")

#making a scree plot x.y
#finding the squared value of the standard deviation of the pca
pca.var.x.y <- pca.x.y$sdev^2
#converting to percentage
pca.var.x.y.per <- round(pca.var.x.y/sum(pca.var.x.y)*100, 1)
#plotting on bargraph
barplot(pca.var.x.y.per,main="Scree Plt XY", xlab="Principal Componenet", ylab = "Percent Variation")

#Making a scree plot a.b.x.y
##finding the squared value of the standard deviation of the pca
pca.var.a.b.x.y <- pca.a.b.x.y$sdev^2
#converting to percentage 
pca.var.a.b.x.y.per<- round(pca.var.a.b.x.y/sum(pca.var.a.b.x.y)*100,1)
#converting to a barplot
barplot(pca.var.a.b.x.y.per, main = "Scree Plot ABXY",)

########end of script.
