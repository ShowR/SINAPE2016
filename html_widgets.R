################################################################################
## Rotinas iniciais
library(htmlwidgets)

# Posiciona no diretorio assets//widgets
wd <- getwd()
setwd(paste0(wd, "//assets//widgets"))


# Funcao para salvar widget na pasta assets//widgets
SaveWidget <- function(widget = NULL, html=NULL) {
  htmlFile <- paste0(html, ".html")
  saveWidget(widget, htmlFile, selfcontained=FALSE)
} 

################################################################################
## @knitr borneo
library(leaflet)

tarzanIcon <- icons(
  iconUrl = "..//img//ico_tarzan.png",
  iconWidth = 95, iconHeight = 95,
  iconAnchorX = 22, iconAnchorY = 94,
  shadowWidth = 50, shadowHeight = 64,
  shadowAnchorX = 4, shadowAnchorY = 62
)

banandeiraIcon  <- icons(
  iconUrl = "..//img//ico_banana.png",
  iconWidth = 120, iconHeight = 120,
  iconAnchorX = 22, iconAnchorY = 94,
  shadowWidth = 50, shadowHeight = 64,
  shadowAnchorX = 4, shadowAnchorY = 62
)

m = leaflet() %>% 
  addTiles() %>%
  setView(114.55485, 0.961883, zoom = 6) %>%
  addMarkers(lng=114.55485, 
             lat=0.961883, 
             popup="<b>Gurizada de Borneu</b>",
             icon = tarzanIcon) %>%
  addMarkers(lng=112, 
             lat=0.7, 
             icon = banandeiraIcon)

SaveWidget(m, "borneo")

################################################################################
# @knitr globo
library(threejs)
# Plot flights to frequent destinations from
# Callum Prentice's global flight data set,
# http://callumprentice.github.io/apps/flight_stream/index.html
data(flights)
flights[1:2000,3] <- 0.7
flights[1:2000,4] <- 115
# Approximate locations as factors
dest   <- factor(sprintf("%.2f:%.2f",flights[,3], flights[,4]))

# A table of destination frequencies
freq <- sort(table(dest), decreasing=TRUE)

# The most frequent destinations in these data, possibly hub airports?
frequent_destinations <- names(freq)[1:10]

# Subset the flight data by destination frequency
idx <- dest %in% frequent_destinations
frequent_flights <- flights[idx, ]

earth <- "http://eoimages.gsfc.nasa.gov/images/imagerecords/73000/73909/world.topo.bathy.200412.3x5400x2700.jpg"
m = globejs(img=earth, 
            arcs=frequent_flights,
            arcsHeight=0.4, arcsLwd=3, arcsColor="#ff8100", arcsOpacity=0.15,
            atmosphere=TRUE, bg = "white")

SaveWidget(m, 'globe')

###############################################################################
## @knitr datatable1
library(DT)


fruta <- read.csv(file = paste0(wd, "/assets/database/frutas.csv"))
fruta <- as.data.frame(fruta)

dt1 <- datatable(fruta)

SaveWidget(dt1, 'dt1')

################################################################################
## @knitr dygraphs1
library(dygraphs)
lungDeaths <- cbind(mdeaths, fdeaths)
dyex1 <- dygraph(lungDeaths)

SaveWidget(dyex1, 'dygraphs1')

################################################################################
# @knitr dygraphs2
library(dygraphs)
dyex2 <- dygraph(nhtemp, main = "População de ratos") %>% 
  dyRangeSelector(dateWindow = c("1920-01-01", "1960-01-01"))

SaveWidget(dyex2, 'dygraphs2')

################################################################################
## @knitr dygraphs3
dyex3 <- dygraph(lungDeaths) %>%
  dySeries("mdeaths", label = "Male") %>%
  dySeries("fdeaths", label = "Female") %>%
  dyOptions(stackedGraph = TRUE) %>%
  dyRangeSelector(height = 20)

SaveWidget(dyex3, 'dygraphs3')

################################################################################
## @knitr dygraphs4
hw <- HoltWinters(ldeaths)
predicted <- predict(hw, n.ahead = 72, prediction.interval = TRUE)

dyex4 <- dygraph(predicted, main = "Predicted Lung Deaths (UK)") %>%
  dyAxis("x", drawGrid = FALSE) %>%
  dySeries(c("lwr", "fit", "upr"), label = "Deaths") %>%
  dyOptions(colors = RColorBrewer::brewer.pal(3, "Set1")) %>%
  dyRoller(rollPeriod = 5)

SaveWidget(dyex4, 'dygraphs4')

################################################################################
## @knitr metricsgraphics1
library(htmltools)
library(htmlwidgets)
library(metricsgraphics)
library(RColorBrewer)

tmp <- data.frame(year=seq(1790, 1970, 10), uspop=as.numeric(uspop))

mg1 <- tmp %>%
  mjs_plot(x=year, y=uspop, height = 450, width = 650) %>%
  mjs_line() %>%
  mjs_add_marker(1850, "Something Wonderful") %>%
  mjs_add_baseline(150, "Something Awful")

SaveWidget(mg1, 'metricsgraphics1')

################################################################################
## @knitr metricsgraphics2
mg2 <- tmp %>%
  mjs_plot(x=uspop, y=year, width=500, height=400) %>%
  mjs_bar() %>%
  mjs_axis_x(xax_format = 'plain')

