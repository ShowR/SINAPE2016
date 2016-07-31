################################################################################
### Criar apresentacao 
################################################################################


## Instalando pacotes
if (!require(slidify, quietly = TRUE)) {
  
  # Instala os pacotes necessarios para trabalho
  install.packages("needs", dep=T)
  library(needs)
  needs(ggvis)
  needs(devtools)
  needs(shiny)
  needs(knitr)
  needs(knitrBootstrap)
  needs(knitLatex)
  needs(knitcitations)
  needs(rmarkdown)
  needs(XML)
  needs(openintro)
  needs(plotrix)
  needs(leaflet)
  needs(shinyRGL)
  needs(rvg)
  needs(leaflet)
  needs(rMaps)
  needs(rCharts)
  needs(dygraphs)
  needs(htmltools)
  needs(htmlwidgets)
  needs(metricsgraphics)
  needs(RColorBrewer)
  needs(networkD3)
  needs(DT)
  needs(threejs)
  needs(DiagrammeR)
  needs(metricsgraphics)
  needs(ggthemes)
  needs(googleVis)
  needs(RgoogleMaps)
  needs(TTR)
  needs(geosphere)
  needs(ggmap)
  needs(jpeg)
  needs(mapproj)
  needs(maps)
  needs(proto)
  needs(quantmod)
  needs(rjson)
  needs(stringi)
  needs(magrittr)
  needs(dplyr)

  pkts <- c("ramnathv/slidify", 
            "ramnathv/slidifyLibraries",
            "ramnathv/rCharts",
            "ramnathv/rMaps",
            "ramnathv/rNotebook",
            "bwlewis/rthreejs")

  install_github(pkts, force=TRUE)
  update.packages(ask=FALSE)
  library(slidify)
}  

# Indica diretorio do projeto
setwd("c://Projetos//SINAPE2016//")

# Monta apresentacao
slidify('index.Rmd')

# Executa apresentacao
runDeck()
