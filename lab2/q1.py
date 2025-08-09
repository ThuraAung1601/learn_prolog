from pyswip import Prolog

pl = Prolog()
name, height, weight = input().split(";")
height = float(height)
weight = float(weight)

# BMI = weight (kg) / height^2 (cm)
bmi_result = None

# fact
pl.assertz(f"person({name}, {height}, {weight})")

# rule
pl.assertz(""" 
calculate_bmi(Person, BMI_value) :- 
        person(Person, Height, Weight),
        BMI_value is Weight / Height * Height
""")

# # method 1: use if else
# pl.assertz("""
# interpret_bmi(BMI, Meaning) :- 
#         BMI < 18.5 -> Meaning = underweight;
#         BMI < 25.0 -> Meaning = normalweight;
#         BMI < 30.0 -> Meaning = overweight;
#         Meaning = obese   
# """)

# # method 2: separate rule with unification
# pl.assertz(""" 
# interpret_bmi(BMI, Meaning) :- 
#            BMI < 18.5, Meaning = underweight
# """)
# pl.assertz(""" 
# interpret_bmi(BMI, Meaning) :- 
#            BMI < 25.0, Meaning = normalweight
# """)
# pl.assertz(""" 
# interpret_bmi(BMI, Meaning) :- 
#            BMI < 30.0, Meaning = overweight
# """)
# pl.assertz(""" 
# interpret_bmi(_, Meaning) :- 
#            Meaning = obese
# """)

# method 3: simple separate rule
pl.assertz(""" 
interpret_bmi(BMI, underweight) :- BMI < 18.5
""")
pl.assertz(""" 
interpret_bmi(BMI, normalweight) :- BMI < 25.0
""")
pl.assertz(""" 
interpret_bmi(BMI, overweight) :- BMI < 30.0
""")
pl.assertz(""" 
interpret_bmi(_, obese)
""")

for sol in pl.query(f"calculate_bmi({name}, BMI)"):
    print(sol)
    print(sol["BMI"])
    bmi_result = sol["BMI"]

for result in pl.query(f"interpret_bmi({bmi_result}, Meaning)"):
    print(result)
    print(result["Meaning"])