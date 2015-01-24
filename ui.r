library(shiny)

shinyUI(navbarPage("MOOC Visualization Tool", inverse=FALSE,
  tabPanel("Level of education",
    #Left Sidebar
    sidebarLayout(
      sidebarPanel(
        textOutput("left")
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
  tabPanel("Genre comparation"
  )
))