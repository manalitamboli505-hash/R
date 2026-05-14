# ================= Assignment 2 =================
# Data Structures and Control Structures in R

# Create the dataset
set.seed(123)
sales_data <- data.frame(
  OrderID = 1:100,
  CustomerName = sample(c("Rahul","Amit","Priya","Neha","Arjun","Sneha","Rohit","Kiran"),100,replace=TRUE),
  City = sample(c("Pune","Mumbai","Delhi","Bangalore","Hyderabad"),100,replace=TRUE),
  Product = sample(c("Laptop","Mobile","Tablet","Shoes","Watch"),100,replace=TRUE),
  Category = sample(c("Electronics","Fashion"),100,replace=TRUE),
  Quantity = sample(1:10,100,replace=TRUE),
  Price = sample(seq(500,50000,500),100,replace=TRUE),
  Discount = sample(c(0,5,10,15,20),100,replace=TRUE),
  PaymentMethod = sample(c("Cash","Card","UPI"),100,replace=TRUE)
)

sales_data$Revenue <- sales_data$Quantity * sales_data$Price
sales_data$DiscountAmount <- sales_data$Revenue * sales_data$Discount / 100
sales_data$FinalAmount <- sales_data$Revenue - sales_data$DiscountAmount

# ---------------- Q1: Filtering Rows ----------------
subset_price <- subset(sales_data, Price > 20000)
subset_city <- subset(sales_data, City == "Pune")
subset_quantity <- subset(sales_data, Quantity > 5)
subset_category <- subset(sales_data, Category == "Electronics")
subset_combined <- subset(sales_data, Price > 20000 & Category == "Electronics")

# ---------------- Q2: Sorting Data ----------------
sorted_price <- sales_data[order(sales_data$Price), ]
sorted_revenue <- sales_data[order(sales_data$Revenue), ]
sorted_city <- sales_data[order(sales_data$City), ]
sorted_quantity <- sales_data[order(-sales_data$Quantity), ]
sorted_multi <- sales_data[order(sales_data$City, -sales_data$Revenue), ]

# ---------------- Q3: Aggregation ----------------
total_rev_city <- aggregate(Revenue ~ City, sales_data, sum)
avg_price_category <- aggregate(Price ~ Category, sales_data, mean)
total_qty_product <- aggregate(Quantity ~ Product, sales_data, sum)
max_order_city <- aggregate(FinalAmount ~ City, sales_data, max)
min_order_product <- aggregate(FinalAmount ~ Product, sales_data, min)

# ---------------- Q4: Conditional Statements ----------------
sales_data$DiscountLevel <- ifelse(sales_data$Discount > 10, "High Discount", "Normal")
sales_data$OrderValue <- ifelse(sales_data$Revenue > 40000, "High", 
                                ifelse(sales_data$Revenue > 20000, "Medium", "Low"))

for(i in 1:5){
  print(sales_data$Revenue[i])
}

i <- 1
cum_rev <- 0
while(i <= 5){
  cum_rev <- cum_rev + sales_data$Revenue[i]
  print(cum_rev)
  i <- i + 1
}

skip_fashion <- subset(sales_data, Category != "Fashion")

# ---------------- Q5: Discount Analysis ----------------
avg_discount <- mean(sales_data$Discount)
orders_high_discount <- subset(sales_data, Discount > 10)
total_discount_amount <- sum(sales_data$DiscountAmount)
city_highest_discount <- aggregate(DiscountAmount ~ City, sales_data, sum)
city_highest_discount <- city_highest_discount[order(-city_highest_discount$DiscountAmount), ][1, ]
discount_levels <- table(sales_data$Discount)

# ---------------- Q6: Multi Condition Filtering ----------------
cond1 <- subset(sales_data, Category == "Electronics" & Price > 20000)
cond2 <- subset(sales_data, Category == "Fashion" & Quantity > 5)
cond3 <- subset(sales_data, City == "Pune" & Discount > 10)
cond4 <- subset(sales_data, Revenue > 50000 & PaymentMethod == "Cash")
cond5 <- subset(sales_data, Price > 30000 & Quantity > 7)
