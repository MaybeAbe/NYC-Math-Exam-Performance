#Loading Data
library(dplyr)
library(readxl) #When importanting data, insert path of dataset
library(ggplot2)
library(scales)
library(tidyr)
Performance_Metric <- function(GradDist){
  if(GradDist >= 45){ return("Meeting Standards")}
  else if(GradDist < 45 && GradDist >25){return("Approaching Standards")}
  else if (GradDist <= 25){return("Below Standards")}
}
relevant_columns = c("District","Grade", "Year","Category","% Level 1","% Level 2","% Level 3+4")
SWD <- read_excel("Documents/03_district-math-results-2013-2023-(public).xlsx", #When importanting data, insert path of dataset
                  sheet = "SWD")

SWD <- SWD[,relevant_columns]#Drop Columns
SWD <- SWD %>%  #Drop Rows not with all grade
  filter(Grade == "All Grades")
SWD$Grade <- NULL

ELL <- read_excel("Documents/03_district-math-results-2013-2023-(public).xlsx", 
                  sheet = "ELL")

ELL <- ELL[,relevant_columns]#Drop Columns
ELL <- ELL %>%  #Drop Rows not with all grade
  filter(Grade == "All Grades")
ELL$Grade <- NULL

Econ_Status <- read_excel("Documents/03_district-math-results-2013-2023-(public).xlsx", 
                  sheet = "Econ Status")

Econ_Status <- Econ_Status[,relevant_columns]#Drop Columns
Econ_Status <- Econ_Status %>%  #Drop Rows not with all grade
  filter(Grade == "All Grades")
Econ_Status$Grade <- NULL

All <- read_excel("Documents/03_district-math-results-2013-2023-(public).xlsx", 
                          sheet = "All")

All <- All[,relevant_columns]#Drop Columns
All <- All %>%  #Drop Rows not with all grade
  filter(Grade == "All Grades")
All$Grade <- NULL

library(dplyr)
#We are going to measure the Proficiency Gap Between the two areas

# Now, pivot the data wider

 
# Now you have columns like:
# Pct_L3_4_Econ_Disadv and Pct_L3_4_Not_Econ_Disadv

# Finally, calculate the Proficiency Gap
df_gap <- All %>%
  mutate(
    Performance_Tier = case_when(
      `% Level 3+4` >= 45 ~ "Meeting Standards",
      `% Level 3+4` > 25  ~ "Approaching Standards",
      `% Level 3+4` <= 25 ~ "Below Standards"
    ),
    Performance_Tier = factor(Performance_Tier, 
                                levels = c("Below Standards", 
                                           "Approaching Standards", 
                                           "Meeting Standards"))
    )

# You now have a new dataframe 'df_gap' with your key metric
# You can view the results for a specific district
'print(df_gap %>% select(District, Year, Proficiency_Gap) %>% filter(District == 19))

#Time Series Plot
ggplot(df_gap, aes(x = Year, y = Proficiency_Gap, group = 1)) +
  geom_line(aes(color = District)) +  
  geom_point(aes(color = District)) + 
  facet_wrap(~ District) +           
  theme_minimal() +                  
  labs(
    title = "Proficiency GapOver Time",
    subtitle = "Data from 2013-2023, by NYC School District",
    x = "Year",
    y = "Proficiency_Gap",
    color = "District"               # Label for the legend
  ) +
  theme(
    plot.title = element_text(face = "bold"),
    strip.text = element_text(face = "bold", size = 10)
  )

max(df_gap$Proficiency_Gap) - min(df_gap$Proficiency_Gap)
max(All$`% Level 3+4`)
min(All$`% Level 3+4`)
'
#If less than 25% of students preformed at the 3+4 level, we will say that this district is Below Standards for the associated year
#If <45% but >25% of students preformed at the 3+4 level, we will say that this district is Approaching Standards for the associated year
#If greater than 45% of students preformed at the 3+4 level, we will say that this district is Meeting Standards for the associated year
