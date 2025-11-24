# -------------------------------------------------------------------------
# Module 12: Troubleshooting
# Goal: Fix the broken code.
# -------------------------------------------------------------------------
library(tidyverse)

# --- CHALLENGE 1: THE MISSING PIPE ---
# This code throws an error. Why?
# Error: object 'val' not found
df <- data.frame(val = 1:5)

# BROKEN:
# df
#   filter(val > 3)

# FIX:
# df %>% 
#   filter(val > 3)


# --- CHALLENGE 2: THE TYPE MISMATCH ---
# We want to calculate the mean, but it fails or returns NA/Error.
numbers <- c(10, 20, "30", 40)

# BROKEN:
# mean(numbers)

# FIX:
# mean(as.numeric(numbers))


# --- CHALLENGE 3: THE PACKAGE CONFLICT ---
# 'select' exists in both MASS and dplyr packages.
# If you load MASS after dplyr, select() breaks.

# library(MASS)
# df %>% select(val) # Error

# FIX:
# df %>% dplyr::select(val)


print("Review the comments in this file for common error patterns.")

