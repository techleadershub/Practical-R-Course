# Module 05: Data Cleaning & Transformation (dplyr Deep Dive)

`dplyr` is powerful, but there are specific "gotchas" that trip up beginners. We'll focus on the **Split-Apply-Combine** strategy and **Row-wise** operations.

## 1. The Pipe `%>%`
Passes the output of the left to the *first argument* of the right.
```r
# Standard
head(select(data, col1), 5)

# Pipe (Readable)
data %>% 
  select(col1) %>% 
  head(5)
```
*Shortcut: Ctrl + Shift + M*

## 2. `group_by` and `summarise`: The Common Pitfall
When you group data, it *stays* grouped until you tell it otherwise. This can mess up future calculations.

```r
# Scenario: Average CPU by Server Role
summary_df <- server_logs %>% 
  group_by(role) %>% 
  summarise(
    avg_cpu = mean(cpu_usage),
    count = n()
  ) 
  # Note: summarise() usually drops the last grouping level automatically, 
  # but it's safer to be explicit.

# BETTER PRACTICE: Always .groups = 'drop'
summary_df <- server_logs %>% 
  group_by(role) %>% 
  summarise(
    avg_cpu = mean(cpu_usage),
    count = n(),
    .groups = 'drop' # Ungroups the result immediately
  )
```

## 3. `across()`: Applying logic to multiple columns
**Problem**: You want to round all numeric columns to 2 decimal places. You don't want to write `mutate` for each one.

```r
# The Hard Way
df %>% mutate(cpu = round(cpu, 2), mem = round(mem, 2), disk = round(disk, 2))

# The dplyr Way (across)
df %>% 
  mutate(across(where(is.numeric), ~ round(., 2)))
```
- `where(is.numeric)`: Selects columns.
- `~ round(., 2)`: The function to apply. The `.` represents the column data.

## 4. Advanced Filtering
**Problem**: Filtering for "one of many" values.

```r
target_servers <- c("web-01", "web-02", "db-01")

# The Hard Way
logs %>% filter(server == "web-01" | server == "web-02" | server == "db-01")

# The Easy Way: %in%
logs %>% filter(server %in% target_servers)
```

## 5. Handling Dates in Filtering
Timestamps are tricky.

```r
library(lubridate)

# Filter for incidents in the last 24 hours
recent_incidents <- incidents %>% 
  mutate(incident_time = ymd_hms(created_at)) %>% # Parse text to datetime
  filter(incident_time > (now() - hours(24)))
```

## Practice: The Clean-Up
You have a dataframe `raw_data`:
```r
raw_data <- data.frame(
  id = 1:3,
  metric_a = c(10.123, 20.555, NA),
  metric_b = c(5.1, 6.2, 7.9),
  status = c("OK", "FAIL", "OK")
)
```
1.  Replace `NA` in `metric_a` with `0`.
2.  Round all numeric columns to 1 decimal place.
3.  Filter keep only rows where `status` is "OK".

<details>
<summary>Click for Solution</summary>

```r
library(tidyr) # for replace_na()

clean <- raw_data %>% 
  mutate(metric_a = replace_na(metric_a, 0)) %>% # handling NA
  mutate(across(where(is.numeric), ~ round(., 1))) %>% 
  filter(status == "OK")
```
</details>

---
*Next: [Module 06: Advanced Analysis](../06_Advanced_Analysis/README.md)*
