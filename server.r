# server.R
library(shiny)
# We put here all load for performance reasons.
#Nevertheless the load blocks the app a few seconds
moocs <- read.csv("./data/HMXPC13_DI_v2_5-14-14.csv" ,header=TRUE, sep=",");
# We keep only information from users that have obtained a certificate of completion
data <- moocs[certified == "1",]
# Variable for selecting courses
courses <- data$course_id
# Variable for range of studies
studies <- data$LoE_DI

shinyServer(function(input, output) {

  output$left <- renderText({ 
    "Bienvenido! Este es el panel de control. Aquí puedes configurar
    las opciones de visualización de los datos."
  })
  
  output$LoEPlot <- renderPlot({
    colors = c("red", "yellow", "green", "violet","orange", "blue")
    barplot(table(studies),main="Nº de certificados atendiendo al nivel de estudios", 
            beside=TRUE, # Separar las categorias en varias barras 
            col=colors, # We set some colors
            names.arg=c("Missing","Bachelor's","Doctorate","< Secondary", "Master's", "Secondary"))
  })
  
  # For rendering based on selection
  # plotType <- function(x, type) {
  #  switch(type,
  #         A = hist(x),
  #         B = barplot(x),
  #         C = pie(x))
  #}

})