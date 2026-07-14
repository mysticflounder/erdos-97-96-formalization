# Round-19 `(5,5,5)` MEC scalar core

Date: 2026-07-13

Status: **PROVEN at the scalar/angle boundary; the live geometric lift remains
open.**  The earlier optimizer result remains **NUMERICAL DISCOVERY ONLY**.

## Exact reduction

Normalize the Moser vertices as labels `0,1,2`, with labels `1` and `2`
separated by angle `pi/3` on the unit circle about `0`.  If the MEC disk and
saved cyclic order put labels `3,4` on that minor arc, write their angles as

```text
0 <= a <= b <= pi/3
```

and set

```text
x = a/2,
y = (b-a)/2,
z = (pi/3-b)/2.
```

Then `x,y,z >= 0` and `x+y+z = pi/6`.  The relevant chord lengths are

```text
r3  = dist(1,3) = 2 sin x,
r23 = dist(2,3) = 2 sin(y+z),
d34 = dist(3,4) = 2 sin y,
d24 = dist(2,4) = 2 sin z.
```

The three saved row intersections give one-sided reverse-triangle bounds:

1. Label `5` lies on the `3`-circle of radius `r3` and the `4`-circle of
   radius `1`, so `1 <= r3+d34`, hence `1-r3 <= d34`.
2. Label `6` lies on the `1`-circle of radius `1` and the `3`-circle of
   radius `r3`, while `dist(1,3)=r3`, so `1 <= 2*r3`, hence
   `1-r3 <= r3`.
3. Label `9` lies on the `2`-circle of radius `r23` and the `4`-circle of
   radius `1`, so `1 <= r23+d24`, hence `1-r23 <= d24`.

After substituting the chord formulas, these are exactly

```text
1 - 2 sin x       <= 2 sin y,
1 - 2 sin x       <= 2 sin x,
1 - 2 sin (y + z) <= 2 sin z.
```

Because `sin t <= t` for nonnegative `t`, they force

```text
x + y >= 1/2,
x     >= 1/4,
y + 2z >= 1/2.
```

Adding gives `2*(x+y+z) >= 5/4`.  But the left side is `pi/3`, while
`pi < 3.15` gives `pi/3 < 21/20 < 5/4`, a contradiction.

The same calculation rigorously bounds the max-min gate.  If `tau` is a
common lower bound for the three numerical margins, then

```text
(5/4) * (1 + tau) <= pi/3 < 21/20,
```

so `tau < -4/25 = -0.16`.  Thus the numerical optimum near
`-0.1701735873` has the correct sign, although that numerical value is not
itself certified optimal.

## Lean artifact

`residual_555_round19_mec_scalar_core.lean` proves, without `sorry`:

- `common_gate_margin_lt_neg_four_twentyfive`;
- `lower_chord_margins_incompatible`;
- `lower_circle_intersection_inequalities_incompatible`;
- `angle_lower_chord_margins_incompatible`; and
- `angle_lower_circle_intersection_inequalities_incompatible`.

A direct single-file Lean check passes.  Every printed theorem has axiom
closure exactly `[propext, Classical.choice, Quot.sound]`.

## Bank preflight

The mandatory `p97-rvol`, legacy `erdos/97`, and
`erdos-general-theorem/97` registries were searched for sine, arc,
circle-intersection, and triangle-inequality forms.  Indexed-corpus searches
were also run through `nthdegree docs search --lean`.

The only close semantic hit was
`Problem97.u5_unit_triangle_on_p_circle_incompatibility`, whose current
statement excludes four planar points with all six pairwise distances equal.
It does not map to round 19: the five saved rows do not supply the three
mutual equalities among any three points on one common-center circle.  The
first missing antecedent is therefore the complete equal-distance `K4`
pattern, so that theorem is not reused here.

## Exact remaining ingredient

To consume this scalar core on the live proof spine, one still needs a
kernel-checked geometric lift from the round-19 MEC/order packet to angles
`a,b` with

```text
0 <= a <= b <= pi/3
```

and the four chord identities above.  The three lower margins then follow
from ordinary triangle inequalities and the saved row equalities; no further
numerical optimization, exact-row exclusion, all-center `K4`, or second-hit
producer is needed for this residual.

Until that angle/chord lift is formalized and wired to the live carrier, this
artifact closes the scalar consumer but does **not** close a live `sorry`.
