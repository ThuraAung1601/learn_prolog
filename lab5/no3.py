from pyswip import Prolog
import turtle
import time

# Step 1: Initialize Prolog and consult the hanoi.pl file
prolog = Prolog()
prolog.consult("no3.pl")  # Prolog file

# Step 2: Run Hanoi for 3 disks
list(prolog.query("retractall(step(_))"))  # clear old moves
list(prolog.query("hanoi(3)"))            # generate moves

# Step 3: Get all moves using step/1
moves = list(prolog.query("findall(X, step(X), L)"))
moves = moves[0]['L']  # L contains all [From, To] moves

print("Moves:", moves)

# Step 4: Hanoi drawing with Turtle
class Hanoi:
    def __init__(self, n):
        self.n = n
        self.stacks = {"left": [], "center": [], "right": []}

        # Setup turtle screen
        self.screen = turtle.Screen()
        self.screen.setup(width=800, height=400)
        self.screen.title("Tower of Hanoi Visualization")
        
        # Main turtle for drawing static elements
        self.t = turtle.Turtle()
        self.t.hideturtle()
        self.t.speed(0)

        # Rod positions
        self.positions = {"left": -200, "center": 0, "right": 200}

        # Draw rods
        self.draw_rods()

        # Initialize discs
        self.discs = {}
        self.init_discs(n)

    def draw_rods(self):
        for pos in self.positions.values():
            self.t.penup()
            self.t.goto(pos, -120)
            self.t.pendown()
            self.t.pensize(8)
            self.t.setheading(90)
            self.t.forward(160)
            # Draw base
            self.t.penup()
            self.t.goto(pos - 60, -120)
            self.t.pendown()
            self.t.setheading(0)
            self.t.forward(120)

    def create_disc(self, size):
        disc = turtle.Turtle()
        disc.speed(0)
        disc.penup()
        disc.color("black")
        return disc

    def draw_disc(self, disc_turtle, x, y, size):
        disc_turtle.goto(x - size * 15, y)
        disc_turtle.pendown()
        width = size * 30
        height = 20
        for _ in range(2):
            disc_turtle.forward(width)
            disc_turtle.left(90)
            disc_turtle.forward(height)
            disc_turtle.left(90)
        disc_turtle.penup()

    def init_discs(self, n):
        for i in range(n, 0, -1):
            disc = self.create_disc(i)
            x = self.positions["left"]
            y = -100 + (n - i) * 25
            self.draw_disc(disc, x, y, i)
            self.stacks["left"].append(i)
            self.discs[i] = disc

    def clear_disc(self, disc_turtle):
        disc_turtle.clear()

    def move_disk(self, from_pole, to_pole):
        if not self.stacks[from_pole]:
            print(f"Error: No disk on {from_pole} pole")
            return
            
        disk_size = self.stacks[from_pole].pop()
        self.stacks[to_pole].append(disk_size)

        disc_turtle = self.discs[disk_size]
        
        # Clear current disc
        self.clear_disc(disc_turtle)
        
        # Animate movement: up -> across -> down
        from_x = self.positions[from_pole]
        to_x = self.positions[to_pole]
        
        up_y = 80
        self.draw_disc(disc_turtle, from_x, up_y, disk_size)
        time.sleep(0.3)
        self.clear_disc(disc_turtle)
        
        self.draw_disc(disc_turtle, to_x, up_y, disk_size)
        time.sleep(0.3)
        self.clear_disc(disc_turtle)
        
        final_y = -100 + (len(self.stacks[to_pole]) - 1) * 25
        self.draw_disc(disc_turtle, to_x, final_y, disk_size)
        
        print(f"Move disk {disk_size} from {from_pole} to {to_pole}")
        time.sleep(0.5)

    def display_state(self):
        print(f"Left: {self.stacks['left']}")
        print(f"Center: {self.stacks['center']}")
        print(f"Right: {self.stacks['right']}")
        print("---")

# Step 5: Run the visualization
try:
    h = Hanoi(3)
    h.display_state()
    
    print("\nStarting Tower of Hanoi animation...")
    for i, (from_pole, to_pole) in enumerate(moves, 1):
        print(f"\nMove {i}:")
        h.move_disk(from_pole, to_pole)
        h.display_state()
    
    print("\nTower of Hanoi completed!")
    print("Click on the window to close.")
    h.screen.exitonclick()
    
except Exception as e:
    print(f"Error: {e}")
    turtle.done()