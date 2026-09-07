# Exact-five mutual endpoint K4: a finite local control

## Target and scope

**Target under investigation.** Does the previously retained mutual local
geometry, strengthened by K4 at the shared endpoint e, force a contradiction?
Here K4 at a carrier point means that some positive-radius full ambient
distance class at that point has at least four members.

**EMPIRICALLY VERIFIED, finite exact-arithmetic evidence.** The
[checker](../../scripts/verify_exactfive_mutual_endpoint_control.py) constructs
a 32-point strictly convex carrier that satisfies that local strengthening.
Its [retained output](../../certificates/exactfive_mutual_endpoint_control_20260906.json)
has exactly five K4 centers, O,V,b,c,w, with e = w. It lacks global K4,
the total critical-shell system H, and the original fresh-center source.
It therefore does not refute a contradiction using those additional
hypotheses and does not close the physical residual.

## Construction and authentication

The checker authenticates and runs the earlier
[24-point checker](../../scripts/verify_exactfive_three_anchor_mutual_control.py)
with SHA-256
`41a95b68836059e9230b9f8ba305c40f345634e312cb541521aa10d93a9eaefb`.
That parent's exact Q(√3) field operations, coordinates, acute supporting
triangle and enclosing disk are retained. The parent audit is
[here](../skeptic-exactfive-three-anchor-mutual-control-2026-09-06.md).
Every distance class and every supporting edge is checked again after the
carrier is enlarged. The parent's old rich-row census is not reused.

Write x = Q3, v = O−x, and e = w for the parent coordinates. Let

t = ⟨e−x,v⟩/⟨v,v⟩, f = x+tv, a = e+(1+10⁻⁶)(f−e).

The checker verifies 0 < t < 1. It adds four points

Tᵢ = e + R(zᵢ)(a−e), with (z₀,z₁,z₂,z₃) = (−3,−1,1,3)·10⁻⁸,

where R(z) is the rational rotation with cosine (1−z²)/(1+z²) and
sine 2z/(1+z²). Thus all four squared distances from e agree exactly.
Their supporting-edge tests place them between Q3 and O in cyclic order.
All four lie strictly inside the unchanged minimum enclosing disk and
in the cap opposite V.

Four further points G₀,…,G₃ restore W as the unique surplus apex. For
s ∈ {1/12,3/12,5/12,7/12}, use the parent's outward parabola

G(s) = (1−s)b + sd + 10⁻⁷s(1−s)(dᵧ−bᵧ, bₓ−dₓ).

These points lie in the cap opposite W and are interleaved with the
parent's F points by increasing s. Their purpose is to retain the cap
designation required by the local control. The output records the exact
Q(√3) coordinates of all eight additions and the complete cyclic order.

## Checked properties and source failures

The checker verifies all 960 consecutive-edge/other-point strict orientation
inequalities. The unchanged acute triangle O,V,W supports the minimum
enclosing disk and comprises its entire boundary. The strict cap counts
are 6,11,12 and the closed counts are 8,13,14, respectively. Hence W is
still the unique surplus apex. There is no alternate boundary support
triangle that could change these cap counts.

The complete rich rows are:

| Center | Full ambient rich classes |
| --- | --- |
| O | {q,w,u,aL,aR} |
| V | {u,U1,U2,U3} and {q,Q1,Q2,Q3} |
| c | {q,w,b,d} |
| b | {w,c,B1,B2} |
| w | {T0,T1,T2,T3} |

The carrier retains I = {u,q,w}, the mutual incidences w,c ∈ Kb and
q,w,b ∈ Kc, their shared radius, and full single-deletion robustness at
O and V. Among the three pairs in I, {u,q} fails joint V-deletion survival;
{q,w} and {u,w} survive, with dist(q,w) < dist(u,w) and dist(q,w) > r.
Thus {q,w} remains the minimum admissible pair in I.

Exactly b,c,w have a unique rich four-class, and deleting any member of
that class destroys K4 at its center. None of these three classes contains
u. Hence the construction still has no actual blocker for u and cannot
support total H. The other 27 centers fail K4 altogether. Also c is the
only actual blocker for q. Any assignment of actual endpoint blockers on
this carrier would therefore have to assign q to c; a requirement that c
differ from that assigned blocker could not hold. No original total H or
physical/minimum-pair residual is instantiated by this control.

## Consequence for the closure route

The local mutual geometry plus K4 at e does not suffice for contradiction.
A proposed argument at e must use further global source hypotheses; the
new row alone supplies no contradiction or smaller physical packet.
The [actual H(u) trace producer](2026-09-06-exactfive-sharp-mutual-third-anchor.md)
continues to use a source object missing from this control. Its singleton
and two pair-trace contradiction consumers remain open.

The checker replays with:

```bash
PYTHONDONTWRITEBYTECODE=1 uv run --no-cache --no-sync python scripts/verify_exactfive_mutual_endpoint_control.py
```

This note concerns a single explicit configuration. It asserts no Lean
formalization, uniform construction, or unconditional exact-five closure.
