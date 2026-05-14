# ================= Assignment 5 =================
# Data Visualization with ggplot2 in R

# Load ggplot2
# install.packages("ggplot2") # run once
library(ggplot2)

# Example dataset (you can replace with your own sales_data)
set.seed(123)
sales_data <- data.frame(
  OrderID = 1:100,
  City = sample(c("Pune","Mumbai","Delhi","Bangalore","Hyderabad"),100,replace=TRUE),
  Product = sample(c("Laptop","Mobile","Tablet","Shoes","Watch"),100,replace=TRUE),
  Category = sample(c("Electronics","Fashion"),100,replace=TRUE),
  Quantity = sample(1:10,100,replace=TRUE),
  Price = sample(seq(500,50000,500),100,replace=TRUE),
  Revenue = sample(seq(1000,100000,1000),100,replace=TRUE),
  Profit = sample(seq(500,50000,500),100,replace=TRUE)
)

# ---------------- Basic Charts ----------------
# Scatter Plot: Price vs Revenue
ggplot(sales_data, aes(x=Price, y=Revenue)) + geom_point()

# Bar Chart: Count of orders by City
ggplot(sales_data, aes(x=City)) + geom_bar()

# Histogram: Distribution of Price
ggplot(sales_data, aes(x=Price)) + geom_histogram(bins=20)

# Box Plot: Revenue by Category
ggplot(sales_data, aes(x=Category, y=Revenue)) + geom_boxplot()

# Line Chart: Revenue trend by OrderID
ggplot(sales_data, aes(x=OrderID, y=Revenue)) + geom_line()

# ---------------- Advanced Visualizations ----------------
# Colored Scatter Plot
ggplot(sales_data, aes(x=Price, y=Revenue, color=Category)) + geom_point()

# Faceted Chart: Bar chart split by Category
ggplot(sales_data, aes(x=City)) + geom_bar() + facet_wrap(~Category)

# Customized Chart: Revenue by City
ggplot(sales_data, aes(x=City, y=Revenue)) +
  geom_bar(stat="identity") +
  labs(title="Revenue by City", x="City", y="Revenue")

# ---------------- Real-Life Problems ----------------
# Problem 1: Revenue by City
city_rev <- aggregate(Revenue ~ City, sales_data, sum)
ggplot(city_rev, aes(x=City, y=Revenue)) + geom_bar(stat="identity")

# Problem 2: Product Sales Distribution
ggplot(sales_data, aes(x=Product)) + geom_bar()

# Problem 3: Revenue vs Price Relationship
ggplot(sales_data, aes(x=Price, y=Revenue)) + geom_point()

# Problem 4: Revenue Distribution
ggplot(sales_data, aes(x=Revenue)) + geom_histogram(bins=30)

# Problem 5: Profit by Category
ggplot(sales_data, aes(x=Category, y=Profit)) + geom_boxplot()

# Problem 6: Product Revenue
product_rev <- aggregate(Revenue ~ Product, sales_data, sum)
ggplot(product_rev, aes(x=Product, y=Revenue)) + geom_bar(stat="identity")

# Problem 7: Quantity Distribution
ggplot(sales_data, aes(x=Quantity)) + geom_histogram()

# Problem 8: Revenue Trend
ggplot(sales_data, aes(x=OrderID, y=Revenue)) + geom_line()

# Problem 9: Category Comparison
ggplot(sales_data, aes(x=Category)) + geom_bar()
