# Full local two-shell Euclidean witness

There is no local Euclidean obstruction, even after retaining both off-cap
points from each critical shell.  The following exact algebraic configuration
has all eleven named points in strict convex position.

Put

\[
P(t)=(t,t^2)
\]

and define the points by the following parameters, in increasing order:

\[
\begin{array}{c|c}
\text{point}&t\\ \hline
O&-21/10\\
g&-5/4-\sqrt{59}/20\\
e&-1-\sqrt{26}/10\\
h&-5/4+\sqrt{59}/20\\
f&-1+\sqrt{26}/10\\
a&1-\sqrt{186}/10\\
u&5/4-\sqrt{603}/20\\
c&8/5\\
d&17/10\\
b&1+\sqrt{186}/10\\
v&5/4+\sqrt{603}/20.
\end{array}
\]

Thus the counterclockwise hull order is exactly

```text
O, g, e, h, f, a, u, c, d, b, v.
```

The vertical line \(x=-2/5\) strictly separates

```text
outside: O, g, e, h, f
cap:     a, u, c, d, b, v.
```

In particular, the six required roles occupy one strict cap avoiding the
apex \(O\); both `a,c,b` and `u,d,v` occur in the required cap order; and
`e,f,g,h` are all outside that cap.

For parabola points,

\[
 |P(s)-P(t)|^2=(s-t)^2\bigl(1+(s+t)^2\bigr).
\]

Direct exact simplification gives

\[
\begin{aligned}
 |Oa|^2=|Ob|^2 &=341/16,\\
 |Ou|^2=|Ov|^2 &=957899/40000,\\
 |ca|^2=|cb|^2=|ce|^2=|cf|^2 &=39/4,\\
 |du|^2=|dv|^2=|dg|^2=|dh|^2 &=446571/40000.
\end{aligned}
\]

Hence `e,f` are two distinct off-cap points on the circle centered at `c`
through `a,b`, and `g,h` are two distinct off-cap points on the circle
centered at `d` through `u,v`.

Strict convex independence is also exact.  For \(r<s<t\),

\[
\operatorname{orient}(P(r),P(s),P(t))
  =(s-r)(t-r)(t-s)>0.
\]

Consequently the displayed increasing parameter order, closed by the edge
from `v` to `O`, is a strictly convex polygon.  Equivalently, each point is
exposed by its parabola tangent

\[
y=2t x-t^2,
\qquad
s^2-(2ts-t^2)=(s-t)^2>0\quad(s\ne t).
\]

The exact checker verifies the radical order, cap separation, every distance
identity, all 165 increasing-triple orientations, and all 99 nonincident
supporting-edge determinants:

```bash
uv run python scratch/full-local-euclidean-model/check_model.py
```

This is only a local Euclidean/cyclic-order witness.  It does not assert the
global production packet fields (MEC, global distance-class restrictions,
deletion minimality, or any other nonlocal hypothesis).
