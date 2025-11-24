# -------------------------------------------------------------------------
# Module 09: Automation (Functions & Purrr)
# Goal: Automate repetitive logic and replace loops.
# -------------------------------------------------------------------------
library(tidyverse)

# --- PART 1: CUSTOM FUNCTIONS ---

# Scenario: Classify latency into categories
classify_latency <- function(ms) {
  if (is.na(ms)) return("Unknown")
  if (ms < 200) return("Fast")
  if (ms < 500) return("Average")
  return("Slow")
}

# Test it
print(classify_latency(150))
print(classify_latency(600))

# Applying to a Vector (Vectorization issue?)
# Standard 'if' doesn't work on vectors easily. Use case_when in dplyr instead.
latencies <- c(150, 600, 100)

# The dplyr way (Recommended):
results <- case_when(
  latencies < 200 ~ "Fast",
  latencies < 500 ~ "Average",
  TRUE ~ "Slow"
)
print(results)

# --- PART 2: PROGRAMMING WITH DPLYR (Curly-Curly {{}}) ---
# Scenario: A function that calculates mean of ANY column
summarize_col <- function(df, group_col, target_col) {
  df %>% 
    group_by({{ group_col }}) %>% 
    summarise(
      avg = mean({{ target_col }}, na.rm = TRUE),
      .groups = 'drop'
    )
}

# Test it
data <- tibble(
  dept = c("IT", "IT", "HR", "HR"),
  salary = c(50, 60, 40, 45),
  age = c(25, 30, 40, 50)
)

print("--- Avg Salary by Dept ---")
print(summarize_col(data, dept, salary))

print("--- Avg Age by Dept ---")
print(summarize_col(data, dept, age))


# --- PART 3: PURRR (Replacing Loops) ---
# Scenario: You have a list of numbers and want to square them
nums <- list(10, 20, 30)

# Using map (returns a list)
squared_list <- map(nums, ~ .x ^ 2)
print(str(squared_list))

# Using map_dbl (returns a vector of numbers)
squared_vec <- map_dbl(nums, ~ .x ^ 2)
print(squared_vec)

