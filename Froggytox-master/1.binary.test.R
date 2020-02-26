########PCA binary test#########
# Does gender, a binomail value, effect PCA values?

########Calculating PCA without Gender#########
#######Computing PCA using prcomp#########

#Computing pca using prcomp (excluding binary gender data)
#Exlcuding all non-numeric data
pca.froggy<-prcomp(t(d.omit[,-c(1,3,4,7)]), scale=TRUE)
pca.froggy

#Making Scree plots to display the data
#first square the standard deviation of the pca
pca.var.froggy <- pca.froggy$sdev^2

#Convert the squared standard deviation into a percent
pca.var.froggy.per <- round(pca.var.froggy/sum(pca.var.froggy)*100, 1)
pca.var.froggy.per

#plot the percent on barplot
pdf(file = paste(gr.path, "barplot.nogender.pdf"), width = 5, height = 5) #open pdf
barplot(pca.var.froggy.per, main="Scree Plotof Frog Varience without Gender", xlab="Principal Component", ylab="Percent Variation")
dev.off()


########Computing pca using PCA method (as seen in FactoMineR and factoextra packages)(No gender)#########

#Calculating without Gender
#Computing pca
pca.nogender<-PCA(d.omit[,-c(1,3,4,7)], scale.unit = TRUE, ncp = 5, graph = TRUE)
pca.nogender

#getting eigenvalues
eig.val.nogender<- get_eigenvalue(pca.nogender)
eig.val.nogender

#Calculating Variation Values
var.nogender <- get_pca_var(pca.nogender)
var.nogender

#########Visually displaying the data (no gender)########

#scree plot
pdf(file = paste(gr.path, "screeplot.nogender.pdf"), width = 5, height = 5) #open pdf
fviz_eig(pca.nogender, addlabels = TRUE, ylim = c(0, 50))
dev.off()

#Plotting the amount of contrbution of each variable
pdf(file = paste(gr.path, "contribution.nogender.pdf"), width = 5, height = 5) #open pdf
fviz_contrib(pca.nogender, choice = "var", axes = 1:2, title = "Contribution of Variables", file= paste(working.dir,"/",output.folders[3], "/", sep=""))
dev.off()


#Two Dimensional PCA Graphs
#plot the pca (no gender) using two dimensions
pdf(file = paste(gr.path, "pcaplot.nogender.pdf"), width = 5, height = 5) #open pdf
fviz_pca_ind(pca.nogender, title = "PCA Plot Excluding Gender", col.ind = "cos2", 
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE 
)
dev.off()


#PCA Biplot
#making pca biplots (without gender)
pdf(file = paste(gr.path, "biplots.gender.pdf"), width = 5, height = 5) #open pdf
fviz_pca_biplot(pca.nogender, repel = TRUE, title = "PCA Biplot Excluding Gender",
                col.var = "#2E9FDF", # Variables color
                col.ind = "#696969"  # Individuals color
)
dev.off()

#########Computing PCA Including Binomial Gender Values#######

#Computing pca using prcomp method (including binomial gender data)

#first gender data must be numeric. Lets make gender numerical!
#creating numeric frog sex vector
frogsex<-as.numeric(d.omit$frogsex)
#join vector to dataframe
d.omit.plus<-cbind(d.omit, frogsex)

#Run pca on data removing non numeric colums
pca.froggy.gen<-prcomp(t(d.omit.plus[,-c(1,3,4,7)]))

#Squaring the standard deviation of the pca
pca.var.froggy.gen <- pca.froggy.gen$sdev^2
#Converting into percentage
pca.var.froggy.gen.per<- round(pca.var.froggy.gen/sum(pca.var.froggy.gen)*100, 1)
pca.var.froggy.gen.per

#Plotting as barplot
pdf(file = paste(gr.path, "barplott.gender.pdf"), width = 5, height = 5) #open pdf
barplot(pca.var.froggy.gen.per, main="Scree Plot of Frog Varience with Gender", xlab="Principal Component", ylab="Percent Variation")
dev.off() #close pdf

########Computing pca using PCA method (as seen in FactoMineR and factoextra packages) (gender)#########
#Calculating with Binomial Gender Values

#Computing pca with gender(Note PCA instead of prcomp)
pca.gender<-PCA(d.omit.plus[,-c(1,3,4,7)], scale.unit = TRUE, ncp = 5, graph = TRUE)
pca.gender

#Calculating eigenvalues
eig.val <- get_eigenvalue(pca.gender)
eig.val

#Variation with gender
var <- get_pca_var(pca.gender)
var


######Visually Displaying the Data (gender) ########

#making a scree plot
pdf(file = paste(gr.path, "screeplot.gender.pdf"), width = 5, height = 5) #open pdf
fviz_eig(pca.gender, addlabels = TRUE, ylim = c(0, 50))
dev.off() #close pdf


#Plotting the contribution of each variable with gender
pdf(file = paste(gr.path, "contribution.gender.pdf"), width = 5, height = 5) #open pdf
fviz_contrib(pca.gender, choice = "var", axes = 1:2, title ="Contribution of Variables")
dev.off()

#making pca biplots (with gender)
pdf(file = paste(gr.path, "biplots.nogender.pdf"), width = 5, height = 5) #open pdf
fviz_pca_biplot(pca.gender, repel = TRUE, title = "PCA Biplot Including Gender",
                col.var = "#2E9FDF", # Variables color
                col.ind = "#696969"  # Individuals color
)
dev.off()

#plot the pca (gender) and cos2 using two dimensions
pdf(file = paste(gr.path, "pcaplot.gender.pdf"), width = 5, height = 5) #open pdf
fviz_pca_ind(pca.gender, col.ind = "cos2", Title = "PCA cos2 Plot Including Gender",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE 
)
dev.off()

#########Generating PCA Table to display varience############

#Generating Table to display PCA varience
PCA.values<-data.frame(pca.var.froggy.gen.per[-c(5)], pca.var.froggy.per) # removed 5th row (0.00) in order to convert to data frame 
PCA.values

#######end of script
