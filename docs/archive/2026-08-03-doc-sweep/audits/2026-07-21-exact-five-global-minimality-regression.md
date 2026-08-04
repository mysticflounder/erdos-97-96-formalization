# Exact-five global-minimality regression — 2026-07-21

## Status

**EXACT WITHIN AN ABSTRACT 13-POINT FINITE METRIC MODEL.** This is not a
planar Euclidean realization, a minimum-enclosing-circle packet, or a Problem
97 counterexample.

The model shows that the production exact-five two-edge deletion-cover star,
global K4, a total deletion-critical map, cardinal minimality, the retained
apex rows, and the asymmetric two-hit normal form do not force either existing
exact-five terminal. Therefore another minimal-deletion, strong-connectivity,
or anonymous-fiber adapter is not a closing route.

## Exact finite model

Take `A = {0, ..., 12}`, with abstract apices `O1 = 11`, `O2 = 12`. At
centers `0, ..., 10`, use the exact four-classes

```text
K0  = {1,2,3,4}       K1  = {2,4,9,11}
K2  = {3,6,9,10}      K3  = {1,4,9,10}
K4  = {5,8,9,10}      K5  = {1,6,7,10}
K6  = {1,4,7,8}       K7  = {1,2,8,10}
K8  = {1,3,5,9}       K9  = {0,5,6,10}
K10 = {0,6,11,12}.
```

At the apices use

```text
T1 = {2,3,5,6,7,8}
E  = {0,1,2,6,9}.
```

The fixed critical map is

```text
H(0)=H(11)=H(12)=10,
H(i)=i-1 for 1 <= i <= 10.
```

Every source belongs to the exact four-class at its selected blocker, and
deleting the source leaves only three members there. Both apices are omitted
from the image of `H` and are singleton-deletion robust through `T1` and `E`.

Use the abstract cap sets

```text
C0 = {11,7,8,9,12}
C1 = {12,3,4,5,6,10}
C2 = {10,0,1,2,11}
```

and physical strict set `P = {0,1,2}`. The first-apex frontier pair is
`q=3`, `w=5`; retained rows may be chosen as

```text
B1 = {2,5,6,7}
B2 = {0,1,2,6}.
```

The deletion-cover star has hub `0` and spokes `1,2`. The actual physical-row
intersections are

```text
K_H(0) intersect P = {0}
K_H(1) intersect P = {1,2}
K_H(2) intersect P = {2}.
```

Thus the first spoke realizes the asymmetric two-hit arm with outside pair
`{3,4}`. That pair is not co-radial at `O1`. The only nontrivial fixed-`H`
fiber is `{0,11,12}` at blocker `10`, and no distinct exact class contains a
pair from that fiber, so neither constructor of `CriticalFiberClosingCore`
occurs.

Assign each displayed center a distinct rational radius in a sufficiently
short interval and assign every remaining unordered pair a distinct rational
distance in the same interval. Because the largest distance is less than
twice the smallest, all triangle inequalities are strict. The displayed
class is then the unique K4-capable radius class at every center. Exhaustive
enumeration of all `2^13 - 2 = 8190` nonempty proper subsets finds no
witness-closed subset. Hence the model satisfies the selected-witness form of
cardinal minimality, not merely strong connectivity of one row choice.

## Exact omission and consequence

The model deliberately omits:

- rank-two Euclidean coordinate realizability;
- one common strict-convex cyclic order and its Kalmanson inequalities;
- MEC containment and nonobtuse support-triangle semantics; and
- the geometric meaning of `R.noM44`.

Together with the complementary strict-convex/MEC local regression in
`2026-07-21-exact-five-asymmetric-local-regression.md`, it proves that neither
the global finite-metric side nor the local MEC/cap side closes marginally.
The next producer must couple the complete all-center source-indexed rows to
the common planar Euclidean/MEC geometry and return immediately one of:

1. first-apex co-radiality of the asymmetric outside pair;
2. a complete `CriticalFiberClosingCore R`; or
3. a complete alternative `SurplusCapPacket T` with `T.IsM44`.

No weaker minimality, connectivity, or fiber-existence packet is a justified
production target.

The exact model and all 8,190 subset checks replay with:

```bash
UV_CACHE_DIR=.uv-cache uv run --no-project \
  scratch/atail-force/exact-five-global-minimality-regression/verify_finite_metric_model.py \
  --check
```
