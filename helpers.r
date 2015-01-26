# All load of data goes here

moocs <- read.csv("./data/HMXPC13_DI_v2_5-14-14.csv" ,header=TRUE, sep=",");
# We keep only information from users that have obtained a certificate of completion
data <- moocs[moocs$certified == "1",]
# We keep data only for registrants
data <- moocs[moocs$registered == "1",]
# Years of students (we traduce year of birth to age)
years <- 2014 - data$YoB
# Variable for range of studies
studies <- data$LoE_DI

#tcertified <- table(studies,certified) # Number of#certified users by its LoE
# t1 <- table(studies, courses) # Count ocurrences of level of studies per course
# t2 <- table(studies)          # Count ocurrences of level of studies in all courses

#2
categories <- c(10,18,25,30,35,45,55,65,80,90)
agecat <- cut(years, categories)
table(agecat)


# 3
gender <- table(data$gender)
genderpercent <- gender/sum(gender)*100
labels <- c("Missing","Female","Male","Other")
genderpercent <- round(genderpercent, digits=0)
labels <- paste(labels, genderpercent)
labels <- paste(labels,"%",sep="") # ad % to labels

# 4
dataf <- table(data$final_cc_cname_DI)
Countries <- as.data.frame(dataf)
Countries[1] <- countrycode(Countries$Var1,"country.name", "iso3c")

sPDF <- joinCountryData2Map(Countries, joinCode = "NAME", nameJoinColumn = "Var1")
mapCountryData(sPDF, nameColumnToPlot="Freq", mapTitle="Nº de alumnos certificados atendiendo al País", colourPalette="terrain")

# Adding courses list
course_id <- as.data.frame(unique(data$course_id))
df4 <- course_id
df4 <- cbind(fullname = names, df4)

names = c("CB22x, The Ancient Greek Hero (Launched Spring, 2013)",
          "CS50x, Introduction to Computer Science (Launched Fall, 2012)",
          "ER22x, Justice (Launched Spring, 2013)",
          "PH207x, Health in Numbers: Quantitative Methods in Clinical & Public Health Research (Launched Fall, 2012)",
          "PH278x, Human Health and Global Environmental Change (Launched Spring, 2013)",
          "6.002x, Circuits and Electronics (Launched Fall, 2012)",
          "6.002x, Circuits and Electronics (Launched Spring, 2013)",
          "14.73x, The Challenges of Global Poverty (Launched Spring, 2013)",
          "2.01x, Elements of Structures (Launched Spring, 2013)",
          "3.091x, Introduction to Solid State Chemistry (Launched Fall, 2012)",
          "3.091x, Introduction to Solid State Chemistry (Launched Spring, 2013)",
          "6.00x, Introduction to Computer Science Programming (Launched Fall, 2012)",
          "6.00x, Introduction to Computer Science Programming (Launched Spring, 2013)",
          "7.00x, Introduction to Biology - The Secret of Life (Launched Spring, 2013)",
          "8.02x, Electricity and Magnetism (Launched Spring, 2013)",
          "8.MReV, Mechanics ReView (Launched Summer, 2013)")

colnames(df4)[2] <- "course_id"
