### Basic commands that you need to know:

```
from pyswip import Prolog # Standard import only Prolog class
```

```
pl = Prolog()  # Create instant of Prolog class in this example name pl
```

```
pl.consult("knowledge_base.pl") # This is how you consult external prolog file; we have no need for it for now.
```

```
pl.asserta("male(john)") # Add new knowledge or rule up front of everything
```

```
pl.assertz("male(oliver)") # Add new knowledge or rule behind of everything
```

```
pl.dynamic("male/1") # Informs the interpreter that the definition of the predicate(s) may change during execution
```

```
pl.retract("male(oliver)") # Removes the fact or clause from the database
```

```
pl.retractall("male(_)") # Removes all facts or clauses in the database where the head unifies.
```

```
pl.query("male(X)") # Run a prolog query and return a generator
```