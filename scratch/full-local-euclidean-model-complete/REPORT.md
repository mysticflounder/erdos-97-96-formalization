# Complete local four-class Euclidean witness

There is no local Euclidean obstruction after retaining all four required
four-point distance classes.  The construction below is entirely rational,
has fifteen distinct points in strict convex position, places the six named
cap roles in one strict cap, and has no unwanted fifth point in any designated
class.

## Rational construction

Write

\[
U(t)=\left(\frac{1-t^2}{1+t^2},\frac{2t}{1+t^2}\right).
\]

Thus \(|U(t)|=1\) for every rational \(t\).  If
\(R_t\) denotes rotation by the rational unit complex number \(U(t)\), put

\[
O=(0,0),\qquad R_1=10,\qquad R_2=\frac{431}{43},
\]

\[
\begin{aligned}
a&=R_1U(-7/10), & b&=R_1U(3/17),\\
u&=R_2U(-4/11), & v&=R_2U(7/10),\\
c&=\frac7{11}(a+b),&
d&=\frac56(u+v).
\end{aligned}
\]

The four additional apex-shell points are

\[
\begin{aligned}
i&=R_1U(88/97), &j&=R_1U(73/87),\\
k&=R_2U(59/67), &l&=R_2U(86/95).
\end{aligned}
\]

The four blocker-shell off-cap points are

\[
\begin{aligned}
e&=c+R_{-48/91}(a-c),&
f&=c+R_{-9/95}(a-c),\\
g&=d+R_{-1}(u-d),&
h&=d+R_{-27/32}(u-d).
\end{aligned}
\]

Every coordinate is rational.  The exact checker prints the expanded
coordinate pairs.

## Cap and cyclic order

The exact counterclockwise hull order is

```text
O, e, f, a, u, c, d, b, v, j, k, l, i, g, h.
```

The rational line \(x=3\) strictly separates

```text
cap (x > 3):     a, u, c, d, b, v
outside (x < 3): O, e, f, j, k, l, i, g, h.
```

Thus `a,c,b` and `u,d,v` have the required relative cap order.  All eight
additional shell points are outside the cap.

The checker verifies all 195 nonincident supporting-edge determinants and all
\(\binom{15}{3}=455\) ordered-triple determinants exactly over
\(\mathbb Q\).  Every determinant is positive; the smallest is

\[
\frac{13458371304069}{2075414877378445}>0.
\]

Hence every carrier point is a vertex of one strictly convex polygon.

## Four exact carrier-level classes

The complete carrier-level equality classes are exactly

\[
\begin{array}{c|c|c}
\text{center and representative}&\text{class}&\text{squared radius}\\ \hline
(O,a)&\{a,b,i,j\}&100\\
(O,u)&\{u,v,k,l\}&185761/1849\\
(c,a)&\{a,b,e,f\}&6500/121\\
(d,u)&\{u,v,g,h\}&27882168817/339692733.
\end{array}
\]

The equality-class computation ranges over all other points in the full
15-point carrier, so these assertions explicitly exclude an unwanted fifth
point.

Run:

```bash
uv run python scratch/full-local-euclidean-model-complete/check_model.py
```

## Full-target audit

The same exact computation shows that this is **not** a
`CounterexampleData` witness.  Its pinned multiplicities (largest
positive-radius class at each carrier center) are

```text
O=4 e=1 f=1 a=1 u=1 c=4 d=4 b=1 v=1
j=1 k=1 l=1 i=1 g=1 h=1.
```

Thus `CounterexampleData.nonempty` and `CounterexampleData.convex` hold, but
`CounterexampleData.K4` fails at twelve of the fifteen centers.  The local
construction creates four prescribed circles centered at only three carrier
points; it does not propagate a four-point circle to every vertex.

There is also a separate packet obstruction.  Exhaustive exact enumeration of
all two- and three-point enclosing-circle candidates gives the unique minimum
enclosing circle

\[
  \operatorname{MEC}(A)
  = B\left(
      \left(\frac{464725281}{210418694},\frac{706910}{2446729}\right),
      \sqrt{\frac{1724034771729}{18096007684}}
    \right),
\]

whose boundary is exactly \(\{a,l\}\).  It is the diameter branch, so the
three-distinct-boundary-point field `SurplusCapPacket.hCirc` cannot hold.
The arbitrary strict cap cut by \(x=3\) is therefore not a production
MEC-derived `CapTriple`.  Within the packet interface, `hA` and `hncol` hold,
but `hCirc` fails; consequently `partition`, `surplusIdx`, and `surplus`
cannot be instantiated as fields of such a packet.

The exact full four-classes also completely audit `CriticalShellSystem`.
Ignoring deletion-blocking for a moment, `shellAt` is already impossible for
sources \(O,c,d\), because none lies on any carrier-centered full four-class.
For \(i,j,k,l\), a shell through the source exists only at \(O\), but
`no_qfree` fails: deleting one point of one \(O\)-row leaves the other
four-point \(O\)-row intact.  The only source-to-center pairs satisfying both
the full-shell and blocker conditions are

```text
e->c, f->c, a->c, b->c, u->d, v->d, g->d, h->d.
```

Hence only eight of fifteen sources have a legal critical row, and no
`CriticalShellSystem` exists.

Finally, full deletion robustness holds at exactly one carrier center:
\(O\).  Its two disjoint four-point rows make it survive every single
deletion.  The centers \(c\) and \(d\) each carry only one four-point row, so,
for example, deleting \(a\) blocks \(c\), and deleting \(u\) blocks \(d\).
Every other carrier center lacks K4 even before deletion.  Therefore no three
distinct carrier apices can satisfy the three
`FullyDeletionRobustAt` hypotheses of the tri-apex interface.
Equivalently for the stronger terminal fields, only \(O\) satisfies
`ApexRichClassStructure` (via two distinct four-point radii); \(c,d\) have
only one four-point radius, and all other centers have multiplicity one.
The three fields `oppApex1_rich`, `oppApex2_rich`, and
`surplusApex_rich` can never hold simultaneously on this carrier.
Of the two remaining fields of
`FrontierAllLargeCapsTriApexRobustResidual`, the raw cardinal inequality
analog does hold, since there are fourteen non-robust carrier centers and
\(15\leq4\cdot14\).  The field `no_center_covers_all_apices` is not
instantiable without the missing MEC packet and its triangle.  For the ad hoc
local triple \((O,c,d)\), however, its analogous distance statement does hold:
no carrier point is equidistant from all three.  Thus neither of those last
two conditions is the obstruction; the three rich/robust-apex fields are.

The earliest genuinely global obstruction is therefore `CounterexampleData.K4`,
before the shell-system or tri-apex layers.  The mathematical pattern is a
sparse collection of locally engineered stars: four exact circles are
concentrated at three centers, with two circles sharing the robust center
\(O\), while the remaining twelve vertices are distance-generic.
