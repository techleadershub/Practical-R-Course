# Module 11: Connectivity (Nested JSON & APIs)

IT data is rarely a flat table. It's usually nested JSON. This module tackles parsing complex structures.

## 1. The Challenge of Nested JSON
APIs return "Trees", R wants "Tables".

```json
[
  {
    "id": 1, 
    "name": "Sridhar", 
    "repos": [
      {"name": "repo1", "stars": 10}, 
      {"name": "repo2", "stars": 5}
    ]
  }
]
```

## 2. Flattening with `unnest()`
The `tidyr` package helps us unpack these nested lists.

```r
library(tidyverse)
library(jsonlite)

# Simulated nested data
users <- tibble(
  id = 1:2,
  name = c("Dev1", "Dev2"),
  repos = list(
    tibble(name = "r-course", stars = 10),
    tibble(name = "py-course", stars = 50)
  )
)

print(users)
# A tibble: 2 x 3
#      id name  repos           
#   <int> <chr> <list>          
# 1     1 Dev1  <tibble [1 x 2]> <-- The Data is hidden in here!

# UNPACK IT
users_flat <- users %>% 
  unnest(cols = c(repos))

print(users_flat)
# A tibble: 2 x 4
#      id name  name1     stars
#   <int> <chr> <chr>     <dbl>
# 1     1 Dev1  r-course     10
# 2     2 Dev2  py-course    50
```

## 3. Handling API Pagination
Real APIs limit results (e.g., 30 per page). You need a loop.

```r
# Concept Code (Generic)
get_all_pages <- function(base_url) {
  all_data <- list()
  page <- 1
  
  repeat {
    # Fetch page
    data <- fetch_from_api(paste0(base_url, "?page=", page))
    
    if (length(data) == 0) break # Stop if empty
    
    all_data[[page]] <- data
    page <- page + 1
  }
  
  return(bind_rows(all_data))
}
```

## Practice
1.  Create a dataframe with a list column:
    `df <- tibble(group = 1:2, values = list(c(1,2), c(3,4,5)))`
2.  Use `unnest(values)` to see what happens. It should expand rows.

---
*Next: [Module 12: Troubleshooting](../12_Troubleshooting/README.md)*
