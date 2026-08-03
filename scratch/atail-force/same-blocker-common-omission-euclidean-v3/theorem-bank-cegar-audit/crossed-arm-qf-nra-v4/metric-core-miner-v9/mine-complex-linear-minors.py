#!/usr/bin/env python3
from itertools import combinations
import sympy as sp

zr,zs,zu,zv,zw,br,bs,bu,bv,bw=sp.symbols('zr zs zu zv zw br bs bu bv bw')
zvars=(zr,zs,zu,zv,zw)
f=[
 (zr-zw)*(br-bw)-(zs-zw)*(bs-bw),
 (zr-zw)*(br-bw)-(zu-zw)*(bu-bw),
 1-zs*bs,
 1-zw*bw,
 1-(zs-zu)*(bs-bu),
 1-(zs-zv)*(bs-bv),
 zr*br-zv*bv,
 (zv-1)*(bv-1)-(zw-1)*(bw-1),
 (zv-zr)*(bv-br)-(zv-1)*(bv-1),
 (zr-zu)*(br-bu)-(zr-1)*(br-1),
 (zu-zv)*(bu-bv)-(zu-1)*(bu-1),
]
rows=[]
for p in f:
    rows.append([sp.expand(p).coeff(x) for x in zvars]+[sp.expand(p).subs(dict.fromkeys(zvars,0))])
M=sp.Matrix(rows)
hits=[]
for idx in combinations(range(11),6):
    d=sp.factor(M[list(idx),:].det(method='domain-ge'))
    if d:
        ex=sp.expand(d)
        terms=len(ex.as_ordered_terms())
        hits.append((terms,sp.total_degree(ex),idx,d))
hits.sort(key=lambda x:(x[0],x[1]))
print(f'NONZERO_MINORS={len(hits)}')
for terms,deg,idx,d in hits[:80]:
    print(f'rows={tuple(i+1 for i in idx)} terms={terms} degree={deg} factor={d}')

print('FIVE_BY_FIVE_COEFFICIENT_MINORS')
hits5=[]
for idx in combinations(range(11),5):
    d=sp.factor(M[list(idx),:5].det(method='domain-ge'))
    if d:
        ex=sp.expand(d)
        hits5.append((len(ex.as_ordered_terms()),sp.total_degree(ex),idx,d))
hits5.sort(key=lambda x:(x[0],x[1]))
for terms,deg,idx,d in hits5[:60]:
    print(f'rows={tuple(i+1 for i in idx)} terms={terms} degree={deg} factor={d}')

# Localize at bs*bw (justified by f3,f4), substitute zs=1/bs, zw=1/bw.
remain=[0,1,4,5,6,7,8,9,10]
smallvars=(zr,zu,zv)
rows3=[]
for i0 in remain:
    p=sp.together(f[i0].subs({zs:1/bs,zw:1/bw})*bs*bw)
    p=sp.cancel(p)
    rows3.append([sp.expand(p).coeff(x) for x in smallvars]+[sp.expand(p).subs(dict.fromkeys(smallvars,0))])
M3=sp.Matrix(rows3)
print('LOCALIZED_FOUR_BY_FOUR_AUGMENTED_MINORS')
hits4=[]
for idx in combinations(range(9),4):
    d=sp.factor(M3[list(idx),:].det(method='domain-ge'))
    if d:
        ex=sp.expand(d)
        hits4.append((len(ex.as_ordered_terms()),sp.total_degree(ex),idx,d))
hits4.sort(key=lambda x:(x[0],x[1]))
for terms,deg,idx,d in hits4[:80]:
    print(f'rows={tuple(remain[i]+1 for i in idx)} terms={terms} degree={deg} factor={d}')
