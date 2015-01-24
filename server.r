library(shiny)

shinyServer(function(input, output) {
  moocs <- read.csv("./HMXPC13_DI_v2_5-14-14.csv" ,header=TRUE, sep=",");
  
  # Variable for selecting courses
  courses <- moocs$course_id
  
  # Variable for range of studies
  studies <- moocs$LoE_DI
  
  # t1 <- table(studies, courses) # Count ocurrences of level of studies per course
  # t2 <- table(studies)          # Count ocurrences of level of studies in all courses
  
  # For rendering based on selection
  #plotType <- function(x, type) {
  #  switch(type,
  #         A = hist(x),
  #         B = barplot(x),
  #         C = pie(x))
  #}
  
  output$left <- renderText({ 
    "Bienvenido! Este es el panel de control. Aquí puedes configurar
    las opciones de visualización de los datos."
  })
    
  output$graphName <- renderText({ 
    "% de certificados atendiendo al genero"
  })
    
  #output$genderPlot <- renderPlot({
  #  x    <- moocs[] # MOOCs dataset #####OLD #faithful[, 2]  # Old Faithful Geyser data
  #  bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
  #  hist(x, breaks = bins, col = 'darkgray', border = 'white')
  #})

})