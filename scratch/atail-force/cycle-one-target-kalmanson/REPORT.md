# Period-three cycle core plus one complete row: Kalmanson audit

Date: 2026-07-17

Status: **EXACT RATIONAL EUCLIDEAN COUNTERMODEL TO THE LOCAL
ONE-COMPLETE-ROW IMPOSSIBILITY.  THE UNCHANGED PERIOD-THREE SOURCE/BLOCKER
CORE ADMITS TWO DISTINCT OUTSIDE TARGETS COMPLETING `c0`'S EXACT `2+2`
ROW, WITH STRICT CONVEXITY, CAP SIDE, MEC CONTAINMENT, AND NAMED-CLASS
EXCLUSIONS.  INDEPENDENTLY, BOTH COMPLEMENTARY-CHAIN ORDER TYPES ARE EXACT
LRA SAT.  THIS DOES NOT INSTANTIATE THE GLOBAL CRITICAL SYSTEM OR RETAINED
PARENT.**

This lane owns only
`scratch/atail-force/cycle-one-target-kalmanson/`.  It did not edit production
Lean, plan documents, blueprint state, `ShellCurvature`, `surplusM44`, the
card-five lane, or the protected 555/654 lanes.  No Lean or Lake build was
run.

## Route correction and exact question

The initial one-outside-target question was retired before this audit.  The
externally exact ten-point model in
`scratch/atail-force/one-row-extension-countermodel/` already realizes:

```text
period-three co-radial source/blocker cycle
+ one outside-cap point on c0's source-radius circle.
```

The first stronger honest local surface is therefore one complete row.  The
distance abstraction here keeps the cyclic core

```text
o, left, q0, c0, c2, q1, c1, q2, right
```

and adds distinct complementary-chain vertices `x,y` with

```text
d(o,left) = d(o,q0) = d(o,q1) = d(o,q2) = d(o,right),
d(c0,q0) = d(c0,q1) = d(c0,x) = d(c0,y),
d(c1,q1) = d(c1,q2),
d(c2,q2) = d(c2,q0).
```

Thus `c0` has a complete named `2+2` row: same-cap sources `q0,q1` and
outside-cap targets `x,y`.  The encoding also requires that no other named
point joins either the physical `o` class or the `c0` row class.

The complementary chain has two order types after quotienting by reflection
and interchange of the unnamed outside targets:

```text
same-side:  o, x, y, left, q0, c0, c2, q1, c1, q2, right
split-side: o, x, left, q0, c0, c2, q1, c1, q2, right, y
```

The same-side type includes the reflected complementary component.  Exchanging
`x,y` covers their reverse order because the row gives them identical roles.

## Exact Euclidean follow-up: local target refuted

The LRA result below prompted a direct Euclidean search.  The first bounded
scan found a positive same-side extension without deforming the ten-point
seed at all.  Rational reconstruction then preserved the original exact
period-three core and changed only the second target angle.

`search_two_target_euclidean.py` gauge-fixes `o=(0,0)` and `left=(1,0)` and
parameterizes nine degrees of freedom:

```text
Moser apex angle;
three ordered source angles;
three blocker positions on their exact perpendicular-bisector rays;
two target angles on c0's exact source-radius circle.
```

It tests both complementary-chain order types and directly substitutes all
circle equalities.  Its feasibility score is the minimum of strict hull,
cap-side, circumdisk, distinctness, and exact-class-exclusion margins.  A
20,000-angle fixed-core scan found a same-side numerical witness; a 200-step
deformable differential-evolution probe also found positive same-side and
split-side candidates.  These numeric hits were discovery evidence only.
The exact same-side reconstruction below is the verdict-bearing artifact.

For rational `t`, write

```text
U(t) = ((1-t^2)/(1+t^2), 2t/(1+t^2))
```

and let `Rot(t)` be the rational rotation with the same cosine and sine
parameterization.  The exact points are

