# Exact-five consult: executable replay bundle

Consult: `01M1VWHAP9H4ESQDKD9NGVSJB4`. Date: September 6, 2026.

This is an exact 48-point LOCAL control, not a global K4 counterexample or a proof of full-source closure. Save each Python block under its heading in one directory. Run the construction, then the independent audit:

```bash
python double_anchor_control.py > double_anchor_replay.json
python independent_audit.py double_anchor_replay.json
```

Use Python 3.10 or later, without the -O option. No third-party packages are required. The scripts regenerate exact coordinates, all full ambient distance classes, 2208 supporting-edge checks, and 17296 cyclic-triple checks. The independent auditor uses a separate tuple/Fraction implementation.

## base_control.py

```python
"""Source 24-point exact local control; not a global K4 counterexample."""
from fractions import Fraction as Q
from dataclasses import dataclass
from collections import defaultdict
from itertools import combinations
import json

@dataclass(frozen=True)
class F:
    a: Q = Q(0)
    b: Q = Q(0)
    def __post_init__(self):
        object.__setattr__(self, 'a', Q(self.a))
        object.__setattr__(self, 'b', Q(self.b))
    @staticmethod
    def coerce(x): return x if isinstance(x,F) else F(x)
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
        a,b=self.a,self.b;sgn=lambda v:(v>0)-(v<0)
        if not b:return sgn(a)
        if not a:return sgn(b)
        if sgn(a)==sgn(b):return sgn(a)
        return sgn(a)*sgn(a*a-3*b*b)
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
A={};h=Q(3,2);k=Q(1,50);sx=Q(207,200);sy=Q(-239,10000)
A['O']=p(0,-h);A['V']=p(sx,sy);A['W']=p(-sx,sy)
A['q']=p(-1,0);A['w']=p(1,0);A['c']=p(0,k)
A['b']=p(F(Q(1,2),-k/2),F(k/2,Q(-1,2)))
A['u']=on_circle(A['O'],A['q'],PARAM['u'])
A['aL']=on_circle(A['O'],A['q'],PARAM['aL'])
A['aR']=p(-A['aL'][0],A['aL'][1])
for name in ['U1','U2','U3']:A[name]=on_circle(A['V'],A['u'],PARAM[name])
for name in ['Q1','Q2','Q3']:A[name]=on_circle(A['V'],A['q'],PARAM[name])
A['d']=on_circle(A['c'],A['w'],PARAM['d'])
for name in ['B1','B2']:A[name]=on_circle(A['b'],A['w'],PARAM[name])
edge=sub(A['d'],A['b']);out=p(edge[1],-edge[0])
for i in range(1,6):
    t=Q(i,6)
    A[f'F{i}']=add(add(mul(1-t,A['b']),mul(t,A['d'])),mul(Q(1,10000000)*t*(1-t),out))
ORDER=['Q3','O','b','F1','F2','F3','F4','F5','d','aR','V','B1','B2','w','c','q','u','W','aL','U1','U2','U3','Q1','Q2']
my=(sx*sx+sy*sy-h*h)/(2*(h+sy));M=p(0,my);Rm2=d2(M,A['O'])
E={'q','w','u','aL','aR'};Lu={'u','U1','U2','U3'};Lq={'q','Q1','Q2','Q3'}
Kc={'q','w','b','d'};Kb={'w','c','B1','B2'}

def classes(center, pts=None):
    pts=A if pts is None else pts;out=defaultdict(set)
    for name,point in pts.items():
        if name!=center:out[d2(pts[center],point)].add(name)
    return dict(out)
def rich(center,pts=None):return [s for s in classes(center,pts).values() if len(s)>=4]
def get_caps(pts):
    caps={}
    for apex,x,y in [('O','V','W'),('V','W','O'),('W','O','V')]:
        sig=orient(pts[x],pts[y],pts[apex]).sign()
        caps[apex]=set(n for n,v in pts.items() if orient(pts[x],pts[y],v).sign()==-sig)
    return caps

def verify(pts,order,extra_rich=None,all_triples=True,allow_u_blocker=False):
    assert len(pts)==len(order) and set(pts)==set(order)
    assert len(set(pts.values()))==len(pts)
    checks=0;minimum=float('inf')
    for i,a in enumerate(order):
        b=order[(i+1)%len(order)]
        for x in order:
            if x not in [a,b]:
                val=orient(pts[a],pts[b],pts[x])
                assert val.sign()>0,('convexity',a,b,x,val.approx())
                minimum=min(minimum,val.approx());checks+=1
    triples=0
    if all_triples:
        for a,b,c in combinations(order,3):
            assert orient(pts[a],pts[b],pts[c]).sign()>0,('triple',a,b,c)
            triples+=1
    slack={name:Rm2-d2(M,point) for name,point in pts.items()}
    assert all(s.sign()>=0 for s in slack.values())
    assert {name for name,s in slack.items() if s.sign()==0}=={'O','V','W'}
    for a,b,c in [('O','V','W'),('V','O','W'),('W','O','V')]:
        assert dot(sub(pts[b],pts[a]),sub(pts[c],pts[a])).sign()>0
    assert all(orient(pts[x],pts[y],M).sign()>0 for x,y in [('O','V'),('V','W'),('W','O')])
    caps=get_caps(pts)
    assert set.union(*caps.values())==set(pts)-{'O','V','W'}
    assert sum(map(len,caps.values()))==len(pts)-3
    assert len(caps['W'])>max(len(caps['O']),len(caps['V']))
    assert rich('O',pts)==[E]
    assert {frozenset(x) for x in rich('V',pts)}=={frozenset(Lu),frozenset(Lq)}
    assert rich('c',pts)==[Kc] and rich('b',pts)==[Kb]
    I=E&caps['O'];assert I=={'u','q','w'}
    assert Kc&caps['O']=={'q','w'}
    assert 'c' in caps['O'] and 'b' not in caps['O']
    assert d2(pts['c'],pts['w'])==d2(pts['b'],pts['c'])==d2(pts['b'],pts['w'])
    assert dot(sub(pts['q'],pts['c']),sub(pts['w'],pts['c'])).sign()<0
    r2=d2(pts['O'],pts['q']);rho2=d2(pts['c'],pts['q'])
    assert (r2-rho2).sign()>0
    assert (d2(pts['q'],pts['w'])-r2).sign()>0
    assert (d2(pts['u'],pts['w'])-d2(pts['q'],pts['w'])).sign()>0
    assert (r2-d2(pts['u'],pts['q'])).sign()>0
    def survives(c,deleted):return any(len(S-set(deleted))>=4 for S in classes(c,pts).values())
    assert all(survives('V',{x}) and survives('O',{x}) for x in pts)
    assert not survives('V',{'u','q'})
    assert survives('V',{'q','w'}) and survives('V',{'u','w'})
    for center,row in [('b',Kb),('c',Kc)]:
        for x in row:assert not survives(center,{x})
    rich_centers={a:rich(a,pts) for a in pts if rich(a,pts)}
    expected={'O','V','b','c'}|set(extra_rich or {})
    assert set(rich_centers)==expected, rich_centers
    for c,rows in (extra_rich or {}).items():
        assert {frozenset(s) for s in rich_centers[c]}=={frozenset(s) for s in rows}
    actual={a:S[0] for a,S in rich_centers.items() if len(S)==1 and len(S[0])==4}
    if not allow_u_blocker:
        assert all('u' not in row for row in actual.values())
    return {'status':'PASS exact local control, NOT global K4','point_count':len(pts),
    'strict_supporting_edge_checks':checks,'strict_cyclic_triples':triples,
    'min_edge_determinant_approx':minimum,'MEC_boundary':['O','V','W'],
    'MEC_radius_squared_exact':str(Rm2.a),
    'strict_cap_cardinalities':{a:len(S) for a,S in caps.items()},
    'strict_cap_members':{a:sorted(S) for a,S in caps.items()},
    'rich_rows':{a:[sorted(S) for S in rows] for a,rows in rich_centers.items()},
    'actual_nonrobust_centers':sorted(actual),'global_K4':False,
    'total_H_possible':False,'coordinates_approx':{a:[t.approx() for t in point] for a,point in pts.items()}}

if __name__=='__main__':print(json.dumps(verify(A,ORDER),indent=2))
```

