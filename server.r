# server.R
library(shiny)
library(rworldmap)
library(countrycode)

# We put here all load for performance reasons.
#Nevertheless the load blocks the app a few seconds
moocs <- read.csv("./data/HMXPC13_DI_v2_5-14-14.csv" ,header=TRUE, sep=",");

data <- moocs[moocs$registered == "1",]

# Adding courses list.
course_id <- unique(data$course_id)

shinyServer(function(input, output) {

  output$leftEd <- renderText({ 
    "Bienvenido! Este es el panel de control. Aquí puedes configurar
    las opciones de visualización de los datos.\n"
  })
  
  output$leftAge <- renderText({ 
    "Bienvenido! Este es el panel de control. Aquí puedes configurar
    las opciones de visualización de los datos.\n"
  })
  
  output$leftGender <- renderText({ 
    "Bienvenido! Este es el panel de control. Aquí puedes configurar
    las opciones de visualización de los datos.\n"
  })
  
  output$leftCountry <- renderText({ 
    "Bienvenido! Este es el panel de control. Aquí puedes configurar
    las opciones de visualización de los datos.\n"
  })
  
  # Visualization by Level of Education
  output$LoEPlot <- renderPlot({
    if(input$radioEd == "2") {
      # We keep only information from users that have obtained a certificate of completion
      data <- moocs[moocs$certified == "1",]
    } else {
      data <- moocs[moocs$registered == "1",]
    }
    
    switch(input$selectEd,
           "1" = (data <- data[data$registered == "1",]),
           "2" = (data <- data[data$course_id == course_id[1],]),
           "3" = (data <- data[data$course_id == course_id[2],]),
           "4" = (data <- data[data$course_id == course_id[3],]),
           "5" = (data <- data[data$course_id == course_id[4],]),
           "6" = (data <- data[data$course_id == course_id[5],]),
           "7" = (data <- data[data$course_id == course_id[6],]),
           "8" = (data <- data[data$course_id == course_id[7],]),
           "9" = (data <- data[data$course_id == course_id[8],]),
           "10" = (data <- data[data$course_id == course_id[9],]),
           "11" = (data <- data[data$course_id == course_id[10],]),
           "12" = (data <- data[data$course_id == course_id[11],]),
           "13" = (data <- data[data$course_id == course_id[12],]),
           "14" = (data <- data[data$course_id == course_id[13],]),
           "15" = (data <- data[data$course_id == course_id[14],]),
           "16" = (data <- data[data$course_id == course_id[15],]),
           "17" = (data <- data[data$course_id == course_id[16],])
    )
    
    # Variable for range of studies
    studies <- data$LoE_DI
    
    colors = c("red", "yellow", "green", "violet","orange", "blue")
    barplot(table(studies),main="Nº de certificados atendiendo al nivel de estudios", 
            beside=TRUE, # Separar las categorias en varias barras 
            col=colors, # We set some colors
            names.arg=c("Missing","Bachelor's","Doctorate","< Secondary", "Master's", "Secondary"))
  })
  
  # Visualization by age
  output$AgePlot <- renderPlot({
    if(input$radioAge == "2") {
      # We keep only information from users that have obtained a certificate of completion
      data <- moocs[moocs$certified == "1",]
    } else {
      data <- moocs[moocs$registered == "1",]
    }
    
    switch(input$selectAge,
           "1" = (data <- data[data$registered == "1",]),
           "2" = (data <- data[data$course_id == course_id[1],]),
           "3" = (data <- data[data$course_id == course_id[2],]),
           "4" = (data <- data[data$course_id == course_id[3],]),
           "5" = (data <- data[data$course_id == course_id[4],]),
           "6" = (data <- data[data$course_id == course_id[5],]),
           "7" = (data <- data[data$course_id == course_id[6],]),
           "8" = (data <- data[data$course_id == course_id[7],]),
           "9" = (data <- data[data$course_id == course_id[8],]),
           "10" = (data <- data[data$course_id == course_id[9],]),
           "11" = (data <- data[data$course_id == course_id[10],]),
           "12" = (data <- data[data$course_id == course_id[11],]),
           "13" = (data <- data[data$course_id == course_id[12],]),
           "14" = (data <- data[data$course_id == course_id[13],]),
           "15" = (data <- data[data$course_id == course_id[14],]),
           "16" = (data <- data[data$course_id == course_id[15],]),
           "17" = (data <- data[data$course_id == course_id[16],])
    )
    
    # Years of students (we traduce year of birth to age)
    years <- 2014 - data$YoB
    # By Age
    categories <- c(10,18,25,30,35,45,55,65,80,90)
    agecat <- cut(years, categories)
    
    colors = c("red", "yellow", "green", "violet","orange", "blue","cyan","grey","pink")
    barplot(table(agecat),main="Nº de certificados atendiendo a la edad", 
            beside=TRUE, # Separar las categorias en varias barras 
            col=colors, # We set some colors
            names.arg=c("10-18","18-25","25-30","30-35", "35-45", "45-55","55-65","65-80","80-90"))
  })
  
  # Visualization by genre
  output$GenderPlot <- renderPlot({
    if(input$radioGender == "2") {
      # We keep only information from users that have obtained a certificate of completion
      data <- moocs[moocs$certified == "1",]
    } else {
      data <- moocs[moocs$registered == "1",]
    }
    
    switch(input$selectGender,
           "1" = (data <- data[data$registered == "1",]),
           "2" = (data <- data[data$course_id == course_id[1],]),
           "3" = (data <- data[data$course_id == course_id[2],]),
           "4" = (data <- data[data$course_id == course_id[3],]),
           "5" = (data <- data[data$course_id == course_id[4],]),
           "6" = (data <- data[data$course_id == course_id[5],]),
           "7" = (data <- data[data$course_id == course_id[6],]),
           "8" = (data <- data[data$course_id == course_id[7],]),
           "9" = (data <- data[data$course_id == course_id[8],]),
           "10" = (data <- data[data$course_id == course_id[9],]),
           "11" = (data <- data[data$course_id == course_id[10],]),
           "12" = (data <- data[data$course_id == course_id[11],]),
           "13" = (data <- data[data$course_id == course_id[12],]),
           "14" = (data <- data[data$course_id == course_id[13],]),
           "15" = (data <- data[data$course_id == course_id[14],]),
           "16" = (data <- data[data$course_id == course_id[15],]),
           "17" = (data <- data[data$course_id == course_id[16],])
    )
    
    #By gender
    gender <- table(data$gender)
    genderpercent <- gender/sum(gender)*100
    labels <- c("Missing","Female","Male","Other")
    genderpercent <- round(genderpercent, digits=0)
    labels <- paste(labels, genderpercent)
    labels <- paste(labels,"%",sep="") # ad % to labels
    
    pie(table(data$gender), labels = labels, 
        main="Nº de certificados atendiendo al género", 
        col=rainbow(length(labels)) # We set some colors
        )
  })
  
  # Visualization by country
  output$CountryPlot <- renderPlot({
    if(input$radioCountry == "2") {
      # We keep only information from users that have obtained a certificate of completion
      data <- moocs[moocs$certified == "1",]
    } else {
      data <- moocs[moocs$registered == "1",]
    }
    
    switch(input$selectCountry,
           "1" = (data <- data[data$registered == "1",]),
           "2" = (data <- data[data$course_id == course_id[1],]),
           "3" = (data <- data[data$course_id == course_id[2],]),
           "4" = (data <- data[data$course_id == course_id[3],]),
           "5" = (data <- data[data$course_id == course_id[4],]),
           "6" = (data <- data[data$course_id == course_id[5],]),
           "7" = (data <- data[data$course_id == course_id[6],]),
           "8" = (data <- data[data$course_id == course_id[7],]),
           "9" = (data <- data[data$course_id == course_id[8],]),
           "10" = (data <- data[data$course_id == course_id[9],]),
           "11" = (data <- data[data$course_id == course_id[10],]),
           "12" = (data <- data[data$course_id == course_id[11],]),
           "13" = (data <- data[data$course_id == course_id[12],]),
           "14" = (data <- data[data$course_id == course_id[13],]),
           "15" = (data <- data[data$course_id == course_id[14],]),
           "16" = (data <- data[data$course_id == course_id[15],]),
           "17" = (data <- data[data$course_id == course_id[16],])
    )
  
    #By Country
    dataf <- table(data$final_cc_cname_DI)
    Countries <- as.data.frame(dataf)
    Countries[1] <- countrycode(Countries$Var1,"country.name", "iso3c")
    sPDF <- joinCountryData2Map(Countries, joinCode = "NAME", nameJoinColumn = "Var1")
    
    par(mai=c(0,0,0.3,0),xaxs="i",yaxs="i")
    
    # creating a user defined palette
    op <- palette(c('green','yellow','orange','red'))
    
    # find quartile breaks
    cutVector <- quantile(sPDF@data[["Freq"]], na.rm=TRUE)
    
    # classify the data to a factor
    sPDF@data[["FreqCategories"]] <- cut(sPDF@data[["Freq"]], cutVector, include.lowest=TRUE)
    
    # rename the categories
    levels(sPDF@data[["FreqCategories"]]) <- c('low', 'medium', 'high', 'very_high')
    
    #mapping
    mapCountryData(sPDF, nameColumnToPlot="FreqCategories",
                                mapTitle="Nº de alumnos certificados atendiendo al País",
                                colourPalette="palette", addLegend=TRUE,
                                oceanCol='lightblue',
                                missingCountryCol='white'
                                )
  })
  
  

})