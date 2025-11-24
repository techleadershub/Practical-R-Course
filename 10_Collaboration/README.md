# Module 10: Collaboration & Reproducibility (Git & renv)

## 1. Version Control (Git)
RStudio has a built-in Git GUI.
- **Diff**: Click on a file in the Git pane > "Diff". Shows exactly what lines changed.
- **Commit**: Select files > Commit > Write Message.
- **Push/Pull**: Arrows in the Git pane.

## 2. Dependency Management (`renv`)
**The Problem**: Your script works today. In 6 months, you update R, and the script breaks because a package changed.
**The Solution**: `renv` (R Environment). It locks your package versions for *this specific project*.

**How to use:**
1.  Initialize: `renv::init()` (Creates a `renv.lock` file).
2.  Work as normal: `install.packages("dplyr")`.
3.  Save state: `renv::snapshot()` (Updates the lockfile).
4.  Colleague joins: They clone the repo and run `renv::restore()`.

They now have the **exact same versions** of every package you used.

## 3. Project Structure (Standard)
Don't dump everything in one folder.

```
MyProject/
├── data/           # Raw files (Read-only)
│   └── raw_logs.csv
├── output/         # Saved plots/tables
├── scripts/        # .R files
│   ├── 01_load.R
│   └── 02_clean.R
├── report.Rmd      # Final Report
├── MyProject.Rproj # The Entry Point
└── README.md
```

## Practice
1.  Run `renv::init()` in your project (Warning: it might take a minute to download packages).
2.  Look at the `renv.lock` file. It's a text file listing every package version.

---
*Next: [Module 11: Connectivity](../11_Connectivity/README.md)*