## endpoint_control.py

```python
"""Exact extension: full K4 at mutual endpoint w; not a global K4 model."""
from base_control import *
from pathlib import Path
P=dict(A)
# Add a short circle arc centered at w outside the edge Q3--O.
v=sub(P['O'],P['Q3'])
t=dot(sub(P['w'],P['Q3']),v)/dot(v,v)
foot=add(P['Q3'],mul(t,v))
anchor=add(P['w'],mul(Q(100001,100000),sub(foot,P['w'])))
T=[Q(-3,1000000),Q(-1,1000000),Q(1,1000000),Q(3,1000000)]
for i,t in enumerate(T,1):P[f'J{i}']=on_circle(P['w'],anchor,t)
# Add four generic points to preserve W as the unique largest cap.
edge=sub(P['d'],P['b']);out=p(edge[1],-edge[0])
for name,t in [('G1',Q(1,12)),('G2',Q(3,12)),('G3',Q(7,12)),('G4',Q(9,12))]:
    P[name]=add(add(mul(1-t,P['b']),mul(t,P['d'])),mul(Q(1,10000000)*t*(1-t),out))
NEW_ORDER=['Q3','J1','J2','J3','J4','O','b','G1','F1','G2','F2','F3','G3','F4','G4','F5','d','aR','V','B1','B2','w','c','q','u','W','aL','U1','U2','U3','Q1','Q2']
summary=verify(P,NEW_ORDER,extra_rich={'w':[{'J1','J2','J3','J4'}]})
summary['endpoint']='w'
summary['endpoint_full_rich_row']=['J1','J2','J3','J4']
summary['endpoint_radius_squared_exact']=str(d2(P['w'],P['J1']).a)
summary['endpoint_radius_squared_approx']=d2(P['w'],P['J1']).approx()
summary['endpoint_radius_above_mutual_radius']=(d2(P['w'],P['J1'])-d2(P['w'],P['c'])).sign()>0
print(json.dumps(summary,indent=2))
```

