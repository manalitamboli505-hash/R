# ================= Assignment 3 =================
# Advanced Data Manipulation Techniques in R
# Using base R and dplyr (beginner-friendly)

# Create dataset
set.seed(123)
sales_data <- data.frame(
  OrderID = 1:200,
  CustomerName = sample(c("Rahul","Amit","Priya","Neha","Arjun","Sneha","Rohit","Kiran"),200,replace=TRUE),
  City = sample(c("Pune","Mumbai","Delhi","Bangalore","Hyderabad"),200,replace=TRUE),
  Product = sample(c("Laptop","Mobile","Tablet","Shoes","Watch"),200,replace=TRUE),
  Category = sample(c("Electronics","Fashion"),200,replace=TRUE),
  Quantity = sample(1:10,200,replace=TRUE),
  Price = sample(seq(500,50000,500),200,replace=TRUE),
  Discount = sample(c(0,5,10,15,20),200,replace=TRUE),
  PaymentMethod = sample(c("Cash","Card","UPI"),200,replace=TRUE)
)

# Add calculated columns
sales_data$Revenue <- sales_data$Quantity * sales_data$Price
sales_data$DiscountAmount <- sales_data$Revenue * sales_data$Discount/100
sales_data$FinalAmount <- sales_data$Revenue - sales_data$DiscountAmount

# ---------------- Q1: Recoding, Sorting, New Variables ----------------
# Create OrderSize (Small, Medium, Large)
sales_data$OrderSize <- ifelse(sales_data$Quantity <= 3, "Small",
                               ifelse(sales_data$Quantity <= 7, "Medium", "Large"))

# Sort by Quantity descending
sorted_qty <- sales_data[order(-sales_data$Quantity), ]

# Sort by City and Revenue
sorted_city_rev <- sales_data[order(sales_data$City, -sales_data$Revenue), ]

# Create Tax column (10% of FinalAmount)
sales_data$Tax <- sales_data$FinalAmount * 0.10

# Create TotalBill column
sales_data$TotalBill <- sales_data$FinalAmount + sales_data$Tax

# ---------------- Q2: select() and filter() ----------------
library(dplyr)

# Select CustomerName and Product
select_names_products <- select(sales_data, CustomerName, Product)

# Select numeric columns
select_numeric <- select_if(sales_data, is.numeric)

# Remove Discount column
remove_discount <- select(sales_data, -Discount)

# Filter Pune customers
filter_pune <- filter(sales_data, City == "Pune")

# Filter multiple conditions (Price > 20000 and Quantity > 5)
filter_multi <- filter(sales_data, Price > 20000 & Quantity > 5)

# ---------------- Q3: mutate() and arrange() ----------------
sales_data <- mutate(sales_data,
                     Tax2 = FinalAmount * 0.10,
                     Profit = FinalAmount * 0.20,
                     OrderCategory = ifelse(Revenue > 40000, "High", "Low"),
                     DiscountCategory = ifelse(Discount > 10, "High", "Low"),
                     PaymentType = ifelse(PaymentMethod == "Cash", "Offline", "Online"))

# Sort by Revenue descending
sorted_revenue <- arrange(sales_data, desc(Revenue))

# ---------------- Q4: group_by() and summarise() ----------------
total_rev_city <- sales_data %>%
  group_by(City) %>%
  summarise(TotalRevenue = sum(Revenue))

avg_price_product <- sales_data %>%
  group_by(Product) %>%
  summarise(AveragePrice = mean(Price))

total_qty_product <- sales_data %>%
  group_by(Product) %>%
  summarise(TotalQuantity = sum(Quantity))

max_rev_city <- sales_data %>%
  group_by(City) %>%
  summarise(MaxRevenue = max(Revenue))

min_rev_product <- sales_data %>%
  group_by(Product) %>%
  summarise(MinRevenue = min(Revenue))

# ---------------- Q5: Customer Analysis ----------------
orders_per_customer <- sales_data %>%
  group_by(CustomerName) %>%
  summarise(OrderCount = n())

revenue_per_customer <- sales_data %>%
  group_by(CustomerName) %>%
  summarise(TotalRevenue = sum(Revenue))

avg_order_value <- mean(sales_data$Revenue)

top_customer <- revenue_per_customer[order(-revenue_per_customer$TotalRevenue), ][1, ]

sorted_customers <- arrange(revenue_per_customer, desc(TotalRevenue))
