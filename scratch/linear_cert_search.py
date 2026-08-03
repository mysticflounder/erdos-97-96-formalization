"""Find bounded-degree ideal certificate T=sum ai*fi modulo a prime."""
from itertools import product
from sympy import Poly, symbols

br, bs, bu, bv, bw = symbols("br bs bu bv bw")
xs=(br,bs,bu,bv,bw)
q1 = bs**3 - 2*bs**2*bu - bs**2*bw + bs*bu**2 + bs*bu*bw + bs*bw**2 - bu**2*bw
e2 = br**2*bs**3 - br**2*bs**2*bu - br**2*bs**2*bv + br**2*bs*bu*bv - br*bs**3*bu + br*bs**2*bu**2 + br*bs**2*bu*bv - br*bs*bu**2*bv - br*bs*bu**2*bw + br*bs*bu*bw**2 + br*bs*bv**2*bw + br*bu**2*bv*bw - br*bu*bv**2*bw - br*bu*bv*bw**2 - bs*bv**2*bw**2 + bu*bv**2*bw**2
e5 = br**2*bs**3 - br**2*bs**2*bu - br**2*bs**2*bv + br**2*bs*bu*bv + br**2*bs*bu - br**2*bu*bv - br*bs**3 + br*bs**2*bu + br*bs**2*bv - br*bs*bu**2 - br*bs*bu*bv + br*bu**2*bv + bs*bu*bv**2 - bs*bv**2 - bu**2*bv**2 + bu*bv**2
e7 = bs**3*bu - bs**3 - bs**2*bu**2 - bs**2*bu*bv + bs**2*bu + bs**2*bv + bs*bu**2*bv + bs*bu*bv - bs*bu - bs*bv**2 - bu**2*bv + bu*bv
e8 = bs**2*bv*bw - bs**2*bw**2 + bs**2*bw - bs**2 - bs*bv**2*bw + bs*bv*bw**2 - bs*bv*bw + bs*bv + bv**2*bw - bv*bw
e9 = br**2*bv + br*bs**2*bv - br*bs**2 - br*bs*bv**2 + br*bs*bv - br*bv**2 - br*bv + bv**3
fs=[q1,e2,e5,e7,e8,e9]
T=br*bs**2*bw**2*(bv-1)**2
P=[Poly(f,*xs, modulus=1000003) for f in fs]
PT=Poly(T,*xs, modulus=1000003)
def mons(d):
 out=[]
 for e in product(range(d+1), repeat=5):
  if sum(e)<=d: out.append(e)
 return out
def attempt(N):
 vars=[]; col_of={}
 for j,p in enumerate(P):
  D=N-p.total_degree()
  for m in mons(max(D,0)):
   col_of[(j,m)] = len(vars); vars.append((j,m))
 rows={}
 for c,(j,m) in enumerate(vars):
  for em,coef in P[j].terms():
   out=tuple(a+b for a,b in zip(em,m))
   if sum(out)<=N: rows.setdefault(out,{})[c]=(rows.setdefault(out,{}).get(c,0)+int(coef))%1000003
 # rhs target
 rhs={em:int(coef)%1000003 for em,coef in PT.terms()}
 monsrow=sorted(set(rows)|set(rhs))
 A=[]
 for em in monsrow:
  r=[0]*(len(vars)+1)
  for c,v in rows.get(em,{}).items(): r[c]=v
  r[-1]=rhs.get(em,0)
  A.append(r)
 # sparse-ish modular RREF, cap complexity
 piv=[]; row=0; M=1000003
 for c in range(len(vars)):
  k=next((k for k in range(row,len(A)) if A[k][c]),None)
  if k is None: continue
  A[row],A[k]=A[k],A[row]
  inv=pow(A[row][c],-1,M); A[row]=[(x*inv)%M for x in A[row]]
  for k2 in range(len(A)):
   if k2!=row and A[k2][c]:
    z=A[k2][c]; A[k2]=[(u-z*v)%M for u,v in zip(A[k2],A[row])]
  piv.append(c); row+=1
  if row==len(A): break
 bad=next((r for r in A if all(v==0 for v in r[:-1]) and r[-1]),None)
 if bad is not None: return len(vars),len(monsrow),len(piv),False,None
 x=[0]*len(vars)
 for i,c in enumerate(piv): x[c]=A[i][-1]
 nz=[(vars[c],v) for c,v in enumerate(x) if v]
 return len(vars),len(monsrow),len(piv),True,nz
for N in range(6,10):
 out=attempt(N); print(N, out[:4], "nz",len(out[4]) if out[4] else 0)
 print("flushed", flush=True)
 if out[3]:
  # print coefficient support summary only
  print(out[4][:20]); break
