# ================= Assignment 10 =================
# Complete Data Analysis Project in R

# ---------------- Step 1: Import Data ----------------
# Example: Import sales dataset (replace with your actual file)
sales_data <- read.csv("sales_data.csv")

# ---------------- Step 2: Explore Data ----------------
head(sales_data, 10)       # First 10 rows
tail(sales_data, 10)       # Last 10 rows
str(sales_data)            # Structure
summary(sales_data)        # Summary statistics

# ---------------- Step 3: Clean Data ----------------
# Handle missing values
sales_data <- na.omit(sales_data)

# Rename columns for clarity
names(sales_data)[names(sales_data) == "FinalAmount"] <- "NetAmount"

# ---------------- Step 4: Create New Variables ----------------
sales_data$Revenue <- sales_data$Quantity * sales_data$Price
sales_data$DiscountAmount <- sales_data$Revenue * sales_data$Discount / 100
sales_data$NetAmount <- sales_data$Revenue - sales_data$DiscountAmount
sales_data$Profit <- sales_data$NetAmount * 0.20
sales_data$Tax <- sales_data$NetAmount * 0.10
sales_data$TotalBill <- sales_data$NetAmount + sales_data$Tax

# ---------------- Step 5: Aggregation ----------------
# Total Revenue by City
total_rev_city <- aggregate(Revenue ~ City, sales_data, sum)

# Average Price by Category
avg_price_category <- aggregate(Price ~ Category, sales_data, mean)

# Total Quantity by Product
total_qty_product <- aggregate(Quantity ~ Product, sales_data, sum)

# ---------------- Step 6: Frequency & Cross-Tabulation ----------------
# Frequency of Cities
table(sales_data$City)

# Cross-tab: City vs Category
table(sales_data$City, sales_data$Category)

# ---------------- Step 7: Correlation ----------------
cor_price_revenue <- cor(sales_data$Price, sales_data$Revenue)
cor_qty_revenue <- cor(sales_data$Quantity, sales_data$Revenue)

# ---------------- Step 8: Visualization ----------------
library(ggplot2)

# Scatter Plot: Price vs Revenue
ggplot(sales_data, aes(x=Price, y=Revenue)) + geom_point()

# Bar Chart: Revenue by City
ggplot(total_rev_city, aes(x=City, y=Revenue)) + geom_bar(stat="identity")

# Histogram: Distribution of Revenue
ggplot(sales_data, aes(x=Revenue)) + geom_histogram(bins=20)

# Boxplot: Profit by Category
ggplot(sales_data, aes(x=Category, y=Profit)) + geom_boxplot()

# Line Chart: Revenue trend by OrderID
ggplot(sales_data, aes(x=OrderID, y=Revenue)) + geom_line()

# ---------------- Step 9: Export Results ----------------
write.csv(total_rev_city, "total_revenue_by_city.csv", row.names = FALSE)
write.csv(avg_price_category, "avg_price_by_category.csv", row.names = FALSE)
write.csv(total_qty_product, "total_quantity_by_product.csv", row.names = FALSE)
