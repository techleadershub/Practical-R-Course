# Module 08: Reporting with RMarkdown (Automated & Parameterized)

## 1. The Basics
RMarkdown files (`.Rmd`) allow you to "knit" code and text into HTML, PDF, or Word.

**First Time Setup**: If you haven't used RMarkdown before, install the package:
```r
install.packages("rmarkdown")
```

**For PDF Output**: You also need LaTeX. Install TinyTeX (easiest):
```r
install.packages("tinytex")
tinytex::install_tinytex()
```

## 2. Chunk Options (Controlling the Output)
You don't always want to show the code, just the plot.
- `echo = FALSE`: Hide code, show result (Good for managers).
- `include = FALSE`: Run code, hide everything (Good for setup/loading data).
- `warning = FALSE`: Hide warning messages (Clean report).

````markdown
```{r setup, include=FALSE}
library(tidyverse)
data <- read_csv("data.csv")
```

## Monthly Sales
Here is the chart for this month.

```{r echo=FALSE, warning=FALSE}
ggplot(data, aes(x=date, y=sales)) + geom_line()
```
````

## 3. Parameterized Reports (The Power Move)
**Scenario**: You have 10 clients. You don't want 10 Rmd files. You want **ONE** file that you can run 10 times.

**In your YAML header:**
```yaml
---
title: "Client Report"
output: html_document
params:
  client_name: "DefaultClient"
  start_date: "2023-01-01"
---
```

**In your R code:**
Use `params$client_name` to filter your data.

```r
client_data <- all_data %>% 
  filter(client == params$client_name)
```

**To Run It (from Console):**
```r
library(rmarkdown)
render("report.Rmd", params = list(client_name = "Acme Corp"))
render("report.Rmd", params = list(client_name = "Globex"))
```
This generates two custom HTML files from one script.

## Practice
1.  Create a new RMarkdown file.
2.  Add a param `show_code: true`.
3.  In a chunk, use an `if` statement: `if (params$show_code) { print("Here is the secret code") }`.
4.  Knit with different parameters.

---
*Next: [Module 09: Automation & Productivity](../09_Automation/README.md)*
