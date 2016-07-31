---
title       : ShowR
subtitle    : A história da estória
author      : João B. G. Brito
job         : SINAPE 2016
framework   : io2012        
highlighter : highlight.js  
hitheme     : tomorrow      
widgets     : [mathjax, quiz, bootstrap, interactive, mathjax]
ext_widgets : {rCharts: [libraries/nvd3, libraries/leaflet, libraries/dygraphs]}
mode        : selfcontained 
knit        : slidify::knit2slides
logo        : logo_SINAPE.png
biglogo     : logo_ShowR.png
assets      : {assets: ./assets}
github      : 
        user: ShowR
        repo: SINAPE2016
license     : UseRS
--- .segue bg:black

# Em 1960, na ilha de Borneo...



--- .class #id

## O povo Dayak 

<iframe src="./assets/widgets/borneo.html" width=100% height=100% allowtransparency="true"> </iframe>

--- .class #id

## Monitorava o plantio

<iframe src="./assets/widgets/dt1.html" width=100% height=100% allowtransparency="true"> </iframe>

--- .class #id

## Vivia feliz com o lucro das bananas

<div align="center">

  <!-- MotionChart generated in R 3.3.0 by googleVis 0.6.0 package -->
  <!-- Sun Jul 31 22:02:23 2016 -->
  
  
  <!-- jsHeader -->
  <script type="text/javascript">
   
  // jsData 
  function gvisDataMotionChartID8b064e81812 () {
  var data = new google.visualization.DataTable();
  var datajson =
  [
   [
   "Bergamota",
  1958,
  1,
  100,
  40,
  60 
  ],
  [
   "Laranjas",
  1958,
  2,
  130,
  120,
  10 
  ],
  [
   "Bananas",
  1958,
  3,
  160,
  90,
  70 
  ],
  [
   "Bergamota",
  1959,
  4,
  111,
  30,
  81 
  ],
  [
   "Laranjas",
  1959,
  5,
  140,
  78,
  62 
  ],
  [
   "Bananas",
  1959,
  6,
  193,
  46,
  147 
  ],
  [
   "Bergamota",
  1960,
  7,
  132,
  35,
  97 
  ],
  [
   "Laranjas",
  1960,
  8,
  167,
  59,
  108 
  ],
  [
   "Bananas",
  1960,
  9,
  315,
  78,
  237 
  ] 
  ];
  data.addColumn('string','Fruta');
  data.addColumn('number','Ano');
  data.addColumn('number','X');
  data.addColumn('number','Vendas');
  data.addColumn('number','Gasto');
  data.addColumn('number','Lucro');
  data.addRows(datajson);
  return(data);
  }
   
  // jsDrawChart
  function drawChartMotionChartID8b064e81812() {
  var data = gvisDataMotionChartID8b064e81812();
  var options = {};
  options["width"] = [600];
  options["height"] = [500];
  options["state"] = [""];
  
      var chart = new google.visualization.MotionChart(
      document.getElementById('MotionChartID8b064e81812')
      );
      chart.draw(data,options);
      
  
  }
    
   
  // jsDisplayChart
  (function() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  var chartid = "motionchart";
    
  // Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
  var i, newPackage = true;
  for (i = 0; newPackage && i < pkgs.length; i++) {
  if (pkgs[i] === chartid)
  newPackage = false;
  }
  if (newPackage)
    pkgs.push(chartid);
    
  // Add the drawChart function to the global list of callbacks
  callbacks.push(drawChartMotionChartID8b064e81812);
  })();
  function displayChartMotionChartID8b064e81812() {
    var pkgs = window.__gvisPackages = window.__gvisPackages || [];
    var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
    window.clearTimeout(window.__gvisLoad);
    // The timeout is set to 100 because otherwise the container div we are
    // targeting might not be part of the document yet
    window.__gvisLoad = setTimeout(function() {
    var pkgCount = pkgs.length;
    google.load("visualization", "1", { packages:pkgs, callback: function() {
    if (pkgCount != pkgs.length) {
    // Race condition where another setTimeout call snuck in after us; if
    // that call added a package, we must not shift its callback
    return;
  }
  while (callbacks.length > 0)
  callbacks.shift()();
  } });
  }, 100);
  }
   
  // jsFooter
  </script>
   
  <!-- jsChart -->  
  <script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartMotionChartID8b064e81812"></script>
   
  <!-- divChart -->
    
  <div id="MotionChartID8b064e81812" 
    style="width: 600; height: 500;">
  </div>
</div>

--- .segue bg:black

## Entaum...

--- &checkbox

## As pessoas estavam adoecendo...

1. _Febre_
2. _Dores_
3. _Muitos mosquitos_

*** .hint

Malaria!!

*** .explanation

<img class=center
src=assets/img/ciclo_malaria.png> 

--- .class #id

## Pediram ajuda

<img class=center
  src=assets/img/DayakToWHO_1.png width=750px>

> - Problema resolvido!! 

--- .segue bg:black

## Soh que naum...

---  &checkbox

## Outros problemas apareceram

1. _Cai telhado_
2. _Morrem peixes_
3. _Peste-negra_

---  &multitext

## O que fazer?

1. Quem vai nos ajudar?

*** .explanation

1. <span class='answer'>"Ligar para OMS"</span>

--- .class #id

## A OMS analisou o caso

<iframe src="./assets/widgets/dygraphs2.html" width=100% height=100% allowtransparency="true"> </iframe>

--- .class #id

## Verificou o aumento da temperatura

<iframe src="./assets/widgets/threejs1.html" width=100% height=100% allowtransparency="true"> </iframe>

--- .class #id

## Apurou outros elementos

<iframe src="./assets/widgets/threejs2.html" width=100% height=100% allowtransparency="true"> </iframe>

--- .class #id

## Impacto na cadeia ambiental

<iframe src="./assets/widgets/networkD31.html" width=200% height=200% allowtransparency="true"> </iframe>

--- .class #id

## Cadeia de eventos

<img class=center
src=assets/img/cadeia.gif> 

--- .class #id

## Operation Cat Drop

<img class=center
src=assets/img/OperationCatDrop.png width=80% height=80%> 

--- .class #id

## 14 mil gatos do mundo todo

<iframe src="./assets/widgets/globe.html" width=100% height=100% allowtransparency="true"> </iframe>

--- .segue bg:black

# E agora

--- .class #id

<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSefoxiOgxnek6KEQUd4rg3MhtWK9ZB707EypLJheZlITK9VCQ/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Carregando.</iframe>

