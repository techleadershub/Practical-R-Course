# -------------------------------------------------------------------------
# Setup Script: Install All Course Packages
# Run this ONCE when you first start the course
# -------------------------------------------------------------------------

cat("Installing required packages for R Office Course...\n\n")

packages <- c(
  "tidyverse",   # Core: dplyr, ggplot2, tidyr, readr, purrr, stringr
  "readxl",      # Reading Excel files
  "writexl",     # Writing Excel files
  "lubridate",   # Date handling (part of tidyverse but needs explicit load)
  "scales",      # Formatting axes ($ signs, %)
  "jsonlite",    # JSON parsing
  "rmarkdown",   # Report generation
  "knitr"        # RMarkdown helper
)

# Check which packages are NOT installed
new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]

if(length(new_packages) > 0) {
  cat("Installing:", paste(new_packages, collapse = ", "), "\n")
  install.packages(new_packages, dependencies = TRUE)
} else {
  cat("All packages already installed!\n")
}

cat("\n✓ Setup complete! You're ready to start the course.\n")
cat("Open Module 01 to begin: 01_Getting_Started/README.md\n")

