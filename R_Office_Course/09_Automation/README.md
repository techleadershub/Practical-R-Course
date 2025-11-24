# Module 09: Automation & Productivity (Functions & Loops)

Moving from "Scripts" to "Software". This module covers the advanced topic of programming with R.

## 1. The `map` Family (Replacing For-Loops)
R is famous for being slow with `for` loops. Use the `purrr` package (part of tidyverse) instead. It's cleaner and safer.

### Scenario: Reading Multiple CSV files
You have a folder with `data_jan.csv`, `data_feb.csv`, etc.

```r
library(purrr)

# 1. Get list of files
files <- list.files("path/to/data", pattern = "*.csv", full.names = TRUE)

# 2. Read ALL of them into one big dataframe
# map_dfr loops through 'files', applies 'read_csv', and binds rows (dfr)
all_data <- map_dfr(files, read_csv)
```

## 2. Writing Functions with `dplyr` (Curly-Curly `{{ }}`)
**The Hardest Concept**: Passing column names to functions.
Standard R functions don't know that `col_name` refers to a column inside `df` and not a variable `col_name` in your environment.

### The Wrong Way
```r
my_summary <- function(df, col_name) {
  df %>% summarise(avg = mean(col_name)) # ERROR: object 'col_name' not found
}
```

### The Right Way: Data Masking `{{ }}`
Tell R to treat the *argument* as a *data column*.

```r
calc_metrics <- function(df, group_col, value_col) {
  df %>% 
    group_by({{ group_col }}) %>% 
    summarise(
      avg = mean({{ value_col }}, na.rm = TRUE),
      total = sum({{ value_col }}, na.rm = TRUE),
      .groups = 'drop'
    )
}

# Usage
results <- calc_metrics(server_logs, server_name, cpu_usage)
```

## 3. Defensive Programming
When automating, scripts shouldn't fail silently.

```r
safe_divide <- function(a, b) {
  if (b == 0) {
    warning("Attempted division by zero. Returning NA.")
    return(NA)
  }
  return(a / b)
}
```

## Practice: The Batch Processor
1.  Create a list of numbers: `nums <- list(10, 20, "30", 40)`.
2.  Use `map` to check if they are numeric (`is.numeric`).
3.  Notice "30" returns FALSE.

<details>
<summary>Click for Solution</summary>

```r
map(nums, is.numeric)
# Output: list(TRUE, TRUE, FALSE, TRUE)
```
</details>

---
*Next: [Module 10: Collaboration](../10_Collaboration/README.md)*
