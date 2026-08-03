import sympy as s
br,bs,bv,bw=s.symbols('br bs bv bw')
Q=br**2-br*bv+bv**2-br
C=bs**2-bs*bv-bv*bw**2+bv*bw
A2=br*bs**2+br*bs*bv-br*bs*bw-br*bs-br*bv**2+br*bv*bw-bs**2*bv+bs*bv*bw+bv**3-bv**2*bw
A3=br**2*bs-2*br*bs**2+bs**3-br**2*bw+br*bs*bw-bs**2*bw+bs*bw**2
A4=-br*bs**2+3*br*bs*bv-2*br*bs*bw-br*bs-br*bv**2+br*bv*bw+bs**3-3*bs**2*bv-bs**2*bw+2*bs**2+bs*bv**2+bs*bv*bw**2+3*bs*bv*bw-2*bs*bv+bv**3-bv**2*bw**2-4*bv**2*bw+bv*bw**2+2*bv*bw
print('start',flush=True)
G=s.groebner([Q,C,A2,A3,A4],br,bs,bv,bw,order='lex')
print('len',len(G.polys),flush=True)
for p in G.polys:
 f=s.factor(p.as_expr())
 if not (f.has(br) or f.has(bs)): print('ELIM',f)
