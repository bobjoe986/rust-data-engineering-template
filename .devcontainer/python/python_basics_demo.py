"""
python_basics_demo.py

A compact walkthrough of Python basics:
- Scalars
- Arrays (lists)
- Hashes (dicts)
- Functions
- Operators
- Control flow
- Imports
- Global variables ("globalization" in this context)
"""

# Imports
import math
from datetime import datetime


# Global variable
APP_NAME = "Python Basics Demo"
counter = 0


def increment_counter():
    """Modify a global variable from inside a function."""
    global counter
    counter += 1
    return counter


def add(a, b):
    """Simple function with parameters and return value."""
    return a + b


def classify_number(n):
    """Control flow with if/elif/else."""
    if n < 0:
        return "negative"
    elif n == 0:
        return "zero"
    else:
        return "positive"


def loop_examples(values):
    """Looping with for and while."""
    print("for-loop:")
    for v in values:
        print(f"  value={v}")

    print("while-loop:")
    i = 0
    while i < len(values):
        print(f"  index={i}, value={values[i]}")
        i += 1


def main():
    print(f"== {APP_NAME} ==")
    print("timestamp:", datetime.now().isoformat())

    # Scalars
    integer_value = 42
    float_value = 3.14
    string_value = "hello"
    bool_value = True
    none_value = None
    print("\nScalars:")
    print(integer_value, float_value, string_value, bool_value, none_value)

    # Arrays (lists)
    numbers = [1, 2, 3, 4, 5]
    mixed = [1, "two", 3.0, False]
    numbers.append(6)
    print("\nArrays (lists):")
    print("numbers:", numbers)
    print("mixed:", mixed)
    print("slice numbers[1:4]:", numbers[1:4])

    # Hashes (dicts)
    user = {"id": 1, "name": "Ada", "active": True}
    user["email"] = "ada@example.com"
    print("\nHashes (dicts):")
    print("user:", user)
    print("user name:", user.get("name"))

    # Operators
    a, b = 10, 3
    print("\nOperators:")
    print("arithmetic:", a + b, a - b, a * b, a / b, a % b, a**b, a // b)
    print("comparison:", a > b, a == b, a != b)
    print("logical:", (a > 5) and (b < 5), (a < 5) or (b < 5), not (a == b))
    print("membership:", 3 in numbers, "name" in user)

    # Functions
    print("\nFunctions:")
    print("add(7, 8):", add(7, 8))
    print("classify_number(-2):", classify_number(-2))

    # Control flow
    print("\nControl flow:")
    for n in [-1, 0, 1]:
        print(f"{n} is {classify_number(n)}")
    loop_examples([10, 20, 30])

    # Imports usage
    print("\nImports:")
    print("sqrt(16):", math.sqrt(16))

    # Global variable usage
    print("\nGlobal variable:")
    print("counter:", counter)
    print("counter after increment:", increment_counter())
    print("counter after second increment:", increment_counter())


if __name__ == "__main__":
    main()
