library(shiny)

shinyUI(fluidPage(
  
  titlePanel("MOOC Visualization Tool"),
  
  #Left Sidebar
  sidebarLayout(
    sidebarPanel(
        textOutput("Left sidebar")
    ),
  
    # Center with the content
    mainPanel(
      textOutput("Hola Mundo")
    )
  )
))