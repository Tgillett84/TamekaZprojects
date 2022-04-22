# 1. Define the class `Dog`
class Dog:
    # 2. The docstring for the `Dog` class
    """The summary docstring for the Dog class. This class represents a Dog."""

    # 3. The initializer of the class, where the class properties are initialized
    def __init__(self, name, age):
        # 4. Class methods, including the initializer, should have a docstring
        """Initialize attributes to describe a Dog."""

        # 5. Below are the properties of the `Dog` class, each with it's own docstring
        self.name = name    #: The `name` property represents the dog's name
        self.age = age      #: The `age` property represents the dog's age

    # 6. Two methods, `stay` and `sit`, are defined for the `Dog` class
    def sit(self):
        """Simulates a dog sitting on command."""
        print(self.name.title() + " is sitting.")

    def stay(self):
        """Simulates a dog that will stay on command."""
        print(self.name.title() + " was told to stay.")

