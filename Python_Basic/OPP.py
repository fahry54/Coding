
#init methode
class player :
    def __init__(self, name, level):
        self.name = name
        self.level = level
    
    def intro(self) :
        print(self.name + "(level" + self.level + ")")

name = input()
level = input()
p = player(name,level)

p.intro()

class Wolf: 
    def __init__(self, name, color):
        self.name = name
        self.color = color

    def bark(self):
        print("Grr...")

class Dog(Wolf):
    def bark(self):
        print("Woof")

husky = Dog("Max", "grey")
husky.bark()

bor = Wolf("kain", "Black")
bor.bark()
bor.name()