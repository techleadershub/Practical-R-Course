# -------------------------------------------------------------------------
# Module 04: Basic Data Exploration
# Goal: Inspect a dataset before analyzing it.
# -------------------------------------------------------------------------
library(tidyverse)

# --- STEP 1: CREATE DUMMY DATA ---
# We'll create a dataframe of API requests
requests <- data.frame(
  req_id = 1:10,
  status = c(200, 200, 404, 200, 500, 200, NA, 200, 403, 200),
  latency_ms = c(120, 115, 45, 2000, 150, 98, 110, NA, 105, 130),
  endpoint = c("/home", "/login", "/login", "/api/v1", "/home", "/home", "/api/v1", "/login", "/admin", "/home")
)

# --- STEP 2: INSPECTION TOOLS ---

print("--- 1. Structure (str) ---")
# Shows column types and first few values
str(requests)

print("--- 2. Summary (summary) ---")
# Shows statistics (Mean, Min, Max) and NA counts
summary(requests)

print("--- 3. Frequency Table (table) ---")
# How many of each status code?
print(table(requests$status, useNA = "ifany")) # useNA shows NAs in the table

# --- STEP 3: MISSING DATA CHECK ---

print("--- 4. Check for NAs ---")
# Total missing values in latency column
missing_count <- sum(is.na(requests$latency_ms))
print(paste("Missing Latency Values:", missing_count))

# Find exactly WHICH rows are missing data
rows_with_na <- requests %>% filter(is.na(status) | is.na(latency_ms))
print("Rows with issues:")
print(rows_with_na)

