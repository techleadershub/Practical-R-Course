# -------------------------------------------------------------------------
# Module 10: Collaboration (renv)
# Goal: Understand how to lock package versions.
# -------------------------------------------------------------------------

# This script is for demonstration. Run these commands in the Console.

print("--- 1. Initialize Project ---")
# This creates the 'renv' folder and the 'renv.lock' file
# renv::init()

print("--- 2. Install Packages ---")
# When you install packages now, they go into a project-local library
# install.packages("jsonlite")

print("--- 3. Save State (Snapshot) ---")
# This updates the lockfile with the exact versions you have installed
# renv::snapshot()

print("--- 4. Restore State ---")
# If a colleague clones your repo, they run this to get matching versions
# renv::restore()

print("Check the 'renv.lock' file in your project root to see what it looks like.")

