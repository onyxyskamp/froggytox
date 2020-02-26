################################################################################

#                                  MAIN SCRIPT                                #

################################################################################

#----------------------------TABLE OF CONTENTS---------------------------------

# - Packages downloaded
# - Libraries
# - Data Download 
# - Workflow 
# - Data cleaning
# - Code Sources


################################################################################

#------------------------------PACKAGE DOWNLOAD---------------------------------

# package used for analyses

install.packages("tidyverse")
install.packages("MASS")
install.packages("devtools")
install_github("Displayr/flipMultivariates")
install.packages("FactoMineR")
install.packages("factoextra")

#---------------------------------LIBRARIES-------------------------------------

# Load the packages in the libraries 

library(tidyverse)
library(MASS)
library(devtools)
library(flipMultivariates)
library("FactoMineR")
library("factoextra")

#--------------------------------DATA DOWLOAD-----------------------------------

# The raw data file was originally found from:
#   https://datadryad.org/stash/dataset/doi:10.5061/dryad.t979dp85
# The datasheet was then downloaded as a csv file. When downloading this 
# dataset as a csv, we saved the first worksheet. 

# The file of the raw data can be accessed with the following code.

setwd("~/R/Froggytox-master")
working.dir <- getwd()

# This should be set to the working directory of
# the "BigDataChallenge_Master" folder after downloading this repo. 

raw.data <- read.csv("froggytox.csv")

#----------------------------------WORKFLOW-----------------------------------

# In our working firectory we created 4 pathways to different folders with 
# specific outputs 

#           - 1.Raw.Data  -> the path to this folder is: rd.path
#                 (This folder contains a copy of the original downloaded
#                   data set without changes.)
#
#           - 2.Analysis -> the path to this folder is: an.path
#                 (This folder contains saved outputs of our anaylsis.)
#
#           - 3.Graphs -> the path to this folder is: gr.path
#                 (This folder contains all visualizations of data.)

output.folders <- c("1.Raw.Data","2.Analysis","3.Graphs")

# Check to see if the folders exist in the working directory and if they don't, 
# use the following loop. 
# The following loop checks the output.folders list and checks to see 
# if the folders exist in the working directory. If they don't it will create 
# them. 

# Make the folders
for(i in 1:length(output.folders)) 
  if(file.exists(output.folders[i]) == FALSE) 
    dir.create(output.folders[i])

#----------------------------------PATHWAYS----------------------------------

# The following is a directory of the pathways to each of our output folders

# Path to 1.Raw.Data folder
rd.path <- paste(working.dir,"/",output.folders[1], "/", sep="")

# Path to 2.Analysis
an.path <- paste(working.dir,"/",output.folders[2], "/", sep="")

# Path to 3.Graphs
gr.path <- paste(working.dir,"/",output.folders[3], "/", sep="")

# save raw data into the raw data file. 

write.csv(raw.data, paste(rd.path, "froggytox.csv"),
          row.names = FALSE)

#--------------------------------DATA CLEANING-------------------------------
# all data cleaning happens hear, because it's one line of code,
# another R script would be exesive 

d.omit <- na.omit(raw.data)
d.omit


