#loading required packages

library(pacman)
pacman::p_load(
  tidyverse,
  ggplot2,
  gt)

# criando dados para plot

#prevVar -> prevalence 
#

#angina prevalence
prevAngEst <- as.numeric(0.94)
llAngEst <- as.numeric(0.90)
ulAngEst <- as.numeric(0.99) 

#Stroke prevalence
prevAve <- as.numeric(1.12)
llAve <- as.numeric(1.06)
ulAve <- as.numeric(1.18)


## criando dataset

#Definindo variáveis
varCVD <- c(0.5,0.6)
varRP <- c(prevAngEst,prevAve)
varLL <- c(llAngEst,llAve)
varUL <- c(ulAngEst,ulAve)


## Definindo estruturas 

dtprevalencia <- cbind(varCVD, varRP, varLL, varUL) # variáveis que irão compor o novo banco (cbind>colunas,rbind>linhas)
dtprevalencia <- as.data.frame(dtprevalencia)

glimpse(dtprevalencia) #ver o banco

### Transformação variáveis numéricas
dtprevalencia$varCVD <- as.character(dtprevalencia$varCVD) 
dtprevalencia$varRP <- as.numeric(dtprevalencia$varRP)
dtprevalencia$varLL <- as.numeric(dtprevalencia$varLL)
dtprevalencia$varUL <- as.numeric(dtprevalencia$varUL) 

############################################
#p<- 
  dtprevalencia |> 
  ggplot(aes(y=fct_rev(varCVD))+
  theme_classic())
#p

p <- dtprevalencia |> 
     ggplot(aes(y=varCVD))+
           theme_classic()
p

p <- p+
  geom_point(aes(x=varRP), shape=15, size=2, color="red") +
  geom_linerange(aes(xmin=varLL,xmax=varUL))
p

p <- p +
  geom_vline(xintercept = 1, linetype="3313", linewidth=0.1, color="blue")
p

p <- p +
  theme(axis.line.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        axis.title.y = element_blank())
p

  