```text
o     = (0,0)
left  = U(0)
right = U(163/192)
q0    = U(4/231)
q1    = U(123/184)
q2    = U(3/4)

c0 = (45/86)   * (q0+q1)
c1 = (251/500) * (q1+q2)
c2 = (271/500) * (q2+q0)

x = c0 + Rot(-47/149) * (q0-c0)
y = c0 + Rot(-28/95)  * (q0-c0).
```

The exact counterclockwise boundary order is

```text
o, x, y, left, q0, c0, c2, q1, c1, q2, right.
```

`verify_two_target_exact.py` uses only `fractions.Fraction` and checks:

1. every non-edge point lies strictly left of every displayed boundary edge;
2. all eleven points are distinct;
3. the exact `o`-radius class is
   `{left,q0,q1,q2,right}`;
4. the exact `c0`-radius class is `{q0,q1,x,y}`;
5. `c1` bisects `q1,q2` and `c2` bisects `q2,q0`, with no other named point
   accidentally entering either incomplete row class;
6. `c0,c1,c2` retain their strict cap order and named source straddles;
7. both `x,y` lie strictly on `o`'s side of the endpoint chord while all
   strict physical-cap vertices lie on the other side;
8. every point lies in the exact circumdisk of `(o,left,right)`, with every
   nontriangle point strictly inside; and
9. the Moser triangle is nonobtuse by all three squared-side inequalities.

Replay:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/cycle-one-target-kalmanson/verify_two_target_exact.py
```

Recorded output:

```text
PASS: exact rational period-three cycle core plus complete c0 row
boundary=o,x,y,left,q0,c0,c2,q1,c1,q2,right
physical_class={left,q0,q1,q2,right}
c0_class={q0,q1,x,y}
x_rotation_t=-47/149
y_rotation_t=-28/95
min_strict_hull_margin=1715231162403/1193369583218474185
min_pairwise_dist_sq=48891308251134346/115756849572191995945
min_outside_cap_margin=4591422748917094880/13991224029253841599
min_physical_cap_margin=96196080/3385863241
min_mec_disk_margin_nontriangle=12295/427016
min_row0_class_exclusion=761545152/22486182167
min_other_row_exclusion=9048841/3061562500
row0_radius_sq=284751763277/966905833181
```

This is an externally exact Euclidean model, not a floating-point witness.
It is not yet a Lean kernel theorem.  It decisively refutes any direct-`False`
lemma whose hypotheses are only this local cycle core plus one complete row.
It does **not** refute direct `False` from the retained parent: `c1,c2` do not
yet have their two outside targets, and the model has no total
`CriticalShellSystem`, global K4/deletion criticality, minimality, `noM44`, or
first-apex frontier.

## Required theorem-bank preflight

Before constructing the finite distance system, this lane checked the bank
registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches covered strict Kalmanson inequalities, cyclic
quadrilateral shell equalities, perpendicular-bisector cap order, and
equal-radius critical rows.  The closest current results are the two generic
strict inequalities and the three-row terminal

```lean
CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities
```

in `ATail/CapCrossingKalmanson.lean`.  That terminal needs three specifically
overlapping shell rows on five ordered points.  One complete reverse row plus
the two source-pair bisectors does not produce its cross-row equalities.  No
bank entry supplies the missing overlap.

## Ordinal strict-distance closure

`audit.py` first quotients all named distance terms by the four equality
groups above.  For every cyclic quadruple it adds both strict Kalmanson
inequalities.  Whenever one term on the strict left side is already equal to
one term on the right side, it cancels them to obtain a directed strict
comparison between the remaining distance classes.  It then computes the
transitive closure and rejects either an equal-sum strict inequality or a
strict cycle.

Exact result:

| order type | distance classes | direct comparisons | transitive comparisons | result |
|---|---:|---:|---:|---|
| same-side | 46 | 81 | 159 | no strict cycle |
| split-side | 46 | 80 | 151 | no strict cycle |

This is an exhaustive ordinal cancellation closure for the stated equality
surface, not a heuristic scan.  It does not prove feasibility by itself; the
full LRA ledger below does.

## Full linear Kalmanson system

For each order type, `audit.py` introduces all 55 unordered distance
variables and asserts:

- positive distances;
- all 495 metric triangle inequalities;
- nine independent equalities generating the four shell-equality groups;
- 11 exact named-class exclusions: five points off the physical `o` class
  and six points off the complete `c0` class; and
- both strict Kalmanson inequalities for every increasing quadruple, 660
  inequalities total.

All strict inequalities and disequalities are normalized to rational gap at
least one.  This loses no solution in this homogeneous finite system: any
strict feasible solution can be scaled by the reciprocal of its least
positive margin.

Z3 4.16.0 (`QF_LRA`) returned SAT for both order types.  The solver models
were converted to exact rational values and replayed independently from
`ledgers.json` using `fractions.Fraction`; the replay does not call Z3.

| order type | variables | triangles | strict Kalmanson | minimum Kalmanson slack | result |
|---|---:|---:|---:|---:|---|
| same-side | 55 | 495 | 660 | 1 | exact rational ledger passes |
| split-side | 55 | 495 | 660 | 1 | exact rational ledger passes |

Representative equal-radius values are:

| order type | physical radius | complete `c0` row radius | `d(x,y)` |
|---|---:|---:|---:|
| same-side | 24 | 17 | 6 |
| split-side | 21 | 29/2 | 12 |

The complete 110-entry rational ledger is tracked in `ledgers.json`.

Replay:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/cycle-one-target-kalmanson/verify_ledgers.py
```

