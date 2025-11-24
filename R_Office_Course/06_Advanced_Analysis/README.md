# Module 06: Advanced Analysis (Reshaping & Joins)

In IT, data is often "Wide" (Time Series columns: Jan, Feb, Mar) but R needs "Long" data for plotting. Reshaping is the **#1 skill** for visualization.

## 1. The Problem: Wide vs Long

**Wide Data** (Human Readable):
| Server | CPU_00h | CPU_01h | CPU_02h |
| :--- | :--- | :--- | :--- |
| Srv1 | 10 | 15 | 12 |

**Long Data** (Machine/Plot Readable):
| Server | Time | CPU |
| :--- | :--- | :--- |
| Srv1 | 00h | 10 |
| Srv1 | 01h | 15 |
| Srv1 | 02h | 12 |

## 2. `pivot_longer`: Wide to Long
You want to plot CPU usage over time. You cannot plot `CPU_00h` and `CPU_01h` on one axis unless they are in *one column*.

```r
library(tidyr) # part of tidyverse

wide_df <- data.frame(
  server = "Srv1",
  cpu_00 = 10,
  cpu_01 = 15,
  cpu_02 = 12
)

long_df <- wide_df %>% 
  pivot_longer(
    cols = starts_with("cpu"), # Which columns to melt?
    names_to = "time_slot",    # New column name for headers
    values_to = "usage"        # New column name for values
  )

print(long_df)
#   server time_slot usage
# 1 Srv1   cpu_00       10
# 2 Srv1   cpu_01       15
# ...
```

## 3. `pivot_wider`: Long to Wide
Useful for creating summary tables or matrices for reports.

```r
# Turning it back into a report format
report_df <- long_df %>% 
  pivot_wider(
    names_from = time_slot,
    values_from = usage
  )
```

## 4. Advanced Joins (Anti-Join)
You know `left_join` and `inner_join`. But `anti_join` is a debugger's best friend.
**Use Case**: Find users who *started* a signup flow but *never finished*.

```r
started <- data.frame(id = 1:5)
finished <- data.frame(id = c(1, 2, 4))

# Who dropped out?
dropouts <- anti_join(started, finished, by = "id")
# Result: IDs 3 and 5
```

## 5. Window Functions (Lag/Lead)
**Use Case**: Calculate change from previous hour.

```r
metrics <- data.frame(hour = 1:4, val = c(10, 15, 15, 20))

metrics_with_change <- metrics %>% 
  mutate(
    prev_val = lag(val), # Look at the row above
    change = val - prev_val
  )
```

## Practice: Reshape Challenge
You have quarterly sales:
```r
sales <- data.frame(
  product = c("A", "B"),
  Q1 = c(100, 200),
  Q2 = c(150, 250)
)
```
1.  Use `pivot_longer` to make a dataset with columns: `product`, `quarter`, `revenue`.
2.  (Bonus) Use `mutate` to remove the "Q" from the quarter column if you can (look up `str_remove`).

<details>
<summary>Click for Solution</summary>

```r
sales %>% 
  pivot_longer(cols = c(Q1, Q2), names_to = "quarter", values_to = "revenue") %>% 
  mutate(quarter = str_remove(quarter, "Q"))
```
</details>

---
*Next: [Module 07: Visualization with ggplot2](../07_Visualization/README.md)*
