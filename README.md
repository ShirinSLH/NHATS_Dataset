# NHATS_Dataset ([https://www.nhats.org/researcher/nhats])
# Analyzing Longitudinal National Health and Aging Trends Study Data

## Project Overview

This repository contains all the necessary data and code for the secondary data analysis course assignment, which focuses on analyzing data from the National Health and Aging Trends Study (NHATS). The main objectives of this project are:
1. To measure the incidence of activity limitations due to balance or coordination problems.
2. To estimate the longitudinal association between developing an activity limitation and participating in clubs, classes, or other organized activities.

## Data Source

The analysis uses data from the three most recent rounds of the NHATS (10 to 12), specifically selecting participants from either the 2011 or 2015 cohort based on the recommendations against combining cohorts. Details on cohort selection can be found in the `tracker file` provided by NHATS.

## Methodology

### Cohort Identification
We identified the cohort of interest for determining incidence based on specific study IDs as outlined in the NHATS tracker file.

### Incidence and Association Measures
- **Incidence**: Defined as the number of new cases of activity limitations due to balance or coordination problems during the follow-up period. Both the count and the rate of incidence are calculated.
- **Association Analysis**: Examined the relationship between the incidence of activity limitations and participation in various organized activities.

### Statistical Analysis
The analysis was conducted using Stata.
## Contents of the Repository

- `data/`: Directory containing the datasets used in the analyses.
- `code/`: Stata scripts used for the analysis, including data preparation and statistical modeling.
- `results/`: Generated tables and figures summarizing the sample characteristics and main findings.

## Results

### Key Findings
- Prevalence of balance or coordination problems at baseline.
- Incidence of activity limitation due to these problems at each follow-up.
- Association between activity limitation and participation in organized activities.

A detailed summary of these findings is available in the `summary.md` file in the `results/` directory.

## How to Use This Repository

To replicate the analysis:
1. Clone this repository to your local machine.
2. Ensure you have Stata installed (the code was developed on Stata version XX).
3. Run the scripts in the `code/` directory sequentially as listed.

