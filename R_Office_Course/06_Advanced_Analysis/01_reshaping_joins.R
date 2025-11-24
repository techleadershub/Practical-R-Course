# -------------------------------------------------------------------------
# Module 06: Advanced Analysis (Reshaping & Joins)
# Goal: Pivot data for reporting and Join datasets.
# -------------------------------------------------------------------------
library(tidyverse)

# --- PART 1: RESHAPING (Pivot) ---
# Scenario: You get this "Wide" format from Excel.
wide_sales <- tibble(
  product = c("Laptop", "Mouse"),
  Q1 = c(1000, 200),
  Q2 = c(1200, 210),
  Q3 = c(1500, 250)
)

print("--- Wide Format (Bad for Plotting) ---")
print(wide_sales)

# Task: Convert to Long format (Product, Quarter, Revenue)
long_sales <- wide_sales %>% 
  pivot_longer(
    cols = c(Q1, Q2, Q3),
    names_to = "Quarter",
    values_to = "Revenue"
  )

print("--- Long Format (Good for Plotting) ---")
print(long_sales)

# Back to Wide (e.g., for a final report table)
report_table <- long_sales %>% 
  pivot_wider(
    names_from = Quarter,
    values_from = Revenue
  )

# --- PART 2: JOINS ---
users <- tibble(id = 1:3, name = c("Alice", "Bob", "Charlie"))
logins <- tibble(id = c(1, 1, 2, 4), time = c("10:00", "10:30", "11:00", "12:00"))

print("--- Left Join (Keep all Users) ---")
# Shows Alice and Bob login times. Charlie has NA (no login). User 4 is ignored.
print(left_join(users, logins, by = "id"))

print("--- Inner Join (Matches Only) ---")
# Only Alice and Bob (Charlie removed)
print(inner_join(users, logins, by = "id"))

print("--- Anti Join (Find Missing) ---")
# Who has NEVER logged in? (Charlie)
print(anti_join(users, logins, by = "id"))