Recorded output:

```text
same_side: PASS variables=55 triangles=495 strict_kalmanson=660 min_slack=1
split_side: PASS variables=55 triangles=495 strict_kalmanson=660 min_slack=1
PASS: exact rational Kalmanson ledgers; no Euclidean realization claimed
```

The generation/ordinal replay is:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/cycle-one-target-kalmanson/audit.py
```

The script includes a hand-checkable SAT strict-Kalmanson four-point smoke
ledger and an UNSAT all-equal-distance smoke instance before solving the live
systems.

## What the linear audit decides

The result is decisive only for the stated linear abstraction:

```text
period-three source/blocker cycle
+ one complete exact named 2+2 row
+ cyclic order
+ all triangle inequalities
+ all strict Kalmanson inequalities
```

is compatible.  Therefore neither ordinal strict-distance closure nor a
rational Farkas combination of those linear constraints can close this
surface.  Adding a second outside target to the one-target countermodel does
not, at the abstract-distance level, reach the existing three-row Kalmanson
consumer.

The ledgers themselves do **not** prove Euclidean realizability.  That trust
boundary remains important for the split-side order, for which only an LRA
ledger is supplied.  The separate exact rational construction above does
prove Euclidean realizability for the same-side order, including the local
MEC/cap packet.  Neither result is a countermodel to the full all-reverse leaf
because both omit the global parent fields and complete `c1,c2` rows.

The next faithful local threshold is simultaneous completion of all three
source-indexed `2+2` rows, where cross-row equality cancellations or genuine
Euclidean interference could occur.  If that full three-row surface is also
realizable, the next target must use the global `CriticalShellSystem` and
deletion/minimality coupling.  One complete row should be retired as a
nominated direct-`False` producer.

## Epistemic status

| Claim | Status |
|---|---|
| One-target impossibility | **REFUTED by predecessor exact Euclidean model** |
| One-complete-row local impossibility | **REFUTED by the exact eleven-point rational Euclidean model above** |
| Ordinal closure of one complete row | **EXACTLY SAT/not contradictory in the stated abstraction** |
| Full triangle + Kalmanson LRA for one complete row | **EXACTLY SAT with independently replayed rational ledgers** |
| Same-side LRA order is Euclidean planar/MEC realizable | **PROVEN externally exactly by the separate coordinate model** |
| Split-side LRA ledger is Euclidean realizable | **NOT CLAIMED** |
| Full three-row period-three Kalmanson surface | **NOT TESTED HERE; next local threshold** |
| Full retained parent plus all-reverse membership | **OPEN** |
| Production `sorry` closed by this lane | **NONE** |