## double_anchor_control.py

```python
"""48-point exact partial-H control, including full K4 at u and w.
NOT global K4, NOT total H, NOT an unconditional physical source.
"""
from base_control import *
from contextlib import redirect_stdout
import io, runpy
with redirect_stdout(io.StringIO()):
    parent=runpy.run_path(str(__import__('pathlib').Path(__file__).with_name('endpoint_control.py')))
P=dict(parent['P']);ORDER48=list(parent['NEW_ORDER'])

# Reconstruct the independently documented d0,d1 singleton/fresh assignment.
v=sub(P['V'],P['aR']);out=p(v[1],-v[0])
for name,t in [('d0',Q(1,3)),('d1',Q(2,3))]:
    P[name]=add(add(mul(1-t,P['aR']),mul(t,P['V'])),mul(Q(1,10**8)*t*(1-t),out))
for i,z in enumerate([Q(-1,10**7),Q(0),Q(1,10**7)],1):
    P[f'S{i}']=on_circle(P['d0'],P['u'],Q(101,1000)+z)
    P[f'T{i}']=on_circle(P['d1'],P['q'],Q(127,1000)+z)
for old,new in [('aR',['aR','d0','d1']),('U2',['U2','S1','S2','S3']),('Q2',['Q2','T1','T2','T3'])]:
    idx=ORDER48.index(old);ORDER48[idx:idx+1]=new
# Four unused parameters on the parent's surplus-cap parabola.
edge=sub(P['d'],P['b']);out=p(edge[1],-edge[0])
params={**{f'F{i}':Q(i,6) for i in range(1,6)},
        'G1':Q(1,12),'G2':Q(3,12),'G3':Q(7,12),'G4':Q(9,12),
        'L1':Q(1,24),'L2':Q(3,24),'L3':Q(5,24),'L4':Q(11,12)}
for name in ['L1','L2','L3','L4']:
    t=params[name]
    P[name]=add(add(mul(1-t,P['b']),mul(t,P['d'])),mul(Q(1,10**7)*t*(1-t),out))
i=ORDER48.index('b');j=ORDER48.index('d')
ORDER48[i+1:j]=sorted(params,key=lambda x:params[x])
assert len(P)==len(ORDER48)==44
extra={'w':[{'J1','J2','J3','J4'}], 'd0':[{'u','S1','S2','S3'}],
       'd1':[{'q','T1','T2','T3'}]}
summary44=verify(P,ORDER48,extra_rich=extra,allow_u_blocker=True)

# New strengthening: give the third anchor u its own full rich four-class.
# Its circle arc lies outside the currently exposed edge O--b.
v=sub(P['b'],P['O'])
t=dot(sub(P['u'],P['O']),v)/dot(v,v)
foot=add(P['O'],mul(t,v))
anchor=add(P['u'],mul(Q(100001,100000),sub(foot,P['u'])))
for i,t in enumerate([Q(-3,10**6),Q(-1,10**6),Q(1,10**6),Q(3,10**6)],1):
    P[f'Z{i}']=on_circle(P['u'],anchor,t)
i=ORDER48.index('O');ORDER48[i+1:i+1]=['Z1','Z2','Z3','Z4']
extra['u']=[{'Z1','Z2','Z3','Z4'}]
summary=verify(P,ORDER48,extra_rich=extra,allow_u_blocker=True)
partial_H={'q':'d1','w':'b','b':'c','c':'b','u':'d0'}
for source,center in partial_H.items():
    rows=rich(center,P)
    assert source!=center and len(rows)==1 and len(rows[0])==4 and source in rows[0]
    assert not any(len(S-{source})>=4 for S in classes(center,P).values())
assert 'c' not in [partial_H['q'],partial_H['w']]
assert not any(len(S-{'q','w'})>=4 for S in classes('O',P).values())
assert any(len(S-{'w'})>=4 for S in classes('d1',P).values())
assert any(len(S-{'q'})>=4 for S in classes('b',P).values())
assert rich('d0',P)[0]&{'u','q','w'}=={'u'}
assert (d2(P['d0'],P['u'])-d2(P['O'],P['q'])).sign()>0
actual={n:rich(n,P)[0] for n in P if len(rich(n,P))==1 and len(rich(n,P)[0])==4}
for center,row in actual.items():
    for source in row:
        assert not any(len(S-{source})>=4 for S in classes(center,P).values())
covered=set().union(*actual.values())
assert set(actual)=={'b','c','w','u','d0','d1'}
assert all(x not in covered for x in ['O','V','W','d0','d1'])
summary.update({
  'construction':'48-point double-anchor K4 and partial-H local control',
  'partial_H':partial_H,'fresh_c_for_partial_endpoint_assignment':True,
  'singleton_trace_Hu':['u'],'singleton_row_radius_squared_approx':d2(P['d0'],P['u']).approx(),
  'first_apex_radius_squared_approx':d2(P['O'],P['q']).approx(),
  'u_full_rich_row':['Z1','Z2','Z3','Z4'],
  'u_rich_radius_squared_approx':d2(P['u'],P['Z1']).approx(),
  'w_full_rich_row':['J1','J2','J3','J4'],
  'nonrich_centers':sorted(n for n in P if not rich(n,P)),
  'actual_row_coverage_count':len(covered),
  'sources_without_actual_blocker':sorted(set(P)-covered),
  'source_without_actual_blocker_count':len(set(P)-covered),
  'total_H_possible':False,'global_K4':False,'cardinality_minimal_global_K4':False,
  'original_physical_source_instantiated':False,
  'full_source_singleton_contradiction':False,
  'cyclic_order':ORDER48,
  'coordinates_exact':{n:[[str(x.a),str(x.b)] for x in P[n]] for n in ORDER48}
})
print(json.dumps(summary,indent=2))
```

