# NYC-Math-Exam-Performance

## Introduction

The purpose of this project is to analyze the performance on New York State-mandated mathematics assessments from 2013-2023 within New York City (NYC) to better understand the factors that contribute to varying levels of academic achievement in primary schools among NYC Department of Education (DOE) districts. Notably, we are observing the effects of the NYSED's adoption of the Common Core standards on the education system.

We will define three performance tiers—Below Standards, Approaching Standards, and Meeting/Exceeding Standards—and will create a classification model to identify the key socioeconomic features that distinguish these groups. Rather than using a supervised learning model to predict data we already have, we found it more worthwhile to explore the underlying correlations and associations between these tiers and various factors. As students of the Baruch College Mathematics Department, we understand the importance of early mathematical maturity and have decided to focus on the math portion of the state-mandated exams rather than the ELA portion.

Our inputs for this project will be the proportion of English Language Learner (ELL) students, the proportion of Students with Disabilities (SWD), the proportion of economically disadvantaged students, and the regional district. The output will be the performance tiers mentioned above, which are formulated from the DOE's [1,2,3,4] grading level system.

The ultimate goal is to obtain information that can inform public policy, guide internal resource allocation, and emphasize the importance of individual to societal success.

## Background
Access to high-quality education is a key contributor not only to individual success but also to societal success. With a large diverse city such as NYC, public school student performance can vary dramatically from one district to another. Though scores alone can tell us what is happening, it fails to offer an explanation to why. Public policy efforts have been made to address the gaps among student achievements. The NYC DOE school funding is based on an internal formula noted as the Fair Student Funding(FSF).

The FSF system uses a ”Weighted Pupil Funding Model” which provides additional funds to schools based on the
specific needs of their student populations. This means
that schools with higher proportions of the ELL students, SWD, and economically
disadvantaged students should receive greater funding. A key question we had while researching this model is:  Are these resources being used effectively? If we observe that districts with high concentrations
of students with needs are still under performing despite
the FSF model, it suggests a disconnect between funding
allocation and student outcomes.

FSF funds are ultimately
spent at the discretion of school principals, and resource
management strategies may vary based on local needs. Other factors to consider are, quality of
teacher training, availability of after-school programs, and
other social services. Though we cannot directly addresses these issues directly, this must be kept in mind when developing the final report of this project.

Granted, there are several nuances to be aware of. We are only basing our analysis on the mathematics score performance. A key caveat we must consider is the fairness of associating student success to standardized testing. This is not a holistic overview of student performance but rather a measure of proficiency on one specific type of assessment. We acknowledge that these scores are a primary metric used by policymakers and school administration when it comes to funding and resource allocation, making their analysis critical for understanding the educational system.

## Dataset

The dataset used for this project is sourced from the NYC
OpenData Repository provided by the NYC DOE (New
York City Department of Education). For this project, our
focus will be on the SWD, Economic Status, ELL, and
district subsets for grades 3-8. This grade range captures
the entirety of a student’s primary school standardized test-
ing experience, from their first exam in 3rd grade to their
transition to high school in 8th grade.

## References

New York City Department of Education. Math test results 2013-2023. NYC OpenData. URL https://data.cityofnewyork.us/Education/Math-Test-Results-2013-2023/74kb-55u9.

New York City Department of Education. Fund-ing our schools, 2024. URL https://www.schools.nyc.gov/about-us/funding/funding-our-schools.
