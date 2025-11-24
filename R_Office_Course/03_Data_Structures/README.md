# Module 03: Data Structures (Deep Dive)

This is often the hardest hurdle for beginners. If you understand **Vectors** vs **Lists** and how to **Subset** them, you understand R.

## 1. The Vector (Atomic)
R has no "scalars" (single numbers). A single number is just a vector of length 1.
**Rule**: A vector can only hold **ONE** data type.

```r
# Numeric
v_num <- c(1, 2, 5.5, 10)

# Character
v_char <- c("server1", "server2", "server3")

# Logical
v_bool <- c(TRUE, FALSE, TRUE)

# WHAT HAPPENS IF YOU MIX THEM? (Coercion)
# R forces them to the "lowest common denominator" (usually character).
v_mixed <- c(1, "server1", TRUE)
print(v_mixed) 
# Result: "1" "server1" "TRUE" (All became text!)
```

## 2. The List (The Container)
**Rule**: A list can hold **ANYTHING**, including other lists. This is crucial for JSON data from APIs.

```r
# A list representing a User
user <- list(
  id = 101,
  name = "Sridhar",
  roles = c("Admin", "Editor"), # Vector inside a list
  settings = list(theme = "Dark", notifications = TRUE) # List inside a list
)
```

## 3. The Data Frame (The Grid)
Technically, a Data Frame is a **List of Vectors** of the same length.
- Every column is a vector.
- Every column must have the same number of rows.

## 4. The Hard Part: Subsetting (`[` vs `[[` vs `$`)
This confuses everyone. Let's clear it up.

### The Analogy: The Train
Imagine a list is a **Train** with several cars.
- `x[1]`: Gives you a **new train** containing only the first car. (Result is still a List).
- `x[[1]]`: **Opens the door** of the first car and gives you what is inside. (Result is the content).

### Code Example
```r
my_list <- list(
  servers = c("srv1", "srv2"),
  uptime = 99.9
)

# 1. Single Bracket [ ] -> Returns a List (The Train Car)
str(my_list[1]) 
# List of 1
# $ servers: chr [1:2] "srv1" "srv2"

# 2. Double Bracket [[ ]] -> Returns the Content (The Cargo)
str(my_list[[1]])
# chr [1:2] "srv1" "srv2" (Just the vector!)

# 3. Dollar Sign $ -> Same as [[ ]] but by name (Easiest)
str(my_list$servers)
# chr [1:2] "srv1" "srv2"
```

**When to use which?**
- Use `$` for interactive work (autocomplete).
- Use `[[ ]]` when programming (e.g., `my_list[[variable_name]]`).
- Use `[ ]` when you want to slice multiple elements (e.g., `my_list[1:3]`).

## 5. Subsetting Data Frames
Data frames have 2 dimensions: `[row, column]`.

```r
df <- data.frame(
  host = c("A", "B", "C"),
  cpu = c(80, 10, 50),
  mem = c(30, 20, 90)
)

# Get Row 1
row_1 <- df[1, ] 

# Get Column "cpu" (as a vector)
cpu_vec <- df[, "cpu"]

# Get Cell (Row 1, Column 2)
val <- df[1, 2] # 80
```

## Practice: The Indexing Challenge
1.  Create this list: `config <- list(db = list(host = "127.0.0.1", port = 5432))`
2.  Extract the port number `5432` using `$` notation.
3.  Extract the port number `5432` using **only** `[[ ]]` notation. (Hint: You need to dig twice).

<details>
<summary>Click for Solution</summary>

```r
# 2. Using $
config$db$port

# 3. Using [[ ]]
config[[1]][[2]] 
# OR
config[["db"]][["port"]]
```
</details>

---
*Next: [Module 04: Basic Data Exploration](../04_Basic_Exploration/README.md)*
