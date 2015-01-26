library(shiny)

shinyUI(navbarPage("MOOC Visualization Tool", inverse=TRUE,
  tabPanel("By Level of education",
    #Left Sidebar
    sidebarLayout(
      sidebarPanel(
        selectInput("selectEd", label= h5("Filter by course"),
                    choices = list("All courses" = 1,
                                   "CB22x, The Ancient Greek Hero (Launched Spring, 2013)" = 2,
                                   "CS50x, Introduction to Computer Science (Launched Fall, 2012)" = 3,
                                   "ER22x, Justice (Launched Spring, 2013)" = 4,
                                   "PH207x, Health in Numbers: Quantitative Methods in Clinical & Public Health Research (Launched Fall, 2012)" = 5,
                                   "PH278x, Human Health and Global Environmental Change (Launched Spring, 2013)" = 6,
                                   "6.002x, Circuits and Electronics (Launched Fall, 2012)" = 7,
                                   "6.002x, Circuits and Electronics (Launched Spring, 2013)" = 8,
                                   "14.73x, The Challenges of Global Poverty (Launched Spring, 2013)" = 9,
                                   "2.01x, Elements of Structures (Launched Spring, 2013)" = 10,
                                   "3.091x, Introduction to Solid State Chemistry (Launched Fall, 2012)" = 11,
                                   "3.091x, Introduction to Solid State Chemistry (Launched Spring, 2013)" = 12,
                                   "6.00x, Introduction to Computer Science Programming (Launched Fall, 2012)" = 13,
                                   "6.00x, Introduction to Computer Science Programming (Launched Spring, 2013)" = 14,
                                   "7.00x, Introduction to Biology - The Secret of Life (Launched Spring, 2013)" = 15,
                                   "8.02x, Electricity and Magnetism (Launched Spring, 2013)" = 16,
                                   "8.MReV, Mechanics ReView (Launched Summer, 2013)" = 17)), br(), br(),
        textOutput("leftEd"), br(), br(),
        radioButtons("radioEd", label="Select a certain type of users",
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
        selectInput("selectAge", label= h5("Filter by course"),
                    choices = list("All courses" = 1,
                                   "CB22x, The Ancient Greek Hero (Launched Spring, 2013)" = 2,
                                   "CS50x, Introduction to Computer Science (Launched Fall, 2012)" = 3,
                                   "ER22x, Justice (Launched Spring, 2013)" = 4,
                                   "PH207x, Health in Numbers: Quantitative Methods in Clinical & Public Health Research (Launched Fall, 2012)" = 5,
                                   "PH278x, Human Health and Global Environmental Change (Launched Spring, 2013)" = 6,
                                   "6.002x, Circuits and Electronics (Launched Fall, 2012)" = 7,
                                   "6.002x, Circuits and Electronics (Launched Spring, 2013)" = 8,
                                   "14.73x, The Challenges of Global Poverty (Launched Spring, 2013)" = 9,
                                   "2.01x, Elements of Structures (Launched Spring, 2013)" = 10,
                                   "3.091x, Introduction to Solid State Chemistry (Launched Fall, 2012)" = 11,
                                   "3.091x, Introduction to Solid State Chemistry (Launched Spring, 2013)" = 12,
                                   "6.00x, Introduction to Computer Science Programming (Launched Fall, 2012)" = 13,
                                   "6.00x, Introduction to Computer Science Programming (Launched Spring, 2013)" = 14,
                                   "7.00x, Introduction to Biology - The Secret of Life (Launched Spring, 2013)" = 15,
                                   "8.02x, Electricity and Magnetism (Launched Spring, 2013)" = 16,
                                   "8.MReV, Mechanics ReView (Launched Summer, 2013)" = 17)), br(), br(),
        textOutput("leftAge"),  br(), br(),
        radioButtons("radioAge", label="Select a certain type of users",
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
               selectInput("selectGender", label= h5("Filter by course"),
                           choices = list("All courses" = 1,
                                          "CB22x, The Ancient Greek Hero (Launched Spring, 2013)" = 2,
                                          "CS50x, Introduction to Computer Science (Launched Fall, 2012)" = 3,
                                          "ER22x, Justice (Launched Spring, 2013)" = 4,
                                          "PH207x, Health in Numbers: Quantitative Methods in Clinical & Public Health Research (Launched Fall, 2012)" = 5,
                                          "PH278x, Human Health and Global Environmental Change (Launched Spring, 2013)" = 6,
                                          "6.002x, Circuits and Electronics (Launched Fall, 2012)" = 7,
                                          "6.002x, Circuits and Electronics (Launched Spring, 2013)" = 8,
                                          "14.73x, The Challenges of Global Poverty (Launched Spring, 2013)" = 9,
                                          "2.01x, Elements of Structures (Launched Spring, 2013)" = 10,
                                          "3.091x, Introduction to Solid State Chemistry (Launched Fall, 2012)" = 11,
                                          "3.091x, Introduction to Solid State Chemistry (Launched Spring, 2013)" = 12,
                                          "6.00x, Introduction to Computer Science Programming (Launched Fall, 2012)" = 13,
                                          "6.00x, Introduction to Computer Science Programming (Launched Spring, 2013)" = 14,
                                          "7.00x, Introduction to Biology - The Secret of Life (Launched Spring, 2013)" = 15,
                                          "8.02x, Electricity and Magnetism (Launched Spring, 2013)" = 16,
                                          "8.MReV, Mechanics ReView (Launched Summer, 2013)" = 17)),  br(), br(),
               textOutput("leftGender"),  br(), br(),
               radioButtons("radioGender", label="Select a certain type of users",
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
           fluidRow(
           column(4,
                  selectInput("selectCountry", label= h5("Filter by course"),
                              choices = list("All courses" = 1,
                                             "CB22x, The Ancient Greek Hero (Launched Spring, 2013)" = 2,
                                             "CS50x, Introduction to Computer Science (Launched Fall, 2012)" = 3,
                                             "ER22x, Justice (Launched Spring, 2013)" = 4,
                                             "PH207x, Health in Numbers: Quantitative Methods in Clinical & Public Health Research (Launched Fall, 2012)" = 5,
                                             "PH278x, Human Health and Global Environmental Change (Launched Spring, 2013)" = 6,
                                             "6.002x, Circuits and Electronics (Launched Fall, 2012)" = 7,
                                             "6.002x, Circuits and Electronics (Launched Spring, 2013)" = 8,
                                             "14.73x, The Challenges of Global Poverty (Launched Spring, 2013)" = 9,
                                             "2.01x, Elements of Structures (Launched Spring, 2013)" = 10,
                                             "3.091x, Introduction to Solid State Chemistry (Launched Fall, 2012)" = 11,
                                             "3.091x, Introduction to Solid State Chemistry (Launched Spring, 2013)" = 12,
                                             "6.00x, Introduction to Computer Science Programming (Launched Fall, 2012)" = 13,
                                             "6.00x, Introduction to Computer Science Programming (Launched Spring, 2013)" = 14,
                                             "7.00x, Introduction to Biology - The Secret of Life (Launched Spring, 2013)" = 15,
                                             "8.02x, Electricity and Magnetism (Launched Spring, 2013)" = 16,
                                             "8.MReV, Mechanics ReView (Launched Summer, 2013)" = 17))
                  ),
           column(8,
            plotOutput("CountryPlot")    
                  )
             ),
           fluidRow(
            column(8, textOutput("leftCountry")),
            column(4, radioButtons("radioCountry", label="Select a certain type of users",
                                     choices = list("Registered" = 1, "Certified" = 2), 
                                     selected = 1))
            )
        )
   )
 )  