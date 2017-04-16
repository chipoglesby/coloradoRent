Sys.setenv(RSTUDIO_PANDOC='/Applications/RStudio.app/Contents/MacOS/pandoc')

for (i in unique(coloradoRent$subregion)) {
  rmarkdown::render('rmd/template.Rmd', "github_document", 
    paste("../analysis/", gsub("(\\s)", "", i), ".md", sep = ""))
}
