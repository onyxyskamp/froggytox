#############Scaled PCA analysis#######
########Converting to Z scores#######


#Converting numeric values to Z scores

population.z<-scale(d.omit[,-c(1,3,4,5,6,7,8)])
weigh.z<-scale(d.omit[,-c(1,2,3,4,6,7,8)])
lenght.z<-scale(d.omit[,-c(1,2,3,4,5,7,8)])
tox.z<-scale(d.omit[,-c(1,2,3,4,5,6,7)])

#create daata frame from scaled data
Frogz<-data.frame(population.z,weigh.z,lenght.z,tox.z)

#ensure data is numeric
str(Frogz)

#calculate PCA using prcomp method

froggz.comp<-prcomp(t(Frogz), scale = TRUE)
froggz.comp

#Making Scree plots to display the data

#first square the standard deviation of the pca
pca.var.frogz <- froggz.comp$sdev^2
pca.var.frogz
#Convert the squared standard deviation into a percent
pca.var.frogz.per <- round(pca.var.frogz/sum(pca.var.frogz)*100, 1)
pca.var.frogz.per
#plot the percent
pdf(file = paste(gr.path, "barplot.scaled.pdf"), width = 5, height = 5) #open pdf
barplot(pca.var.frogz.per, main="Scree Plot of Frog Varience Scaled", xlab="Principal Component", ylab="Percent Variation")
dev.off()

############Plotting PCA using PCA method (as seen in FactoMineR and factoextra packages)###########
#Calculating PCA
pca.scaled<-PCA(Frogz, scale.unit = TRUE, ncp = 5, graph = TRUE)
print(pca.scaled)

#Calculating eigenvalues
eig.val <- get_eigenvalue(pca.scaled)
eig.val

#Calculating Varience 

var.z <- get_pca_var(pca.scaled)
var.z


##########visualizing the data#########

#Creating a scree plot
pdf(file = paste(gr.path, "screeplot.scaled.pdf"), width = 5, height = 5) #open pdf
fviz_eig(pca.scaled, addlabels = TRUE, ylim = c(0, 50))
dev.off() #close pdf


#Plotting the contribution of each variable 
pdf(file = paste(gr.path, "contribution.scaled.pdf"), width = 5, height = 5) #open pdf
fviz_contrib(pca.scaled, choice = "var", axes = 1:2, title ="Contribution of Variables")
dev.off()

#making pca biplots
pdf(file = paste(gr.path, "biplots.scaled.pdf"), width = 5, height = 5) #open pdf
fviz_pca_biplot(pca.scaled, repel = TRUE,
                col.var = "#2E9FDF", # Variables color
                col.ind = "#696969"  # Individuals color
)
dev.off()

#plot the pca using two dimensions
pdf(file = paste(gr.path, "pcaplot.gender.pdf"), width = 5, height = 5) #open pdf
fviz_pca_ind(pca.scaled, col.ind = "cos2", 
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE 
)
dev.off()

#########Create PCA Table to Compare#######
#####This can only be done if unsclaed pca has been calculated from the previus script.
pca.table<-cbind(PCA.values, pca.var.frogz.per)
pca.table
####Notice the scaled pca value is very different