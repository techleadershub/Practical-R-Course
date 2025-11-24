# -------------------------------------------------------------------------
# Module 05: Cleaning & Transformation (dplyr)
# Goal: Filter, Mutate, and Summarize server logs.
# -------------------------------------------------------------------------
library(tidyverse)

# --- SETUP: CREATE DATA ---
logs <- tibble(
  server = c("db-01", "db-01", "web-01", "web-01", "web-02", "web-02"),
  cpu_usage = c(15.5, 85.2, 10.1, 12.5, 99.9, 45.0),
  mem_usage = c(40, 90, 30, 35, 95, 50),
  role = c("db", "db", "web", "web", "web", "web")
)

print("--- Original Data ---")
print(logs)

# --- 1. FILTER & SELECT ---
# Task: Find high CPU servers (> 80%) and keep only server name and usage
high_load <- logs %>% 
  filter(cpu_usage > 80) %>% 
  select(server, cpu_usage)

print("--- High Load Servers ---")
print(high_load)

# --- 2. MUTATE (Create Columns) ---
# Task: Flag servers as "CRITICAL" if CPU > 90, else "OK"
logs_flagged <- logs %>% 
  mutate(
    status = if_else(cpu_usage > 90, "CRITICAL", "OK"),
    # Advanced: Normalize CPU (0-1 scale)
    cpu_norm = cpu_usage / 100
  )

print("--- Flagged Data ---")
print(logs_flagged)

# --- 3. GROUP BY & SUMMARISE ---
# Task: Average CPU load per Role
role_stats <- logs %>% 
  group_by(role) %>% 
  summarise(
    avg_cpu = mean(cpu_usage),
    max_mem = max(mem_usage),
    count = n(),
    .groups = 'drop' # Important: Ungroup result
  )

print("--- Stats by Role ---")
print(role_stats)

# --- 4. ACROSS (Advanced) ---
# Task: Round all numeric columns to 0 decimals
rounded <- logs %>% 
  mutate(across(where(is.numeric), round))

print("--- Rounded Data ---")
print(rounded)

