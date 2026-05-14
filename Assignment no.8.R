# ================= Assignment 8 =================
# Working with CSV and Excel Files in R

# ---------------- Q1: Importing and Exploring Data ----------------
# Import dataset from CSV file
sales_data_csv <- read.csv("sales_data.csv")

# Import dataset from Excel file
# install.packages("readxl") # run once
library(readxl)
sales_data_excel <- read_excel("sales_data.xlsx")

# Display first 10 rows
head(sales_data_csv, 10)

# Display last 10 rows
tail(sales_data_csv, 10)

# Check structure of dataset
str(sales_data_csv)

# Display summary statistics
summary(sales_data_csv)

# ---------------- Q2: Exporting Data ----------------
# Export dataset to CSV file
write.csv(sales_data_csv, "output_data.csv", row.names = FALSE)

# Export dataset to Excel file
# install.packages("writexl") # run once
library(writexl)
write_xlsx(sales_data_csv, "output_data.xlsx")

# Export only Electronics category
electronics <- subset(sales_data_csv, Category == "Electronics")
write.csv(electronics, "electronics_data.csv", row.names = FALSE)

# Export customers from Pune
pune_customers <- subset(sales_data_csv, City == "Pune")
write.csv(pune_customers, "pune_customers.csv", row.names = FALSE)

# Export top 20 rows
top20 <- head(sales_data_csv, 20)
write.csv(top20, "top20_data.csv", row.names = FALSE)

# ---------------- Q3: Modifying Data and Subset Creation ----------------
# Create Profit column (20% of Revenue)
sales_data_csv$Profit <- sales_data_csv$Revenue * 0.20

# Rename FinalAmount column to NetAmount
names(sales_data_csv)[names(sales_data_csv) == "FinalAmount"] <- "NetAmount"

# Remove DiscountAmount column
sales_data_csv$DiscountAmount <- NULL

# Add Tax column (10% of NetAmount)
sales_data_csv$Tax <- sales_data_csv$NetAmount * 0.10

# Select orders with Quantity > 5
subset_qty <- subset(sales_data_csv, Quantity > 5)

# ---------------- Q4: Column Selection ----------------
# Select CustomerName and Product columns
select_cols <- sales_data_csv[, c("CustomerName", "Product")]

# Select first 5 columns
first5 <- sales_data_csv[, 1:5]

# Select numeric columns
numeric_cols <- sales_data_csv[, sapply(sales_data_csv, is.numeric)]

# Remove Discount column
remove_discount <- sales_data_csv[, !(names(sales_data_csv) %in% "Discount")]

# Select specific columns using index (e.g., 2nd and 4th)
specific_cols <- sales_data_csv[, c(2,4)]

# ---------------- Q5: Sorting and Aggregation ----------------
# Sort by City alphabetically
sorted_city <- sales_data_csv[order(sales_data_csv$City), ]

# Sort by City and Revenue
sorted_city_rev <- sales_data_csv[order(sales_data_csv$City, sales_data_csv$Revenue), ]

# Average price by city
avg_price_city <- aggregate(Price ~ City, sales_data_csv, mean)

# Maximum order value by city
max_order_city <- aggregate(NetAmount ~ City, sales_data_csv, max)

# Total quantity sold by city
total_qty_city <- aggregate(Quantity ~ City, sales_data_csv, sum)
