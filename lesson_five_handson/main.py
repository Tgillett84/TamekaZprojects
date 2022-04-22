# Part 1

def sum_function(num1, num2, num3):
    return num1 + num2 + num3

print(sum_function(1, 2, 3))

def product_function(number1, number2, number3):
    return number1 * number2 * number3

print(product_function(4, 3, 9))

def average_function(int1, int2, int3):
    return (int1 + int2 + int3)/3

print(average_function(4, 9, 7))

# Part 2

add_numbers = lambda numb1, numb2, numb3 : numb1 + numb2 + numb3

print(add_numbers(22, 12, 10))

multiply_numbers = lambda numbr1, numbr2, numbr3 : numbr1 * numbr2 * numbr3

print(multiply_numbers(2, 7, 19))

average_numbers = lambda integer1, integer2, integer3 : (integer1 + integer2 + integer3)/3

print(average_numbers(2, 3, 8))

# Part 3

list_one = [4, 6, 88, 24]
list_two = [17, 34, 9, 5]
list_three = [63, 20, 98, 4]

average_maker = lambda num1, num2, num3: (num1 + num2 + num3)/3

map_results = map(average_maker, list_one, list_two, list_three)

print(list(map_results))

