# r_basics_demo.R
#
# A compact walkthrough of R basics:
# - Scalars
# - Arrays (vectors/lists)
# - Hashes (named lists)
# - Functions
# - Operators
# - Control flow
# - Imports
# - Global variables

# Imports
suppressPackageStartupMessages(library(stats))

# Global variables
APP_NAME <- "R Basics Demo"
counter <- 0

increment_counter <- function() {
  counter <<- counter + 1
  counter
}

add <- function(a, b) {
  a + b
}

classify_number <- function(n) {
  if (n < 0) {
    "negative"
  } else if (n == 0) {
    "zero"
  } else {
    "positive"
  }
}

loop_examples <- function(values) {
  cat("for-loop:\n")
  for (v in values) {
    cat("  value=", v, "\n", sep = "")
  }

  cat("while-loop:\n")
  i <- 1
  while (i <= length(values)) {
    cat("  index=", i, ", value=", values[i], "\n", sep = "")
    i <- i + 1
  }
}

main <- function() {
  cat("==", APP_NAME, "==\n")
  cat("timestamp:", format(Sys.time(), "%Y-%m-%dT%H:%M:%S"), "\n")

  # Scalars
  integer_value <- 42L
  float_value <- 3.14
  string_value <- "hello"
  bool_value <- TRUE
  null_value <- NULL
  cat("\nScalars:\n")
  print(integer_value)
  print(float_value)
  print(string_value)
  print(bool_value)
  print(null_value)

  # Arrays (vectors/lists)
  numbers <- c(1, 2, 3, 4, 5)
  mixed <- list(1, "two", 3.0, FALSE)
  numbers <- c(numbers, 6)
  cat("\nArrays (vectors/lists):\n")
  print(numbers)
  print(mixed)
  print(numbers[2:4])

  # Hashes (named list as key/value map)
  user <- list(id = 1, name = "Ada", active = TRUE)
  user$email <- "ada@example.com"
  cat("\nHashes (named list):\n")
  print(user)
  print(user$name)

  # Operators
  a <- 10
  b <- 3
  cat("\nOperators:\n")
  cat("arithmetic:", a + b, a - b, a * b, a / b, a %% b, a ^ b, a %/% b, "\n")
  cat("comparison:", a > b, a == b, a != b, "\n")
  cat("logical:", (a > 5) && (b < 5), (a < 5) || (b < 5), !(a == b), "\n")
  cat("membership:", 3 %in% numbers, "name" %in% names(user), "\n")

  # Functions
  cat("\nFunctions:\n")
  cat("add(7, 8):", add(7, 8), "\n")
  cat("classify_number(-2):", classify_number(-2), "\n")

  # Control flow
  cat("\nControl flow:\n")
  for (n in c(-1, 0, 1)) {
    cat(n, "is", classify_number(n), "\n")
  }
  loop_examples(c(10, 20, 30))

  # Imports usage
  cat("\nImports:\n")
  cat("sd(c(1,2,3,4)):", sd(c(1, 2, 3, 4)), "\n")

  # Global variable usage
  cat("\nGlobal variable:\n")
  cat("counter:", counter, "\n")
  cat("counter after increment:", increment_counter(), "\n")
  cat("counter after second increment:", increment_counter(), "\n")
}

main()