SaveWidget(mg2, 'metricsgraphics2')

################################################################################
## @knitr metricsgraphics3
mg3 <- mtcars %>%
  mjs_plot(x=wt, y=mpg, width=750, height=450) %>%
  mjs_point(color_accessor=carb, size_accessor=carb) %>%
  mjs_labs(x="Weight of Car", y="Miles per Gallon")

SaveWidget(mg3, 'metricsgraphics3')

################################################################################
## @knitr metricsgraphics4
mg4 <- mtcars %>%
  mjs_plot(x=wt, y=mpg, width=750, height=450) %>%
  mjs_point(color_accessor=cyl,
            x_rug=TRUE, y_rug=TRUE,
            size_accessor=carb,
            size_range=c(5, 10),
            color_type="category",
            color_range=brewer.pal(n=11, name="RdBu")[c(1, 5, 11)]) %>%
  mjs_labs(x="Weight of Car", y="Miles per Gallon") %>%
  mjs_add_legend(legend="X")

SaveWidget(mg4, 'metricsgraphics4')

################################################################################
## @knitr metricsgraphics5
mg5 <- mtcars %>%
  mjs_plot(x=wt, y=mpg, width=700, height=450) %>%
  mjs_point(least_squares=TRUE) %>%
  mjs_labs(x="Weight of Car", y="Miles per Gallon")

SaveWidget(mg5, 'metricsgraphics5')

################################################################################
## @knitr metricsgraphics6
set.seed(1492)
stocks <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4))

mg6 <- stocks %>%
  mjs_plot(x=time, y=X, height = 400, width = 750) %>%
  mjs_line() %>%
  mjs_add_line(Y) %>%
  mjs_add_line(Z) %>%
  mjs_axis_x(xax_format="date") %>%
  mjs_add_legend(legend=c("X", "Y", "Z"))

SaveWidget(mg6, 'metricsgraphics6')

################################################################################
## @knitr metricsgraphics7
stocks2 <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4))

s1 <- stocks %>%
  mjs_plot(x=time, y=X, linked=TRUE, width=350, height=275) %>%
  mjs_line() %>%
  mjs_add_line(Y) %>%
  mjs_add_line(Z) %>%
  mjs_axis_x(xax_format="date") %>%
  mjs_add_legend(legend=c("X", "Y", "Z"))

s2 <- stocks2 %>%
  mjs_plot(x=time, y=X, linked=TRUE, width=350, height=275) %>%
  mjs_line() %>%
  mjs_add_line(Y) %>%
  mjs_add_line(Z) %>%
  mjs_axis_x(xax_format="date") %>%
  mjs_add_legend(legend=c("X", "Y", "Z"))

mjs_grid(s1, s2, ncol=2)

################################################################################
## @knitr networkD31
library(networkD3)
src <-    c("Malaria","Mosquito", "DDT",  "Insetos", "Insetos", "Lagartixas", "Gatos", "Ratos", "Ratos", "Pulgas")
target <- c("Mosquito", "DDT", "Insetos", "peixes", "Lagartixas", "Gatos", "Ratos", "Pulgas", "Telhados", "Peste Negra")
networkData <- data.frame(src, target)
nw1 <- simpleNetwork(Data = networkData, 
                     fontSize = 20, 
                     linkDistance = 100, 
                     zoom = TRUE,
                     charge = -1000)

SaveWidget(nw1, 'networkD31')

################################################################################
## @knitr threejs1
library(threejs)
z <- seq(-10, 10, 0.01)
x <- cos(z)
y <- sin(z)
threejs1 <- scatterplot3js(x,y,z, color=rainbow(length(z)))

SaveWidget(threejs1, 'threejs1')

###############################################################################
## @knitr threejs2
N <- 100
i <- sample(3, N, replace=TRUE)
x <- matrix(rnorm(N*3),ncol=3)
lab <- c("small", "bigger", "biggest")
threejs2 <- scatterplot3js(x, color=rainbow(N), labels=lab[i], size=i, renderer="canvas")

SaveWidget(threejs2, 'threejs2')

################################################################################
## @knitr diagrammer1
library(DiagrammeR)
dg1 <- grViz("
             digraph {
             layout = twopi
             node [shape = circle]
             A -> {B C D} 
             }", height = 400, width = 700)

SaveWidget(dg1, 'diagrammer1.')

###############################################################################
## @knitr diagrammer2
boxes_and_circles <- "
digraph boxes_and_circles {

# several 'node' statements
node [shape = box,
fontname = Helvetica]
A; B; C; D; E; F

node [shape = circle,
fixedsize = true,
width = 0.9] // sets as circles
1; 2; 3; 4; 5; 6; 7; 8

# several 'edge' statements
A->1; B->2; B->3; B->4; C->A
1->D; E->A; 2->4; 1->5; 1->F
E->6; 4->6; 5->7; 6->7; 3->8

# a 'graph' statement
graph [overlap = true, fontsize = 10]
}
"
dg2 <- grViz(boxes_and_circles, engine = "circo", height = 400, width = 700)

SaveWidget(dg2, 'diagrammer2')

################################################################################
## Finalizacao das rotinas

# Retorna diretorio de trabalho
setwd(wd)
