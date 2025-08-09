```
pip install -U pyswip
```

```
from pyswip import Prolog
pl = Prolog()
# ---- using from pl file ----
pl.consult("<prolog-file>") # consult pl file
# ---- using directly ----
pl.asserta("<prolog-rule/fact>") # add at the top
pl.assertz("<prolog-rule/fact>") # add at the bottom
pl.retract("<prolog-rule/fact>") # remove the rule / fact
```
