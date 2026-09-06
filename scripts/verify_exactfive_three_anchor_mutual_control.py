"""Exact local geometric diagnostic, NOT a global K4 counterexample.
Uses only the Python standard library; all arithmetic is in Q(sqrt(3)).
"""
from fractions import Fraction as Q
from dataclasses import dataclass
from collections import defaultdict
import json

@dataclass(frozen=True)
class F:
    a: Q = Q(0)
    b: Q = Q(0)
    def __post_init__(self):
        object.__setattr__(self, 'a', Q(self.a))
        object.__setattr__(self, 'b', Q(self.b))
    @staticmethod
    def coerce(x):
        return x if isinstance(x,F) else F(x)
    def __add__(self,x):
        x=F.coerce(x);return F(self.a+x.a,self.b+x.b)
    __radd__=__add__
    def __neg__(self): return F(-self.a,-self.b)
    def __sub__(self,x):return self+-F.coerce(x)
    def __rsub__(self,x):return F.coerce(x)+-self
    def __mul__(self,x):
        x=F.coerce(x);return F(self.a*x.a+3*self.b*x.b,self.a*x.b+self.b*x.a)
    __rmul__=__mul__
    def __truediv__(self,x):
        x=F.coerce(x);den=x.a*x.a-3*x.b*x.b
        if not den: raise ZeroDivisionError
        return self*F(x.a/den,-x.b/den)
    def sign(self):
        a,b=self.a,self.b
        sgn=lambda v:(v>0)-(v<0)
        if not b:return sgn(a)
        if not a:return sgn(b)
        if sgn(a)==sgn(b):return sgn(a)
        t=a*a-3*b*b
        return sgn(a)*sgn(t)
    def approx(self):return float(self.a)+float(self.b)*3**.5

def p(x,y):return (F.coerce(x),F.coerce(y))
def add(a,b):return (a[0]+b[0],a[1]+b[1])
def sub(a,b):return (a[0]-b[0],a[1]-b[1])
def mul(t,a):return (t*a[0],t*a[1])
def dot(a,b):return a[0]*b[0]+a[1]*b[1]
def det(a,b):return a[0]*b[1]-a[1]*b[0]
def orient(a,b,c):return det(sub(b,a),sub(c,a))
def d2(a,b):return dot(sub(a,b),sub(a,b))
def rot(a,t):
    t=Q(t);C=(1-t*t)/(1+t*t);S=2*t/(1+t*t)
    return (C*a[0]-S*a[1],S*a[0]+C*a[1])
def on_circle(center,anchor,t):return add(center,rot(sub(anchor,center),t))

PARAM={
'u':Q(4432856,8475669359),'aL':Q(36513429,3104731786),
'U1':Q(591042141,6234621196),'U2':Q(282112402,2856435645),
'U3':Q(10613106,103310033),
'Q1':Q(474534572,3917650937),'Q2':Q(401199712,3206677129),
'Q3':Q(342025319,2649217302),
'd':Q(-238196094,2386367135),
'B1':Q(-192575633,9600655447),'B2':Q(-157483681,9763214379)}
A={}
h=Q(3,2);k=Q(1,50);sx=Q(207,200);sy=Q(-239,10000)
A['O']=p(0,-h);A['V']=p(sx,sy);A['W']=p(-sx,sy)
A['q']=p(-1,0);A['w']=p(1,0);A['c']=p(0,k)
# b is the lower equilateral placement attached to endpoint w.
A['b']=p(F(Q(1,2),-k/2),F(k/2,Q(-1,2)))
A['u']=on_circle(A['O'],A['q'],PARAM['u'])
A['aL']=on_circle(A['O'],A['q'],PARAM['aL'])
A['aR']=p(-A['aL'][0],A['aL'][1])
for name in ['U1','U2','U3']:
    A[name]=on_circle(A['V'],A['u'],PARAM[name])
for name in ['Q1','Q2','Q3']:
    A[name]=on_circle(A['V'],A['q'],PARAM[name])
A['d']=on_circle(A['c'],A['w'],PARAM['d'])
for name in ['B1','B2']:
    A[name]=on_circle(A['b'],A['w'],PARAM[name])
# Five generic points make the cap opposite W the unique largest cap.
# They are on a slight outward parabola along the existing hull edge b--d.
edge=sub(A['d'],A['b']);out=p(edge[1],-edge[0])
for i in range(1,6):
    t=Q(i,6)
    A[f'F{i}']=add(add(mul(1-t,A['b']),mul(t,A['d'])),mul(Q(1,10000000)*t*(1-t),out))

ORDER=['Q3','O','b','F1','F2','F3','F4','F5','d','aR','V','B1','B2',
       'w','c','q','u','W','aL','U1','U2','U3','Q1','Q2']
assert len(ORDER)==len(A)==24 and set(ORDER)==set(A)
assert len(set(A.values()))==24
# A strict supporting line for every consecutive edge certifies the entire
# listed cyclic order and strict convex independence, not just local turns.
edge_checks=[]
for i,a in enumerate(ORDER):
    b=ORDER[(i+1)%len(ORDER)]
    for x in ORDER:
        if x not in [a,b]:
            val=orient(A[a],A[b],A[x])
            assert val.sign()>0,('convexity',a,b,x,val.approx())
            edge_checks.append(val)

