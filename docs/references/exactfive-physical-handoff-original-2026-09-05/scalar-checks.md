# Scalar identity replay

The general scalar identities are proved algebraically in the accompanying prose and unelaborated Lean scripts. This independent Python check uses SymPy for polynomial identities and Fraction for finite rational cases. Finite cases alone are not a general proof.

```python
from fractions import Fraction as F
from itertools import product
import sympy as S
h,u,v,x,y=S.symbols('h u v x y')
assert S.expand(x*x+y*y-u*u-v*v-((x-h)**2+y*y-(u-h)**2-v*v)-2*h*(x-u))==0
assert S.expand(h*h-((u-h)**2+v*v)-(2*u*(h-u)+u*u-v*v))==0
checks=0;sidechecks=0
for uu,du,vv,t in product([F(1),F(2),F(3)],[F(1,10),F(1,5),F(1,3)],[F(1,4),F(1,3),F(1,2)],[F(-3),F(-2),F(-1),F(-1,2),F(0),F(1,2),F(1),F(2),F(3)]):
 hh=uu+du; vv=uu*vv
 a,b=uu-hh,vv;co=(1-t*t)/(1+t*t);si=2*t/(1+t*t)
 xx=hh+co*a-si*b; yy=si*a+co*b
 assert (xx-hh)**2+yy*yy==(uu-hh)**2+vv*vv
 assert xx*xx+yy*yy-(uu*uu+vv*vv)==2*hh*(xx-uu)
 assert (uu-hh)**2+vv*vv<hh*hh
 checks+=1
 if xx<uu:
  assert xx*xx+yy*yy<uu*uu+vv*vv;sidechecks+=1
print('PASS: two polynomial identities checked symbolically.')
print(f'PASS: {checks} exact rational circle cases; {sidechecks} strict inner-side cases.')
print('SCOPE: scalar identities and finite checks, not a Lean elaboration or full-leaf contradiction.')
```

```text
PASS: two polynomial identities checked symbolically.
PASS: 243 exact rational circle cases; 86 strict inner-side cases.
SCOPE: scalar identities and finite checks, not a Lean elaboration or full-leaf contradiction.
```
