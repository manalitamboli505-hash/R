# ================= Assignment 7 =================
# Correlation, Probability Distributions & Univariate Analysis

# Example dataset
set.seed(123)
sales_data <- data.frame(
  OrderID = 1:100,
  Price = sample(seq(500,50000,500),100,replace=TRUE),
  Revenue = sample(seq(1000,100000,1000),100,replace=TRUE),
  Quantity = sample(1:10,100,replace=TRUE)
)

# ---------------- Q1: Correlation ----------------
# Correlation between Price and Revenue
cor_price_revenue <- cor(sales_data$Price, sales_data$Revenue)
print(paste("Correlation between Price and Revenue:", cor_price_revenue))

# Correlation between Quantity and Revenue
cor_qty_revenue <- cor(sales_data$Quantity, sales_data$Revenue)
print(paste("Correlation between Quantity and Revenue:", cor_qty_revenue))

# ---------------- Q2: Probability Distributions ----------------
# Normal Distribution
x <- rnorm(100, mean=50, sd=10)
hist(x, main="Normal Distribution", col="lightblue")

# Binomial Distribution
y <- rbinom(100, size=10, prob=0.5)
hist(y, main="Binomial Distribution", col="lightgreen")

# Poisson Distribution
z <- rpois(100, lambda=4)
hist(z, main="Poisson Distribution", col="lightpink")

# ---------------- Q3: Univariate Analysis ----------------
# Summary statistics for Price
summary(sales_data$Price)

# Mean, Median, Variance, Standard Deviation
mean_price <- mean(sales_data$Price)
median_price <- median(sales_data$Price)
var_price <- var(sales_data$Price)
sd_price <- sd(sales_data$Price)

cat("Mean:", mean_price, "\n")
cat("Median:", median_price, "\n")
cat("Variance:", var_price, "\n")
cat("Standard Deviation:", sd_price, "\n")

# ---------------- Q4: Frequency Distribution ----------------
# Frequency table for Quantity
qty_freq <- table(sales_data$Quantity)
print(qty_freq)

# Relative frequency (proportions)
qty_prop <- prop.table(qty_freq)
print(round(qty_prop, 2))

# ---------------- Q5: Visualization ----------------
# Histogram of Revenue
hist(sales_data$Revenue, main="Revenue Distribution", col="orange")

# Boxplot of Pricehttp://127.0.0.1:46809/graphics/2e78ebe4-aac3-435a-a256-6ce9f7157c2c.png
boxplot(sales_data$Price, main="Price Boxplot", col="lightblue")

# Scatter plot: Price vs Revenue
plot(sales_data$Price, sales_data$Revenue,
     main="Price vs Revenue",
     xlab="Price", ylab="Revenue",
     col="red", pch=19)
