# All load of data goes here

moocs <- read.csv("./data/HMXPC13_DI_v2_5-14-14.csv" ,header=TRUE, sep=",");
# We keep only information from users that have obtained a certificate of completion
data <- moocs[moocs$certified == "1",]
# Years of students (we traduce year of birth to age)
years <- 2014 - data$YoB
# Variable for range of studies
studies <- data$LoE_DI

#tcertified <- table(studies,certified) # Number of#certified users by its LoE
# t1 <- table(studies, courses) # Count ocurrences of level of studies per course
# t2 <- table(studies)          # Count ocurrences of level of studies in all courses


categories <- c(10,18,25,30,35,45,55,65,80,90)
agecat <- cut(years, categories)
table(agecat)
