# -------------------------------------------------------------------------
# Module 11: Connectivity (JSON & APIs)
# Goal: Handle nested JSON data (Lists of Lists).
# -------------------------------------------------------------------------
library(tidyverse)
library(jsonlite)

# --- PART 1: CREATE NESTED DATA ---
# Simulating an API response for GitHub users
# Each user has a list of repositories (Nested List)
users <- tibble(
  user_id = c(1, 2),
  username = c("dev_alice", "dev_bob"),
  repos = list(
    tibble(name = c("repo_a", "repo_b"), stars = c(10, 50)), # Alice's Repos
    tibble(name = c("repo_c"), stars = c(100))               # Bob's Repos
  )
)

print("--- Nested Data (Look at the 'repos' column) ---")
print(users)
# Notice <tibble [2 x 2]> inside the column.

# --- PART 2: UNNEST (The Magic Function) ---
# We want a flat table: User | Repo | Stars

flat_users <- users %>% 
  unnest(cols = c(repos))

print("--- Unnested Data (Flat) ---")
print(flat_users)

# --- PART 3: REAL API EXAMPLE (Requires Internet) ---
# Uncomment to try:
# url <- "https://api.github.com/repos/tidyverse/dplyr/issues"
# issues <- fromJSON(url, flatten = TRUE) %>% as_tibble()
# 
# print(issues %>% select(number, title, state))

