"""Independent algebra and exact-rational checks. Not a Lean/kernel audit."""
from fractions import Fraction as F
from itertools import product
import json
from pathlib import Path
import sympy as sp

HERE = Path(__file__).resolve().parent

def sqdist(a,b): return sum((x-y)**2 for x,y in zip(a,b))
def dot(a,b,o): return sum((x-z)*(y-z) for x,y,z in zip(a,b,o))
def cross(a,b,c):
    return (b[0]-a[0])*(c[1]-a[1])-(b[1]-a[1])*(c[0]-a[0])

u,v,x,y,z,t,c,h=sp.symbols('u v x y z t c h')
apex=(x-u)*(z-u)+(y+v)*(t+v)
positive=(1-u)*(1+x)*(1+z)+(1+u)*(1-x)*(1-z)+2*(u*u+v*v-1)+2*v*(y+t)+2*y*t
assert sp.expand(2*apex-positive)==0
chord=(x-z)**2+(y-t)**2
r0=(x-c)**2+(y-h)**2; r1=(z-c)**2+(t-h)**2
assert sp.expand(chord-r0-r1+2*((x-c)*(z-c)+(y-h)*(t-h)))==0
print('PASS: both polynomial identities vanish exactly in SymPy')

# This finite grid checks the signs used by the certificate; the polynomial
# identities above, not the grid, underlie the general proof.
grid=[F(k,3) for k in range(-3,4)]
heights=[F(1,10),F(1,2),F(1)]
count=0
for uu,vv,xx,zz,yy,tt in product(grid,[F(1),F(2)],grid,grid,heights,heights):
    assert uu*uu+vv*vv>=1
    assert dot((xx,yy),(zz,tt),(uu,-vv))>0
    count+=1
print(f'PASS: {count} exact-rational normalized acute-apex sign checks')

# Sharp family: nonobtuse MEC triangle O,L,R; q,w,c lie in its opposite
# strict minor cap. Everything is on the unit circle. Hence strict hull and
# the disk conditions can be checked exactly without a hull library.
sharp=[];edges=0
for den in range(3,103):
    eps=F(1,den);xx=(1-eps*eps)/(1+eps*eps); yy=2*eps/(1+eps*eps)
    O=(F(0),F(-1));L=(F(-1),F(0));R=(F(1),F(0))
    q=(-xx,yy);w=(xx,yy);c0=(F(0),F(1))
    poly=[O,R,w,c0,q,L]
    assert len(set(poly))==6
    for a0 in poly: assert sqdist(a0,(F(0),F(0)))==1
    for i in range(6):
        for j in range(6):
            if j in [i,(i+1)%6]: continue
            assert cross(poly[i],poly[(i+1)%6],poly[j])>0;edges+=1
    r2=sqdist(O,q);s2=sqdist(c0,q)
    assert r2==sqdist(O,w)==2+2*yy
    assert s2==sqdist(c0,w)==2-2*yy
    assert dot(q,w,O)>0 and dot(q,w,c0)<0
    assert 2*s2<=sqdist(q,w)<2*r2
    assert s2<r2
    sharp.append({'denominator':den,'radius_ratio_squared':str(s2/r2)})
print(f'PASS: {len(sharp)} strict-cap rational radius-drop examples; {edges} strict supporting-edge checks')
print('  family has s^2/r^2=(1-y)/(1+y) -> 1 as y -> 0; no uniform factor <1 follows')

# Removing strictness allows equality.
O=(F(0),F(-1));q=(F(-1),F(0));w=(F(1),F(0));cc=(F(0),F(1))
assert dot(q,w,O)==0 and dot(q,w,cc)==0
assert sqdist(O,q)==sqdist(cc,q)==2
# Removing the nonobtuse apex permits radius growth, even for a strict cap
# chain in the unit upper half-disk. Its original triangle is not nonobtuse.
O=(F(0),-F(1,10));q=(-F(99,100),F(3,200));w=(F(99,100),F(3,200));cc=(F(0),F(1))
assert sqdist(q,(0,0))<1 and sqdist(w,(0,0))<1
assert dot(q,w,cc)<0 and sqdist(cc,q)>sqdist(O,q)
print('PASS: negative controls show strictness and opposite-apex nonobtuseness are load-bearing')

# Independent four-point obstruction to the old 23-point model's two-MEC-apex
# interpretation. The center of a disk through O and P lies at M+lambda*n.
O=(F(0),-F(1,10));P=(F(1),F(0));q=(F(-1),F(0));d=(F(3401,3385),-F(416,3385))
M=tuple((a+b)/2 for a,b in zip(O,P));normal=(-(P[1]-O[1]),P[0]-O[0])
bounds={}
for name,A in [('q',q),('d',d)]:
    Acoef=sqdist(A,M)-sqdist(O,M)
    Bcoef=2*sum(n*(a-o) for n,a,o in zip(normal,A,O))
    assert Bcoef!=0
    bounds[name]=(Acoef/Bcoef,'lower' if Bcoef>0 else 'upper')
assert bounds['q']==(F(5),'lower')
assert bounds['d']==(-F(8,261),'upper')
assert bounds['q'][0]>bounds['d'][0]
print('PASS: old local model cannot share an enclosing boundary circle at O,P')
print('  q forces lambda >= 5; d forces lambda <= -8/261')

(HERE/'exact_checks.json').write_text(json.dumps({'sign_checks':count,'sharp_family_cases':len(sharp),'supporting_edges':edges,'disk_parameter_lower':str(bounds['q'][0]),'disk_parameter_upper':str(bounds['d'][0]),'scope':'Algebra/rational checks only; no full source realization or Lean build.'},indent=2)+'\n')
print('SCOPE: algebra and exact local geometry only; full physical exact-five leaf remains open.')
