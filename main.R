Sys.setenv(RSTUDIO_PANDOC='/Applications/RStudio.app/Contents/MacOS/pandoc')
# Load most commonly used libraries

library(tidyverse)

# ---- begin ----
# Step One: Load Data from Google Big Query:
source("code/load.R")

# ---- analysis ----
# Step Two: Analyzing data for report:
source("code/functions.R")

# ---- plots ----
# Step Three: Analyzing data for report:
source("code/plots/plots.R")

# ---- knit ----
# Step Four: Knitting Report
source("code/reports.R")