## independent_audit.py

```python
"""Independent tuple/Fraction audit of the exact coordinate certificate.
No imports from the construction scripts. Standard library only.
"""
from fractions import Fraction as Q
from itertools import combinations
from collections import defaultdict
from pathlib import Path
import json, sys

def f(a=0,b=0):return (Q(a),Q(b))
def ad(x,y):return (x[0]+y[0],x[1]+y[1])
def ng(x):return (-x[0],-x[1])
def su(x,y):return ad(x,ng(y))
def mu(x,y):return (x[0]*y[0]+3*x[1]*y[1],x[0]*y[1]+x[1]*y[0])
def dv(x,y):
    den=y[0]*y[0]-3*y[1]*y[1]
    assert den
    return mu(x,(y[0]/den,-y[1]/den))
def sg(x):
    a,b=x
    if a==0:return (b>0)-(b<0)
    if b==0:return (a>0)-(a<0)
    if a>0 and b>0:return 1
    if a<0 and b<0:return -1
    delta=a*a-3*b*b
    if a>0:return (delta>0)-(delta<0)
    return (delta<0)-(delta>0)
def va(x,y):return (ad(x[0],y[0]),ad(x[1],y[1]))
def vs(x,y):return (su(x[0],y[0]),su(x[1],y[1]))
def dt(x,y):return ad(mu(x[0],y[0]),mu(x[1],y[1]))
def cr(x,y):return su(mu(x[0],y[1]),mu(x[1],y[0]))
def ori(x,y,z):return cr(vs(y,x),vs(z,x))
def d2(x,y):v=vs(x,y);return dt(v,v)

path=Path(sys.argv[1]) if len(sys.argv)>1 else Path(__file__).with_name('double_anchor_replay.json')
s=json.loads(path.read_text());A={n:tuple(f(*v) for v in xy) for n,xy in s['coordinates_exact'].items()}
order=s['cyclic_order'];assert len(A)==48 and set(order)==set(A) and len(order)==48
assert len(set(A.values()))==48
edges=0
for i,a in enumerate(order):
    b=order[(i+1)%48]
    for c in order:
        if c not in [a,b]:assert sg(ori(A[a],A[b],A[c]))==1;edges+=1
triples=0
for a,b,c in combinations(order,3):assert sg(ori(A[a],A[b],A[c]))==1;triples+=1
# Solve the two circumcenter equations independently.
O,V,W=[A[n] for n in ['O','V','W']]
v,w=vs(V,O),vs(W,O)
a=dv(su(dt(V,V),dt(O,O)),f(2));b=dv(su(dt(W,W),dt(O,O)),f(2));de=cr(v,w)
M=(dv(su(mu(a,w[1]),mu(v[1],b)),de),dv(su(mu(v[0],b),mu(a,w[0])),de))
R2=d2(M,O)
slacks={n:su(R2,d2(M,p)) for n,p in A.items()}
assert all(sg(x)>=0 for x in slacks.values())
assert {n for n,x in slacks.items() if sg(x)==0}=={'O','V','W'}
assert all(sg(ori(A[x],A[y],M))==1 for x,y in [('O','V'),('V','W'),('W','O')])
for x,y,z in [('O','V','W'),('V','O','W'),('W','O','V')]:assert sg(dt(vs(A[y],A[x]),vs(A[z],A[x])))==1
caps={}
for apex,x,y in [('O','V','W'),('V','W','O'),('W','O','V')]:
    side=sg(ori(A[x],A[y],A[apex]));caps[apex]={n for n,p in A.items() if sg(ori(A[x],A[y],p))==-side}
assert {n:len(c) for n,c in caps.items()}=={'O':6,'V':17,'W':22}
assert sum(map(len,caps.values()))==45 and set.union(*caps.values())==set(A)-{'O','V','W'}
C={}
for center,p in A.items():
    rows=defaultdict(set)
    for n,q in A.items():
        if n!=center:
            dist=d2(p,q);assert sg(dist)>0;rows[dist].add(n)
    C[center]=dict(rows)
rich={c:[r for r in rows.values() if len(r)>=4] for c,rows in C.items()}
rich={c:rows for c,rows in rich.items() if rows}
expected={c:{frozenset(row) for row in rows} for c,rows in s['rich_rows'].items()}
assert {c:{frozenset(row) for row in rows} for c,rows in rich.items()}==expected
assert set(rich)=={'O','V','b','c','u','w','d0','d1'}
actual={c:rows[0] for c,rows in rich.items() if len(rows)==1 and len(rows[0])==4}
assert set(actual)=={'b','c','u','w','d0','d1'}
def survives(center,deleted):return any(len(row-set(deleted))>=4 for row in C[center].values())
for c in ['O','V']:assert all(survives(c,{x}) for x in A)
for c,row in actual.items():
    for x in row:assert not survives(c,{x})
for x,c in s['partial_H'].items():assert x!=c and x in actual[c]
assert s['partial_H']=={'q':'d1','w':'b','b':'c','c':'b','u':'d0'}
assert actual['d0']&{'q','u','w'}=={'u'}
assert sg(su(d2(A['d0'],A['u']),d2(O,A['q'])))==1
E={'q','w','u','aL','aR'};assert rich['O']==[E] and E&caps['O']=={'q','w','u'}
assert not survives('V',{'u','q'}) and survives('V',{'q','w'}) and survives('V',{'u','w'})
assert not survives('O',{'q','w'})
assert sg(su(d2(A['u'],A['w']),d2(A['q'],A['w'])))==1
assert sg(su(d2(A['q'],A['w']),d2(O,A['q'])))==1
coverage=set().union(*actual.values());assert len(coverage)==22 and len(set(A)-coverage)==26
assert all(n not in coverage for n in ['O','V','W','d0','d1'])
print(json.dumps({'status':'PASS independent tuple-field audit','point_count':48,
 'supporting_edges':edges,'cyclic_triples':triples,'rich_centers':sorted(rich),
 'nonrich_centers':len(A)-len(rich),'actual_coverage':len(coverage),
 'no_actual_blocker':len(A)-len(coverage),'global_K4':False,'total_H_possible':False},indent=2))
```
