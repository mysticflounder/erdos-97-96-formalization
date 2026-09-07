# Exact-five partial-H control with a singleton third-anchor row

## Target and scope

**Target under investigation.** Can the retained mutual geometry be
contradicted using an actual singleton-trace blocker for u, K4 at the mutual
endpoint w, and endpoint blocker assignments that make c fresh?

**EMPIRICALLY VERIFIED, finite exact-arithmetic evidence.** The
[checker](../../scripts/verify_exactfive_partial_h_control.py) extends the
[32-point endpoint control](2026-09-06-exactfive-mutual-endpoint-control.md)
to 44 points. It supplies the actual partial assignment

H(q)=d1, H(w)=b, H(b)=c, H(c)=b, H(u)=d0.

Here an assigned blocker is a distinct carrier center whose unique full
rich distance class has exactly four members, contains the assigned source,
and loses K4 when that source is deleted. This is a partial function on
five sources, not the production `CriticalShellSystem` on the whole carrier.
In particular, c differs from H(q) and H(w) in this partial assignment.

The [retained output](../../certificates/exactfive_partial_h_control_20260906.json)
records a singleton third-anchor trace {u}. The corresponding row radius
is larger than r, the first-apex radius. Global K4 fails at 37 centers;
26 points have no actual blocker at all. Total H, the original physical
source, and unconditional exact-five closure are not established.

## Authenticated construction

The checker authenticates its adjacent 32-point parent with SHA-256
`1c3445ba21fdebc2c2ac9d3f77333b7bae630ed2e6c0e26ad523b92227faf542`.
That parent authenticates the original 24-point exact Q(√3) checker.
All parent points are retained unchanged. After adding points, the new
checker recomputes every ambient distance class and every supporting edge.

For v = V−aR, put out(v) = (vᵧ,−vₓ). Define

D(t) = (1−t)aR + tV + 10⁻⁸t(1−t)out(v),

d0 = D(1/3), d1 = D(2/3).

Let R(z) be the exact rational rotation with cosine (1−z²)/(1+z²) and
sine 2z/(1+z²). For zᵢ ∈ {−10⁻⁷,0,10⁻⁷}, add

Sᵢ = d0 + R(101/1000+zᵢ)(u−d0),

Jᵢ = d1 + R(127/1000+zᵢ)(q−d1).

The three S points lie between U2 and U3 in cyclic order; the three J
points lie between Q2 and Q3. The new centers d0,d1 lie between aR and V.
Four further points on the parent's b–d outward parabola, at parameters
9/12, 11/12, 1/24 and 3/24, keep W as the unique surplus apex.
These twelve additions, their exact coordinates, and the complete cyclic
order are recorded in the output.

## Finite verification

The checker verifies 1,848 strict supporting-edge/other-point orientation
inequalities. The entire carrier lies in the parent's minimum enclosing
disk, with precisely O,V,W on its boundary. The unchanged acute support
triangle certifies that disk. The strict cap counts are 6,17,18; the closed
counts are 8,19,20. W remains uniquely surplus.

The complete rich classes are:

| Center | Full ambient rich classes |
| --- | --- |
| O | {q,w,u,aL,aR} |
| V | {u,U1,U2,U3} and {q,Q1,Q2,Q3} |
| c | {q,w,b,d} |
| b | {w,c,B1,B2} |
| w | {T0,T1,T2,T3} |
| d0 | {u,S0,S1,S2} |
| d1 | {q,J0,J1,J2} |

All five assigned blockers above use these full classes on the 44-point
carrier. The checker verifies singleton criticality for every member of
every class at b,c,w,d0,d1. Thus the assignments retain actual deletion
behavior after the additions; they are not selected subsets of enlarged
classes. The two endpoints have distinct assigned centers d1 and b, and
c differs from both. The mutual incidences between Kb and Kc are unchanged.

O and V remain fully single-deletion robust. The first-apex class still
has exactly five members and I = {u,q,w}. Of the three pairs in I,
{u,q} fails joint V-deletion survival, while {q,w} and {u,w} survive.
The exact distance comparison makes {q,w} the minimum surviving pair,
and its chord exceeds r.

The row at d0 meets I in exactly {u}, d0 differs from O,V,b,c, and
dist(d0,u)² > r². Its radius therefore exceeds r. This finite control
does not justify a radius decrease from the singleton trace alone.

## Local selected-row mapping and the fresh source

The word "fresh" refers to two different roles here. The center c is new
relative to the partial endpoint centers d1,b. A source omitted by the
three selected rows can instead be chosen as b, with actual blocker
H(b)=c. The control does not identify c with that source.

For deleted = q, retained = w, and blocker = b, take the selected supports

B0 = E ∖ {q}, B1 = Kb, B2 = {u,U1,U2,U3}.

They have four members each at centers O,b,V. Both q and b are omitted
by all three supports; w belongs to B0 and B1 and is omitted by B2.
The checker verifies their equal-radius and deletion-survival facts and
the required two-row overlap bound. The partial actual blocker of q,
d1, differs from b and V. The partial actual blocker of the fresh source
b is c, which differs from O,b,V.

For deletion of the retained point w, the centers O,V have selected rows
E ∖ {w} and {q,Q1,Q2,Q3}. Both omit w, have cardinality four, and meet
in at most two points. The assigned blocker H(w)=b differs from O and V.

These are finite counterparts of selected-row fields, not production
objects. In particular, the O rows are four-subsets of the ambient
five-class. This agrees with the local selected-row requirement in
`U5QDeletedK4Class` (`U5GlobalIncidenceBasic.lean:243`), which stores
equal radii, cardinality and source omission without requiring full
ambient-class equality. The actual H rows above do satisfy full-class
exactness. Global K4 and total H remain necessary to instantiate the
production `CounterexampleData`, normal form and physical packets.

## Remaining full-source requirements

Exactly b,c,w,d0,d1 are nonrobust rich centers. Their full four-classes
cover only 18 of the 44 carrier points. The remaining 26 points have no
actual blocker. In particular, no blocker exists for O,V,W,d0 or d1.
Consequently the displayed partial assignment cannot extend to a total
critical-shell system on this carrier. The other 37 centers fail K4, so
the carrier is not a global K4 counterexample or a cardinality-minimal one.

The finite local obstruction now includes the singleton row and the stated
freshness assignment. It still omits the global hypotheses required by the
ordinary source. A contradiction must consume those missing requirements
or another consequence not satisfied here. The two pair-trace consumers
and the global singleton-trace consumer remain open.

Replay:

```bash
PYTHONDONTWRITEBYTECODE=1 uv run --no-cache --no-sync python scripts/verify_exactfive_partial_h_control.py
```

This is one finite exact control. It establishes no Lean declaration,
uniform source construction, or physical closure.
