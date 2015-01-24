library(shiny)

shinyUI(navbarPage("MOOC Visualization Tool", inverse=FALSE,
  tabPanel("By Level of education",
    #Left Sidebar
    sidebarLayout(
      sidebarPanel(
        textOutput("leftEd")
      ),
      # Center with the content
      mainPanel(
        fluidRow(
          column(12,
            plotOutput("LoEPlot")
          )
        )
      )
    )
  ),
  tabPanel("By age",
    #Left sidebar
    sidebarLayout(
      sidebarPanel(
        textOutput("left")  
      ),
      # Center with the content
      mainPanel(
        fluidRow(
          column(12,
                 #textOutput("leftAge")
                 plotOutput("AgePlot")
          )
        )
      )  
    )
)))