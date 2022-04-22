# Part 1
pet1 = {'name': 'Choji', 'type': 'mixed breed', 'color': 'black and white', 'nickname': 'roji', "owner's name": 'lora'}
pet2 = {'name': 'kitty', 'type': 'mixed breed', 'color': 'black and brown', 'nickname': 'sshh', "owner's name": 'meka'}

for key,value in pet1.items():
    print:("Key=", key, "Value=", value) 

for key,value in pet2.items():
    print:("Key=", key, "Value=", value)

# Part 2

city1 = {'capital': 'Seoul', 'country': 'South Korea'}
city2 = {'capital': 'Tokyo', 'country': 'Japan'}
city3 = {'capital': 'Beijing', 'country': 'China'}

print(city1)
print(city2)
print(city3)

city_book = [city1, city2, city3]

for city in city_book:
    print(city)

england = {'Capital': 'London'}
france = {'Capital': 'Paris'}
belgium = {'Capital': 'Brussels'}

city_book = [england, france, belgium]

for city in city_book:
    print(city)

    population1 = {"53.01 million"}
    population2 = {"66.9 million"}
    population3 = {"11.35 million"}

england['population'] = population1
france['population'] = population2
belgium['population'] = population3

print(city_book)

for capital in city_book:
    print(capital)

print(city.get('capital'))

for key,value in city.items():
    print("An interesting fact", key, "the top language spoken by locals is", value)

# Part 3

pizza1 = {'name': 'Bob Z', 'pizza size' : 'pan pizza', 'crust' : 'hand tossed', 'toppings' : '"pepperoni", "spinach", "beef"'}
pizza2 = {'name': 'Jen A', 'pizza size' : 'large', 'crust' : 'large', 'toppings' : '"extra cheese", "mushrooms", "chicken"'}

print("Name : ", pizza1.get('name', "Thank you for your order"))
print("pizza size : ", pizza1.get('pizza size', "You have ordered"))
print("crust : ", pizza1.get('crust'))
print("toppings : ", pizza1.get('toppings', "with the following"))


pizzaOrders = [pizza1, pizza2]
print(pizzaOrders)


for key,value in pizza1.items():
    print("Thank you for your order", key, "You have ordered", value)




