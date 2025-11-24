# Module 01: Getting Started

## 1. Installation
You need two things:
1. **R (The Engine)**: [cran.r-project.org](https://cran.r-project.org/) - Download and install for your OS.
2. **RStudio (The Dashboard)**: [posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/) - The free Desktop version.

> **Pro Tip**: Always open RStudio, not R directly. RStudio sits on top of R and makes it usable.

## 2. The RStudio Interface
When you open RStudio, you see 4 panes:

1.  **Top-Left (Source)**: Where you write scripts. Like a text editor. (If you don't see it, File > New File > R Script).
2.  **Bottom-Left (Console)**: Where code runs *immediately*. Good for quick math or testing commands.
    - Type `1 + 1` and hit Enter here.
3.  **Top-Right (Environment)**: Variables you've created. If you load a dataset, it shows up here.
4.  **Bottom-Right (Files/Plots)**: File browser and where charts appear.

## 3. R Projects: Organizing Your Work (Crucial!)
In IT, we organize work into repositories/folders. R has a built-in tool for this called **R Projects**.

**Why use it?**
It solves the "File not found" error. It makes the folder containing the `.Rproj` file the "root" directory.

**How to setup:**
1.  `File > New Project > Existing Directory`.
2.  Browse to the `R_Office_Course` folder.
3.  Click Create.

**Your Workflow:**
Always open the `.Rproj` file to start work. It sets your "working directory" automatically.

> **What is the working directory?** It's where R looks for files by default. When you run a script, any files you create (like CSVs or plots) will be saved here unless you specify a different path.

## 4. Packages
R has a massive library of add-ons called packages. The most important one for us is the `tidyverse` (a collection of data tools).

Run this in your **Console** (only once per computer):
```r
install.packages("tidyverse")
```

## Practice
1.  Create a new folder/project called `R_Learning`.
2.  Create a new R Script (`File > New File > R Script`).
3.  Save it as `01_basics.R`.
4.  Type `print("Hello World")` in the script, highlight it, and press `Ctrl+Enter` (Cmd+Enter on Mac) to run it.

---
*Next: [Module 02: Importing & Exporting Data](../02_Importing_Data/README.md)*

