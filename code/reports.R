Sys.setenv(RSTUDIO_PANDOC='/Applications/RStudio.app/Contents/MacOS/pandoc')

for (i in unique(coloradoRent$subregion)) {
  rmarkdown::render('rmd/reportTemplate.Rmd', "github_document",
    paste("../analysis/", gsub("[^0-9a-zA-Z]", "", i), ".md", sep = ""))
}
