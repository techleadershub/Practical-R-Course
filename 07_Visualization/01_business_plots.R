# -------------------------------------------------------------------------
# Module 07: Visualization (ggplot2)
# Goal: Create professional charts for reports.
# -------------------------------------------------------------------------

# Install packages if needed (run once):
# install.packages("tidyverse")
# install.packages("scales")

library(tidyverse)
library(scales) # For $ and % formatting

# --- STEP 1: CREATE DATA ---
metrics <- tibble(
  month = seq.Date(from = as.Date("2023-01-01"), by = "month", length.out = 12),
  revenue = c(100, 120, 130, 110, 150, 180, 200, 210, 190, 220, 240, 250) * 1000,
  category = rep(c("Product A", "Product B"), each = 6)
)

# --- STEP 2: BASIC LINE CHART ---
p1 <- ggplot(metrics, aes(x = month, y = revenue)) +
  geom_line(color = "steelblue", size = 1.2) +  # Use 'size' for compatibility
  ggtitle("Basic Revenue Trend")

print(p1)

# --- STEP 3: PROFESSIONAL BUSINESS CHART ---
p_pro <- ggplot(metrics, aes(x = month, y = revenue)) +
  geom_col(fill = "#2E4053", alpha = 0.8) + # Dark Blue Bars
  
  # Clean up the axes
  scale_y_continuous(labels = dollar_format()) + # Requires 'scales' package
  scale_x_date(date_labels = "%b", date_breaks = "1 month") +
  
  # Add labels
  labs(
    title = "2023 Monthly Revenue Performance",
    subtitle = "Steady growth observed in Q3 and Q4",
    caption = "Data Source: Internal Sales DB",
    x = "",
    y = "Revenue"
  ) +
  
  # Theme adjustments
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

print(p_pro)

# --- STEP 4: FACETING (Small Multiples) ---
# Imagine we have multiple categories
p_facet <- ggplot(metrics, aes(x = month, y = revenue)) +
  geom_line() +
  facet_wrap(~ category) + # Splits chart by category
  ggtitle("Revenue by Product Category")

print(p_facet)

# --- STEP 5: SAVE ---
ggsave("revenue_report.png", plot = p_pro, width = 8, height = 5)
print("Saved 'revenue_report.png'")

