# Module 12: Troubleshooting & Support

You will encounter errors. It's part of the job.

## 1. Reading Error Messages
R errors can be cryptic, but usually the answer is there.

> `Error in select(., id) : unused argument (id)`

- **What it means**: The function `select` you are using doesn't expect `id`.
- **Common Cause**: You loaded another package that also has a `select` function (e.g., `MASS`).
- **Fix**: Use `dplyr::select(id)`.

> `Error: object 'x' not found`

- **Fix**: You probably didn't run the line where `x` was defined, or you made a typo.

## 2. The Help System
Type `?` before a function name to see its manual.
```r
?mean
?read_csv
```
Scroll down to the **Examples** section of the help file. It's usually the most useful part.

## 3. Debugging
If a function fails:
1.  **Traceback**: RStudio usually shows a "Show Traceback" button. It tells you *where* inside the function it failed.
2.  **Print**: Add `print("Step 1 done")` lines to your code to see how far it gets.

## 4. Where to Google
- **StackOverflow**: Add `[r]` to your search. e.g., `[r] ggplot2 multiple lines`.
- **RStudio Community**: Friendly forum for beginners.

## Congratulations!
You have the foundation. The best way to learn now is to **do**. Take a real task from your office—even a simple spreadsheet you usually update manually—and try to automate it with R.

---
*Return to [Course Home](../README.md)*

