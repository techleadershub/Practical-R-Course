# Module 04: Basic Data Exploration

Before analyzing, you must understand what you have. "Garbage in, garbage out."

## 1. The First Look
Assume we have a dataframe called `requests` containing web server log data.

```r
# View the first 6 rows
head(requests)

# View the last 6 rows (good for checking if file was cut off)
tail(requests)

# View the column names
colnames(requests)

# Get the dimensions (Rows, Columns)
dim(requests) # e.g., 5000   8
```

## 2. Summarizing Data
R can auto-summarize every column.

```r
summary(requests)
```
- **Numeric columns**: Gives Min, Max, Mean, Median.
- **Character columns**: Lists length (not very useful yet).

## 3. Inspecting Specific Columns
Use the `$` to pick a column.

```r
# What are the unique HTTP status codes in our logs?
unique(requests$status_code) 
# Output: 200, 404, 500, 301

# How many of each?
table(requests$status_code)
# Output:
# 200: 4500
# 404: 20
# 500: 5
```

## 4. Checking for Missing Data
Missing values show up as `NA` in R. They are contagious (1 + NA = NA).

```r
# Check if any value is NA in a vector
any(is.na(requests$response_time))

# Count total NAs
sum(is.na(requests$response_time))
```

## Practice
1.  Create a dataframe: `df <- data.frame(id=1:5, val=c(10, 20, NA, 40, 50))`
2.  Run `mean(df$val)`. What happens? (It should be NA).
3.  Run `mean(df$val, na.rm = TRUE)`. This ignores the NA.

---
*Next: [Module 05: Data Cleaning & Transformation](../05_Transformation/README.md)*

