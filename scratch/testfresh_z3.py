from z3 import *
N='o r f t e y s x'.split(); X={n:Real(n+'x') for n in N};Y={n:Real(n+'y') for n in N}
s=Solver();
s.add(X['s']==0,Y['s']==0,X['e']==1,Y['e']==0)
def d2(a,b): return (X[a]-X[b])**2 +(Y[a]-Y[b])**2
# stars
for q,ls in [('s',['o','e','x','y']),('f',['o','e','r','t']),('e',['x','y','r','t'])]:
 for z in ls[1:]: s.add(d2(q,z)==d2(q,ls[0]))
# all edge orientation positive
for i,a in enumerate(N):
 b=N[(i+1)%8]
 for c in N:
  if c in (a,b):continue
  ori=(X[b]-X[a])*(Y[c]-Y[a])-(Y[b]-Y[a])*(X[c]-X[a]);s.add(ori>0)
for n in N:s.add(X[n]>-20,X[n]<20,Y[n]>-20,Y[n]<20)
print('start')
print(s.check())
if s.check()==sat:
 m=s.model(); print([(n,m[X[n]],m[Y[n]]) for n in N])
