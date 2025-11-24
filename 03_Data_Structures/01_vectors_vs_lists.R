# -------------------------------------------------------------------------
# Module 03: Data Structures
# Goal: Master the difference between Lists and Vectors.
# -------------------------------------------------------------------------

# --- PART 1: VECTORS (The Building Blocks) ---
# Rule: Must be all same type.

v_num <- c(10, 20, 30)
v_char <- c("A", "B", "C")

# What happens if we mix?
v_mix <- c(10, "A") 
print(v_mix) 
# Output: "10" "A" (Both converted to text)

# --- PART 2: LISTS (The Containers) ---
# Rule: Can hold anything.

server_config <- list(
  hostname = "prod-db-01",
  active = TRUE,
  ports = c(80, 443, 8080),    # Vector inside a list
  owner = list(                # List inside a list
    name = "Sridhar", 
    dept = "DevOps"
  )
)

# --- PART 3: ACCESSING DATA (The Hard Part) ---
# Concept: The Train

print("--- Using Single Bracket [ ] ---")
# Returns a smaller list (Sub-train)
print(str(server_config["ports"]))

print("--- Using Double Bracket [[ ]] ---")
# Returns the actual content (Cargo)
print(str(server_config[["ports"]]))

print("--- Using Dollar Sign $ ---")
# Same as [[ ]] but easier to type
print(server_config$ports)

# --- PART 4: PRACTICAL CHALLENGE ---
# Extract the 'dept' of the 'owner'
dept <- server_config$owner$dept
print(paste("Department:", dept))

