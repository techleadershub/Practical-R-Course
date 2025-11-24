# Module 07: Business Visualization with ggplot2 (Advanced)

## 1. Formatting for the Boss
Defaults look "sciency". Let's make them "Business Ready".

```r
library(scales) # For formatting currency and percents

ggplot(sales, aes(x = month, y = revenue)) +
  geom_col(fill = "#0073C2") + # Official Company Hex Code
  scale_y_continuous(labels = dollar_format()) + # Adds $ signs
  labs(
    title = "Monthly Revenue Q1",
    subtitle = "Growth driven by new enterprise tier",
    x = "", # Remove x label if dates are obvious
    y = "Revenue"
  ) +
  theme_minimal() + # Clean white background
  theme(
    plot.title = element_text(face = "bold", size = 16),
    axis.text.x = element_text(angle = 45, hjust = 1) # Tilt text if crowded
  )
```

## 2. Ordering Bars (Factors)
**The Problem**: ggplot sorts alphabetically. Monday, Friday, Saturday... 
**The Fix**: Convert to a `factor` with specific levels.

```r
daily_stats <- daily_stats %>% 
  mutate(day = factor(day, levels = c("Mon", "Tue", "Wed", "Thu", "Fri")))

# Now ggplot respects this order
```

## 3. Faceting (Small Multiples)
Instead of one messy chart with 10 lines, make 10 small charts.

```r
# 10 different servers on one plot? Messy.
# Split them into their own panels:
ggplot(server_logs, aes(x = time, y = cpu)) +
  geom_line() +
  facet_wrap(~ server_name, scales = "free_y") # 'free_y' allows different scales
```

## 4. Saving for PPT/Slack
```r
ggsave("report_chart.png", width = 10, height = 6, dpi = 300)
```
- **DPI 300**: High resolution for print/presentations.

## Practice
1.  Use `mtcars`.
2.  Plot `mpg` vs `hp`.
3.  Use `facet_wrap(~ cyl)` to split the chart by number of cylinders.
4.  Add `theme_bw()`.

---
*Next: [Module 08: Reporting with RMarkdown](../08_Reporting/README.md)*
