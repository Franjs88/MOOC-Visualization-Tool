library(shiny)

shinyUI(navbarPage("MOOC Visualization Tool", inverse=TRUE,
  tabPanel("By Level of education",
    #Left Sidebar
    sidebarLayout(
      sidebarPanel(
        textOutput("leftEd"), br(), br(),
        radioButtons("radioEd", label=NULL,
                     choices = list("Registered" = 1, "Certified" = 2), 
                     selected = 1)
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
        textOutput("leftAge"),  br(), br(),
        radioButtons("radioAge", label=NULL,
                     choices = list("Registered" = 1, "Certified" = 2), 
                     selected = 1)
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
               textOutput("leftGender"),  br(), br(),
               radioButtons("radioGender", label=NULL,
                            choices = list("Registered" = 1, "Certified" = 2), 
                            selected = 1)
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
               fluidRow(
                 column(2,
                        textOutput("leftCountry"), br(), br(),
                        radioButtons("radioCountry", label=NULL,
                                     choices = list("Registered" = 1, "Certified" = 2), 
                                     selected = 1)
                 ),
                 column(10,
                        plotOutput("CountryPlot")
                 )
               )
             )  
           )
  )