#######COmputing Linear Discriminant Function Analysis with Scaled data#########

#Computing lda

#Compute lda using population number
Frogz.lda.pop <- lda(population.z~weigh.z+lenght.z+tox.z , data = Frogz)
Frogz.lda.pop
prop.pop = Frogz.lda.pop$svd^2/sum(Frogz.lda.pop$svd^2)
prop.pop
# first exaplain 65%, second expalins 31%, the third explains 5%

# Compute lda using weigth
Frogz.lda.weight <-lda(weigh.z~population.z+lenght.z+tox.z, data = Frogz)
Frogz.lda.weight
prop.weight = Frogz.lda.weight$svd^2/sum(Frogz.lda.weight$svd^2)
prop.weight
#First explains 75%. second explains 18% and third exaplains 0.06%


# Compute pca using svl ratio
Frogz.lda.length <- lda(lenght.z~population.z+weigh.z+tox.z, data = Frogz)
Frogz.lda.length
prop.length = Frogz.lda.length$svd^2/sum(Frogz.lda.length$svd^2)
prop.length

# Compute using toxicity
Frogz.lda.tox<- lda(tox.z~population.z+weigh.z+lenght.z, data = Frogz)
#error variables 1,2 and 3 appear to be constant within group

# Generate table
lda.data<-data.frame(prop.pop, prop.length, prop.weight)
lda.data