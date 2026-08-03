import sympy as s

br,bs,bu,bv,bw = s.symbols('br bs bu bv bw')
q1 = bs**3 - 2*bs**2*bu - bs**2*bw + bs*bu**2 + bs*bu*bw + bs*bw**2 - bu**2*bw
e2 = br**2*bs**3 - br**2*bs**2*bu - br**2*bs**2*bv + br**2*bs*bu*bv - br*bs**3*bu + br*bs**2*bu**2 + br*bs**2*bu*bv - br*bs*bu**2*bv - br*bs*bu**2*bw + br*bs*bu*bw**2 + br*bs*bv**2*bw + br*bu**2*bv*bw - br*bu*bv**2*bw - br*bu*bv*bw**2 - bs*bv**2*bw**2 + bu*bv**2*bw**2
e5 = br**2*bs**3 - br**2*bs**2*bu - br**2*bs**2*bv + br**2*bs*bu*bv + br**2*bs*bu - br**2*bu*bv - br*bs**3 + br*bs**2*bu + br*bs**2*bv - br*bs*bu**2 - br*bs*bu*bv + br*bu**2*bv + bs*bu*bv**2 - bs*bv**2 - bu**2*bv**2 + bu*bv**2
e7 = bs**3*bu - bs**3 - bs**2*bu**2 - bs**2*bu*bv + bs**2*bu + bs**2*bv + bs*bu**2*bv + bs*bu*bv - bs*bu - bs*bv**2 - bu**2*bv + bu*bv
e8 = bs**2*bv*bw - bs**2*bw**2 + bs**2*bw - bs**2 - bs*bv**2*bw + bs*bv*bw**2 - bs*bv*bw + bs*bv + bv**2*bw - bv*bw
e9 = br**2*bv + br*bs**2*bv - br*bs**2 - br*bs*bv**2 + br*bs*bv - br*bv**2 - br*bv + bv**3
T = (bu-bs)*(br-bv)*bv*bw
gens=[q1,e2,e5,e7,e8,e9]
vars=(br,bs,bu,bv,bw)
def monoms(d):
    out=[]
    def rec(i,left,cur):
      if i==len(vars)-1:
        out.append(s.prod(v**e for v,e in zip(vars,cur+[left]))); return
      for e in range(left+1): rec(i+1,left-e,cur+[e])
    rec(0,d,[])
    # all degrees <= d
    return [s.Integer(1)] + [m for k in range(1,d+1) for m in monoms_exact(k)]
def monoms_exact(d):
    out=[]
    def rec(i,left,cur):
      if i==len(vars)-1:
        out.append(s.prod(v**e for v,e in zip(vars,cur+[left]))); return
      for e in range(left+1): rec(i+1,left-e,cur+[e])
    rec(0,d,[]); return out

for d in [1,2,3,4]:
  ms=monoms_exact(0)
  for k in range(1,d+1): ms += monoms_exact(k)
  coeff=[]; terms=[]
  for i,g in enumerate(gens):
    for j,m in enumerate(ms): coeff.append(s.symbols(f'c_{i}_{j}')); terms.append(coeff[-1]*m*g)
  expr=sum(terms)-T
  P=s.Poly(expr,*vars)
  eqs=[v for _,v in P.terms()]
  print('d',d,'unknowns',len(coeff),'eqs',len(eqs))
  sol=s.linsolve(eqs, coeff)
  print('solution',sol)
