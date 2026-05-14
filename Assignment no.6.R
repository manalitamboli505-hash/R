# ================= Assignment 6 =================
# Data Aggregation, Cross-Tabulation, Frequency & Contingency Tables

# Example dataset
set.seed(123)
sales_data <- data.frame(
  OrderID = 1:100,
  City = sample(c("Pune","Mumbai","Delhi","Bangalore","Hyderabad"),100,replace=TRUE),
  Product = sample(c("Laptop","Mobile","Tablet","Shoes","Watch"),100,replace=TRUE),
  Category = sample(c("Electronics","Fashion"),100,replace=TRUE),
  Quantity = sample(1:10,100,replace=TRUE),
  Price = sample(seq(500,50000,500),100,replace=TRUE),
  PaymentMethod = sample(c("Cash","Card","UPI"),100,replace=TRUE)
)

sales_data$Revenue <- sales_data$Quantity * sales_data$Price

# ---------------- Q1: Frequency Tables ----------------
# Frequency of Cities
city_freq <- table(sales_data$City)
print(city_freq)

# Frequency of Products
product_freq <- table(sales_data$Product)
print(product_freq)

# Frequency of Categories
category_freq <- table(sales_data$Category)
print(category_freq)

# Frequency of Payment Methods
payment_freq <- table(sales_data$PaymentMethod)
print(payment_freq)

# ---------------- Q2: Cross-Tabulation ----------------
# City vs Category
city_category <- table(sales_data$City, sales_data$Category)
print(city_category)

# Product vs Payment Method
product_payment <- table(sales_data$Product, sales_data$PaymentMethod)
print(product_payment)

# Category vs Payment Method
category_payment <- table(sales_data$Category, sales_data$PaymentMethod)
print(category_payment)

# ---------------- Q3: Aggregation ----------------
# Total Revenue by City
total_rev_city <- aggregate(Revenue ~ City, sales_data, sum)
print(total_rev_city)

# Average Quantity by Product
avg_qty_product <- aggregate(Quantity ~ Product, sales_data, mean)
print(avg_qty_product)

# Maximum Revenue by Category
max_rev_category <- aggregate(Revenue ~ Category, sales_data, max)
print(max_rev_category)

# ---------------- Q4: Contingency Tables ----------------
# City vs Product contingency table
city_product <- table(sales_data$City, sales_data$Product)
print(city_product)

# Add proportions (relative frequencies)
prop_city_product <- prop.table(city_product)
print(round(prop_city_product, 2))

# ---------------- Q5: Exploring Tables ----------------
# Margin totals
addmargins(city_category)

# Proportions by row
prop_row <- prop.table(city_category, 1)
print(round(prop_row, 2))

# Proportions by column
prop_col <- prop.table(city_category, 2)
print(round(prop_col, 2))

