

###########PCA Visual Generating Function##########

#names.graphs vector of names for the graphs
#pca.data is unique pca values to be used in the function

pcagraphs<-function( names.graphs, pca.data){
  #Percent Contribution Graphs
  
  # names.graphs <- names.mphi 
  #pca.data <- pca.nogender
  
  
  #Plotting the contrbution of each variable without gender
  pdf(file = paste(gr.path, names.graphs, ".contribution.nogender.pdf"), width = 5, height = 5) #open pdf
  fviz_contrib(pca.data, choice = "var", axes = 1:2, title = "contribution of Variables", file= paste(working.dir,"/",output.folders[3], "/", sep=""))
  dev.off()
  
  
  
  #Two Dimensional PCA Graphs
  
  #plot the pca (no gender) using two dimensions
  pdf(file = paste(gr.path, names.graphs, "pcaplot.nogender.pdf"), width = 5, height = 5) #open pdf
  fviz_pca_ind(pca.data, col.ind = "cos2", 
               gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
               repel = TRUE 
  )
  dev.off()
  
  
  #PCA Biplots
  
  #making pca biplots (without gender)
  pdf(file = paste(gr.path, names.graphs, "biplots.gender.pdf"), width = 5, height = 5) #open pdf
  fviz_pca_biplot(pca.data, repel = TRUE,
                  col.var = "#2E9FDF", # Variables color
                  col.ind = "#696969"  # Individuals color
  )
  dev.off()
}

#####To use function enter names.mphi and pca.data below

names.mphi <- "Frog"
pcagraphs(names.mphi,pca.nogender)

