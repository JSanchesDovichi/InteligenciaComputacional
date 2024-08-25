import random

lista = []

random.seed(10000)

for i in range(0, 100):
    # print(i)

    lista.append(random.uniform(-0.5, 0.5))

print(lista)