my=(sx*sx+sy*sy-h*h)/(2*(h+sy))
M=p(0,my);Rm2=d2(M,A['O'])
assert all(d2(M,A[x])==Rm2 for x in ['O','V','W'])
slack={name:Rm2-d2(M,point) for name,point in A.items()}
assert all(s.sign()>=0 for s in slack.values())
assert {name for name,s in slack.items() if s.sign()==0}=={'O','V','W'}
for a,b,c in [('O','V','W'),('V','O','W'),('W','O','V')]:
    assert dot(sub(A[b],A[a]),sub(A[c],A[a])).sign()>0
# The support triangle is acute and contains M; hence this containing disk
# is the minimum enclosing disk, with exactly these three boundary points.
assert all(orient(A[x],A[y],M).sign()>0 for x,y in [('O','V'),('V','W'),('W','O')])

# Open caps across the three supporting edges.
caps={}
for apex,x,y in [('O','V','W'),('V','W','O'),('W','O','V')]:
    sig=orient(A[x],A[y],A[apex]).sign()
    caps[apex]=set(name for name,point in A.items() if orient(A[x],A[y],point).sign()==-sig)
assert set.union(*caps.values())==set(A)-{'O','V','W'}
assert sum(map(len,caps.values()))==len(A)-3
assert len(caps['W'])>max(len(caps['O']),len(caps['V']))

def classes(center):
    out=defaultdict(set)
    for name,point in A.items():
        if name!=center:out[d2(A[center],point)].add(name)
    return dict(out)
def rich(center):return [s for s in classes(center).values() if len(s)>=4]
E={'q','w','u','aL','aR'}
Lu={'u','U1','U2','U3'};Lq={'q','Q1','Q2','Q3'}
Kc={'q','w','b','d'};Kb={'w','c','B1','B2'}
assert rich('O')==[E]
assert {frozenset(x) for x in rich('V')}=={frozenset(Lu),frozenset(Lq)}
assert rich('c')==[Kc]
assert rich('b')==[Kb]
I=E & caps['O'];assert I=={'u','q','w'}
assert Kc & caps['O']=={'q','w'}
assert 'c' in caps['O'] and 'b' not in caps['O']
assert d2(A['c'],A['w'])==d2(A['b'],A['c'])==d2(A['b'],A['w'])
assert dot(sub(A['q'],A['c']),sub(A['w'],A['c'])).sign()<0
r2=d2(A['O'],A['q']);rho2=d2(A['c'],A['q'])
assert (r2-rho2).sign()>0
assert (d2(A['q'],A['w'])-r2).sign()>0
assert (d2(A['u'],A['w'])-d2(A['q'],A['w'])).sign()>0
assert (r2-d2(A['u'],A['q'])).sign()>0

def V_survives(deleted):return any(len(S-set(deleted))>=4 for S in classes('V').values())
assert all(V_survives({x}) for x in A)
assert not V_survives({'u','q'})
assert V_survives({'q','w'}) and V_survives({'u','w'})
# Actual single-deletion criticality at b and c is verified for each row
# member, not merely advertised as a selected four-subset.
for center,row in [('b',Kb),('c',Kc)]:
    for x in row:
        assert not any(len(S-{x})>=4 for S in classes(center).values())
rich_centers={a:rich(a) for a in A if rich(a)}
assert set(rich_centers)=={'O','V','b','c'}
# The remaining centers have no rich row. In particular no actual blocker of
# u exists: its only rich incidence is at fully single-deletion-robust V.
actual_centers={a:S[0] for a,S in rich_centers.items() if len(S)==1 and len(S[0])==4}
assert set(actual_centers)=={'b','c'}
assert all('u' not in S for S in actual_centers.values())
summary={
 'status':'PASS: exact arithmetic; local diagnostic only',
 'point_count':len(A),
 'strict_supporting_edge_checks':len(edge_checks),
 'positive_edge_determinant_approx_min':min(x.approx() for x in edge_checks),
 'MEC_boundary':['O','V','W'],
 'MEC_radius_squared_exact':str(Rm2.a),
 'strict_cap_cardinalities':{a:len(S) for a,S in caps.items()},
 'strict_cap_members':{a:sorted(S) for a,S in caps.items()},
 'unique_surplus_apex':'W',
 'E':sorted(E),'I':sorted(I),
 'rich_rows':{a:[sorted(S) for S in rows] for a,rows in rich_centers.items()},
 'actual_nonrobust_centers':sorted(actual_centers),
 'V_bad_pair':['u','q'],'minimum_admissible_pair':['q','w'],
 'r_squared':str(r2.a),'rho_squared':str(rho2.a),
 'chord_qw_squared':str(d2(A['q'],A['w']).a),
 'global_K4':False,'total_H_possible':False,
 'missing_actual_blocker_for_third_anchor':'u',
 'coordinates_approx':{a:[t.approx() for t in point] for a,point in A.items()}}
print(json.dumps(summary,indent=2))
