# ================= Assignment 1 =================
# Introduction to R and Basic Operations

# Q1: Arithmetic Operations
a <- 12
b <- 5
results <- c(
  sum = a + b,
  difference = a - b,
  product = a * b,
  division = a / b,
  power = a ^ b,
  modulus = a %% b
)
print(results)
cat("Max:", max(results), "Min:", min(results), "Avg:", mean(results), "\n")

# Q2: Random Numbers and Square Root Analysis
set.seed(123)
nums <- sample(1:100, 10)
df <- data.frame(
  Number = nums,
  Sqrt = sqrt(nums),
  Rounded = round(sqrt(nums), 2),
  Ceiling = ceiling(sqrt(nums)),
  Floor = floor(sqrt(nums))
)
print(df)

# Q3: Names in Uppercase with Length
names <- c("Rahul", "Amit", "Priya", "Neha")
upper_names <- toupper(names)
lengths <- nchar(names)
sentences <- paste(upper_names, "has", lengths, "characters.")
print(sentences)

# Q4: Numbers Divisible by 3 and 5
nums <- 1:200
divisible <- nums[nums %% 3 == 0 & nums %% 5 == 0]
results <- data.frame(
  Number = divisible,
  SquareRoot = sqrt(divisible),
  Square = divisible^2
)
print(results)

# Q5: Quadratic Equation Roots
a <- 1; b <- -3; c <- 2
D <- b^2 - 4*a*c
if(D >= 0){
  root1 <- (-b + sqrt(D)) / (2*a)
  root2 <- (-b - sqrt(D)) / (2*a)
  cat("Real Roots:", root1, "and", root2, "\n")
} else {
  real_part <- -b / (2*a)
  imag_part <- sqrt(-D) / (2*a)
  cat("Complex Roots:", real_part, "+", imag_part, "i and",
      real_part, "-", imag_part, "i\n")
}
