import turtle
from pyswip import Prolog

def run_turtle(commands):
    for cmd in commands:
        if isinstance(cmd, list) and len(cmd) == 2:
            fun, val = cmd
            if fun == "lt":
                turtle.left(val)
            elif fun == "rt":
                turtle.right(val)
            elif fun == "fd":
                turtle.forward(val)
            elif fun == "backward":
                turtle.backward(val)

# Initialize Prolog
prolog = Prolog()
prolog.consult("no1.pl")

turtle.setheading(90)

result = list(prolog.query("drawTree(50,L)"))
if result:
    commands = result[0]["L"]
    print("Commands:", commands[:15], "...") 
    turtle.speed(0)
    run_turtle(commands)
    turtle.done()
else:
    print("No result from Prolog!")