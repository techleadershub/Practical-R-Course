# R for the IT Professional: The Practical Guide

Welcome to **R for the IT Professional**. This repository contains a self-paced course designed to teach R specifically for workflows common in software companies, DevOps, and IT management.

## 🎯 Goal
To move you from "Zero" to "Automating Reports and Analysis" using R. We focus on:
-   **Server Logs & Performance Metrics** (not flower petals).
-   **API Data & JSON** (not clean academic CSVs).
-   **Automation & Reproducibility** (not one-off scripts).

## 📚 Course Modules

Each module is in its own folder containing a `README.md` guide and a runnable `.R` script with examples.

| Module | Topic | Key File |
| :--- | :--- | :--- |
| **[01. Getting Started](./01_Getting_Started/)** | Setup & Environment | `01_check_setup.R` |
| **[02. Importing Data](./02_Importing_Data/)** | Reading Real World Data | `01_read_messy_data.R` |
| **[03. Data Structures](./03_Data_Structures/)** | **Deep Dive**: Vectors vs Lists | `01_vectors_vs_lists.R` |
| **[04. Basic Exploration](./04_Basic_Exploration/)** | Know your data | `01_inspect_data.R` |
| **[05. Transformation](./05_Transformation/)** | The Powerhouse (`dplyr`) | `01_dplyr_cleaning.R` |
| **[06. Advanced Analysis](./06_Advanced_Analysis/)** | **Crucial**: Reshaping Data | `01_reshaping_joins.R` |
| **[07. Visualization](./07_Visualization/)** | Professional Plots | `01_business_plots.R` |
| **[08. Reporting](./08_Reporting/)** | Automated Docs | `monthly_report.Rmd` |
| **[09. Automation](./09_Automation/)** | **Advanced**: Functions | `01_functions_and_purrr.R` |
| **[10. Collaboration](./10_Collaboration/)** | Working in Teams | `01_renv_demo.R` |
| **[11. Connectivity](./11_Connectivity/)** | External Data (JSON/APIs) | `01_api_json_parsing.R` |
| **[12. Troubleshooting](./12_Troubleshooting/)** | Unblocking Yourself | `01_debugging_practice.R` |

## 🚀 Quick Start

**👉 NEW? Read [START_HERE.md](./START_HERE.md) first!**

1.  Clone this repository or download the files.
2.  Open `R_Office_Course.Rproj` in RStudio (double-click the file).
3.  **First Time**: Run `source("setup.R")` in the Console to install all required packages.
4.  **Start with Module 01**: Open the folder, read the README, and run the `.R` script.
5.  Modify the scripts! Break them, fix them, and apply them to your own data.

## 📦 Required Packages
All modules use the `tidyverse` ecosystem. Optional packages include `readxl`, `writexl`, `scales`, and `rmarkdown`. Run `setup.R` to install everything at once.

## 💡 Why R for IT?
-   **Python** is great for building apps and general scripting.
-   **R** is superior for **exploratory analysis** and **visualization** of the data those apps generate.
-   The `tidyverse` ecosystem makes data cleaning 10x faster than Excel and often more readable than Pandas.

---

## 📋 Course Notes
- **[COURSE_REVIEW.md](./COURSE_REVIEW.md)**: Critical review of the course content, known issues, and compatibility notes.
- All code examples are self-contained and generate their own dummy data.
- Tested with R >= 4.0.0 and tidyverse >= 1.3.0.
