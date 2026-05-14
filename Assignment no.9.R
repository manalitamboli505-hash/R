# ================= Assignment 9 =================
# Introduction to S3 and S4 Classes in R

# ---------------- S3 Classes ----------------
# In R, S3 classes are very simple and flexible.
# You just assign a "class" attribute to a list or vector.

# Example: Creating a Student object using S3
student <- list(name = "Rahul", age = 20, marks = c(85, 90, 78))
class(student) <- "Student"

# Print the student object
print(student)

# Define a method for Student class
print.Student <- function(x){
  cat("Student Name:", x$name, "\n")
  cat("Age:", x$age, "\n")
  cat("Marks:", x$marks, "\n")
  cat("Average Marks:", mean(x$marks), "\n")
}

# Call the method
print(student)

# ---------------- S4 Classes ----------------
# S4 classes are more formal and strict.
# You define them using setClass() and create objects with new().

# Example: Creating a Student class using S4
setClass("StudentS4",
         slots = list(name = "character",
                      age = "numeric",
                      marks = "numeric"))

# Create an object
student_s4 <- new("StudentS4", name="Amit", age=21, marks=c(88, 92, 79))

# Show the object
student_s4

# Define a method for S4 class
setMethod("show", "StudentS4",
          function(object){
            cat("Student Name:", object@name, "\n")
            cat("Age:", object@age, "\n")
            cat("Marks:", object@marks, "\n")
            cat("Average Marks:", mean(object@marks), "\n")
          })

# Call the method
student_s4

# ---------------- Using References ----------------
# You can store objects in lists or data frames and refer to them later.

students_list <- list(student1 = student, student2 = student_s4)
print(students_list)
