#Loading Data
library(dplyr)
library(readxl) #When importanting data, insert path of dataset

relevant_columns = c("District","Grade", "Year","Category","# Level 1","# Level 2","# Level 3+4")
SWD <- read_excel("Documents/03_district-math-results-2013-2023-(public).xlsx", 
                  sheet = "SWD")

SWD <- SWD[,relevant_columns]#Drop Columns
SWD <- SWD %>%  #Drop Rows not with all grade
  filter(Grade == "All Grades")


ELL <- read_excel("Documents/03_district-math-results-2013-2023-(public).xlsx", 
                  sheet = "ELL")

ELL <- ELL[,relevant_columns]#Drop Columns
ELL <- ELL %>%  #Drop Rows not with all grade
  filter(Grade == "All Grades")


Econ_Status <- read_excel("Documents/03_district-math-results-2013-2023-(public).xlsx", 
                  sheet = "Econ Status")

Econ_Status <- Econ_Status[,relevant_columns]#Drop Columns
Econ_Status <- Econ_Status %>%  #Drop Rows not with all grade
  filter(Grade == "All Grades")

##





