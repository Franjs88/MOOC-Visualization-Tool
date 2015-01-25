library(shiny)

shinyUI(navbarPage("MOOC Visualization Tool", inverse=TRUE,
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
        textOutput("leftAge")  
      ),
      # Center with the content
      mainPanel(
        fluidRow(
          column(12,
                 plotOutput("AgePlot")
          )
        )
      )  
    )
  ),
  tabPanel("By gender",
           #Left sidebar
           sidebarLayout(
             sidebarPanel(
               textOutput("leftGender")  
             ),
             # Center with the content
             mainPanel(
               fluidRow(
                 column(12,
                        plotOutput("GenderPlot")
                 )
               )
             )  
           )
  ),
  tabPanel("By Country",
           #Left sidebar
           sidebarLayout(
             sidebarPanel(
               textOutput("leftCountry")  
             ),
             # Center with the content
             mainPanel(
               fluidRow(
                 column(12,
                        plotOutput("CountryPlot")
                 )
               )
             )  
           )
  )
))