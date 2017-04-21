Sys.setenv(RSTUDIO_PANDOC='/Applications/RStudio.app/Contents/MacOS/pandoc')
# Load most commonly used libraries

library(tidyverse)

# ---- begin ----
# Step One: Load Data from Google Big Query:
source("code/load.R")

# ---- analysis ----
# Step Two: Analyzing data for report:
source("code/analysis.R")

# ---- plots ----
# Step Three: Analyzing data for report:
source("code/plots/plots.R")
source("code/plots/rentIncrease.R")
source("code/plots/rentDecrease.R")

# ---- reports -----
source("code/reports.R")

# ---- knit ----
# Step Four: Render Report
rmarkdown::render('rmd/analysis.Rmd', 'github_document', '../analysis/README.md')
rmarkdown::render('rmd/dataREADME.Rmd', 'github_document', '../data/README.md')