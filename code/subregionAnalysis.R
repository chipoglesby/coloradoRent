Sys.setenv(RSTUDIO_PANDOC='/Applications/RStudio.app/Contents/MacOS/pandoc')

for (i in unique(coloradoRentAll$subregion)) {
  rmarkdown::render('rmd/subregionAnalysis.Rmd', "github_document",
    paste("../analysis/", tolower(gsub("[^0-9a-zA-Z]", "", i)), ".md", sep = ""))
}