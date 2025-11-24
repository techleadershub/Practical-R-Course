# -------------------------------------------------------------------------
# Module 01: Getting Started
# Goal: Verify your R installation and packages are working.
# -------------------------------------------------------------------------

# 1. Check R Version
print(version$version.string)

# 2. Install/Load Tidyverse
# If you haven't installed it yet, uncomment the line below:
# install.packages("tidyverse")

library(tidyverse)

# 3. Test a simple plot to ensure RStudio graphics pane is working
# This uses the built-in 'mtcars' dataset
ggplot(mtcars, aes(x = mpg, y = hp)) +
  geom_point(color = "blue") +
  ggtitle("If you see this plot, R is working!")

print("Setup Complete! You are ready for Module 02.")

