# ================= Assignment 4 =================
# Data Management and Manipulation in R

# Importing Data (Q1)
# Note: Replace file paths with your actual CSV/Excel file locations
# Example beginner-friendly imports:

# Import CSV file
sales_data <- read.csv("sales_data.csv")
# Import Excel file
# install.packages("readxl") # run once
library(readxl)
sales_data_excel <- read_excel("sales_data.xlsx")

# Display first 10 rows
head(sales_data, 10)
# Display last 10 rows
tail(sales_data, 10)
# Check structure
str(sales_data)
# Summary statistics
summary(sales_data)

# ---------------- Q2: Exporting Data ----------------
# Export dataset to CSV
write.csv(sales_data, "output_data.csv", row.names = FALSE)

# Export dataset to Excel
# install.packages("writexl") # run once
library(writexl)
write_xlsx(sales_data, "output_data.xlsx")

# Export only Electronics category
electronics <- subset(sales_data, Category == "Electronics")
write.csv(electronics, "electronics_data.csv", row.names = FALSE)

# Export customers from Pune
pune_customers <- subset(sales_data, City == "Pune")
write.csv(pune_customers, "pune_customers.csv", row.names = FALSE)

# Export top 20 rows
top20 <- head(sales_data, 20)
write.csv(top20, "top20_data.csv", row.names = FALSE)

# ---------------- Q3: Modifying Data and Subset Creation ----------------
# Create Profit column
sales_data$Profit <- sales_data$Revenue * 0.20

# Rename FinalAmount column to NetAmount
names(sales_data)[names(sales_data) == "FinalAmount"] <- "NetAmount"

# Remove DiscountAmount column
sales_data$DiscountAmount <- NULL

# Add Tax column (10% of NetAmount)
sales_data$Tax <- sales_data$NetAmount * 0.10

# Select orders with Quantity > 5
subset_qty <- subset(sales_data, Quantity > 5)

# ---------------- Q4: Column Selection ----------------
# Select CustomerName and Product columns
select_cols <- sales_data[, c("CustomerName", "Product")]

# Select first 5 columns
first5 <- sales_data[, 1:5]

# Select numeric columns
numeric_cols <- sales_data[, sapply(sales_data, is.numeric)]

# Remove Discount column
remove_discount <- sales_data[, !(names(sales_data) %in% "Discount")]

# Select specific columns using index (e.g., 2nd and 4th)
specific_cols <- sales_data[, c(2,4)]

# ---------------- Q5: Sorting and Aggregation ----------------
# Sort by City alphabetically
sorted_city <- sales_data[order(sales_data$City), ]

# Sort by City and Revenue
sorted_city_rev <- sales_data[order(sales_data$City, sales_data$Revenue), ]

# Average price by city
avg_price_city <- aggregate(Price ~ City, sales_data, mean)

# Maximum order value by city
max_order_city <- aggregate(NetAmount ~ City, sales_data, max)

# Total quantity sold by city
total_qty_city <- aggregate(Quantity ~ City, sales_data, sum)
