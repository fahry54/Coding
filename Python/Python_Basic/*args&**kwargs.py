def sum_numbers(*args):
    total = 0
    for num in args:
        total += num
    return total

print(sum_numbers(1, 2, 3, 4, 5))  # Output: 15


def print_details(**kwargs):
    for key, value in kwargs.items():
        print(key + ": " + value)

print_details(name="John", age="25", country="USA")
