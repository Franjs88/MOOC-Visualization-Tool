# server.R
library(shiny)
library(rworldmap)
library(countrycode)
# We put here all load for performance reasons.
#Nevertheless the load blocks the app a few seconds

# Variable for range of studies
studies <- data$LoE_DI
# Years of students (we traduce year of birth to age)
years <- 2014 - data$YoB

# By Age
categories <- c(10,18,25,30,35,45,55,65,80,90)
agecat <- cut(years, categories)
table(agecat)

#By gender
gender <- table(data$gender)
genderpercent <- gender/sum(gender)*100
labels <- c("Missing","Female","Male","Other")
genderpercent <- round(genderpercent, digits=0)
labels <- paste(labels, genderpercent)
labels <- paste(labels,"%",sep="") # ad % to labels

#By Country
dataf <- table(data$final_cc_cname_DI)
Countries <- as.data.frame(dataf)
Countries[1] <- countrycode(Countries$Var1,"country.name", "iso3c")
sPDF <- joinCountryData2Map(Countries, joinCode = "NAME", nameJoinColumn = "Var1")

shinyServer(function(input, output) {

  output$leftEd <- renderText({ 
    "Bienvenido! Este es el panel de control. Aquí puedes configurar
    las opciones de visualización de los datos."
  })
  
  output$leftAge <- renderText({ 
    "Bienvenido! Este es el panel de control. Aquí puedes configurar
    las opciones de visualización de los datos."
  })
  
  output$leftGender <- renderText({ 
    "Bienvenido! Este es el panel de control. Aquí puedes configurar
    las opciones de visualización de los datos."
  })
  
  output$leftCountry <- renderText({ 
    "Bienvenido! Este es el panel de control. Aquí puedes configurar
    las opciones de visualización de los datos."
  })
  
  # Visualization by Level of Education
  output$LoEPlot <- renderPlot({
    colors = c("red", "yellow", "green", "violet","orange", "blue")
    barplot(table(studies),main="Nº de certificados atendiendo al nivel de estudios", 
            beside=TRUE, # Separar las categorias en varias barras 
            col=colors, # We set some colors
            names.arg=c("Missing","Bachelor's","Doctorate","< Secondary", "Master's", "Secondary"))
  })
  
  # Visualization by age
  output$AgePlot <- renderPlot({
    colors = c("red", "yellow", "green", "violet","orange", "blue","cyan","grey","pink")
    barplot(table(agecat),main="Nº de certificados atendiendo a la edad", 
            beside=TRUE, # Separar las categorias en varias barras 
            col=colors, # We set some colors
            names.arg=c("10-18","18-25","25-30","30-35", "35-45", "45-55","55-65","65-80","80-90"))
  })
  
  # Visualization by genre
  output$GenderPlot <- renderPlot({
    pie(table(data$gender), labels = labels, 
        main="Nº de certificados atendiendo al género", 
        col=rainbow(length(labels)) # We set some colors
        )
  })
  
  # Visualization by country
  # http://www.londonr.org/Presentations/Andy%20South%20-%20Beautiful%20world%20maps%20in%20R.pdf
  # http://cran.r-project.org/web/packages/rworldmap/vignettes/rworldmap.pdf
  output$CountryPlot <- renderPlot({
    mapCountryData(sPDF, nameColumnToPlot="Freq", mapTitle="Nº de alumnos certificados atendiendo al País", colourPalette="terrain")
  })
  
  

})