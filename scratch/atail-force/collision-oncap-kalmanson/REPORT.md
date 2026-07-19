# On-cap collision Kalmanson audit

Date: 2026-07-17

Status: **KERNEL-CHECKED EXACT METRIC SURVIVOR.  THE FULL TRIANGLE + STRICT
KALMANSON + CAP-NONACUTE + PTOLEMY-INEQUALITY SHADOW IS FEASIBLE, SO THE TWO
ON-CAP CRITICAL ROWS DO NOT DIRECTLY CLOSE.  NO PRODUCTION `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/collision-oncap-kalmanson/`.  It does not edit production
Lean, generated files, closure documents, or protected lanes.

## Starting surface

The input is the on-cap arm of

```lean
LocalizedCollisionOnCapOutsidePairSeparation P L C
```

from `scratch/atail-force/mutual-omission-cycle-terminal/`.  Write

```text
A  = the localized collision's common blocker,
B  = the fresh source's actual blocker,
s1 = the chosen collision source,
s2 = the other collision source,
f  = the fresh source.
```

Both `A` and `B` lie in the same first opposite cap and are distinct.  The
complete critical row at `A` meets that cap in exactly `{s1,s2}`.  The complete
critical row at `B` contains `f`, meets the cap in at most two points, and
contributes at least one different unordered outside pair.  The previous
scratch theorem proves that the two outside-pair banks are disjoint.

The audit tests the strongest minimal-overlap instance of those facts:

```text
A-row support = {s1,s2,x,y}
B-row support = {f,s2,y,z}
```

Thus the two complete supports share exactly `s2,y`; the chosen collision
source `s1` is omitted by the `B` row; `f` is omitted by the `A` row; and the
outside pairs `{x,y}` and `{y,z}` are different.

## Required theorem-bank preflight

Before deriving or encoding the surface, this lane checked the registries
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section and the four-point Radon reserve;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches covered convex-quadrilateral Kalmanson inequalities,
equal-distance rows in one cap, outside-pair cap-center uniqueness, and the
localized mutual-omission cycle.  The relevant existing endpoints are:

- `CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw`;
- `CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw`;
- `ATailOrdinalKalmansonCycle.false_of_transGen_cycle`;
- `CapSelectedRowCounting.outsidePair_unique_capCenter`; and
- `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`.

No indexed or archived theorem consumes two **different** outside pairs from
two same-cap centers.  The production five-point Kalmanson terminal still
requires a third source-valid row, and `u1TwoLargeCapObstruction` still
requires its seven named metric equalities.

## Exact order audit

`audit_kalmanson.py` enumerates the induced named boundary orders.  Production
one-sided cap-distance injectivity first forces

```text
A between s1,s2,
B between f,s2.
```

There are fourteen resulting cap-role orders and six orders of `x,y,z`, for
84 cases.  For every case the audit installs:

1. positivity and all triangle inequalities;
2. both strict Kalmanson inequalities for every increasing cyclic quadruple;
3. exactness of the two displayed four-point supports on all eight labels;
4. every cap-chain nonacute inequality

   ```text
   d(i,k)^2 >= d(i,j)^2 + d(j,k)^2  for i < j < k
   ```

   on the first five cap labels.

The strict linear system is normalized to Kalmanson slack at least one.  Z3
works over exact rationals.  The exhaustive linear stage reports 72 UNSAT and
12 SAT orders; the twelve are the six outside-label orders in each of the two
orientations of one serial cap order.  The nonlinear cap-nonacute stage retains
an exact serial survivor.  Up to reversal, the surviving cap order is

```text
s1 < A < s2 < B < f.
```

This is exactly the smallest honest strict-order residual: the two isosceles
cap triples occur consecutively on opposite sides of their shared cap point.
It does **not** match any current direct-`False` consumer.

## Kernel-checked exact survivor

`OnCapKalmansonLinearModel.lean` scales one rational survivor by `32` and
kernel-checks an integer distance function on the boundary order

```text
s1 < A < s2 < B < f < x < y < z.
```

Lean proves by kernel `decide`:

- symmetry, zero diagonal, and positive off-diagonal distances;
- all triangle inequalities;
- both strict Kalmanson inequalities for every increasing quadruple;
- every squared-distance cap-nonacute inequality for the first five labels;
- the general Ptolemy metric inequality for every ordered quadruple;
- exactness of the `A` row at radius `448`;
- exactness of the `B` row at radius `2744`; and
- distinctness of the outside pairs `{x,y}` and `{y,z}`.

The independent rational replay records minimum slacks

```text
triangle                         0
strict Kalmanson                 1
cap nonacute squared             4
Ptolemy                        321/64  (among four distinct labels)
```

and pins the unscaled rational distance model with SHA-256

```text
0e8adc3138ad783710402c2501af0a02f547fbd367e4950e35a853124838ba9a.
```

The Lean theorems close over only `propext`, `Classical.choice`, and
`Quot.sound` (several use a strict subset of those axioms).  There is no
`sorry`, `admit`, custom axiom, `native_decide`, or unsafe declaration.

The same file also diagnoses the exact missing geometry.  The abstract
distance table satisfies every Ptolemy inequality, but the three-by-three
Gram determinant of the vectors `AB,Af,Ax` is negative.  In the unscaled
rational table it is

```text
-24062412211189 / 16384.
```

`gramDeterminantABfx_neg` kernel-checks the corresponding scaled integer
calculation.  Thus Ptolemy is still too weak; a true planar Gram/rank or
equivalent two-circle identity is the first metric property visibly absent
from this survivor.

There is a narrower row-specific version of that missing force.  Each actual
four-point critical support is cospherical, so Ptolemy is an **equality** for
its induced cyclic order.  `audit_kalmanson.py` contains the optional exact
`include_row_ptolemy` encoding for both rows.  An exploratory Z3 invocation
on the first serial order was manually interrupted after more than 60 seconds
without a verdict.  This was an operational timeout, not solver evidence of
SAT, UNSAT, or `unknown`.  The row-Ptolemy-equality system is therefore a
concrete next decision problem, not a result claimed by this lane.

## Exact route correction

The survivor is a finite metric/Kalmanson/cap-nonacute model.  It is **not**
claimed to embed in `ℝ²`, to arise from an MEC cap packet, to extend to a
global `CriticalShellSystem`, or to satisfy deletion minimality.  Therefore it
does not refute a full geometric closer.

It does refute the intended inference at the abstraction actually tested:

```text
two complete on-cap critical rows
+ different outside pairs
+ every triangle inequality
+ every strict convex-quadrilateral Kalmanson inequality
+ every cap nonacute inequality
  -> False.
```

Consequently another Kalmanson/Farkas pass over these two rows is not the
missing producer.  Any load-bearing successor must add at least one fact not
present in the survivor:

1. a genuinely planar Euclidean rank/Cayley-Menger or two-circle constraint
   stronger than Ptolemy (the survivor already satisfies every Ptolemy
   inequality);
2. stronger MEC/full-cap information than the nonacute chain inequalities;
3. a third source-valid critical row that completes an existing ordinal
   strict cycle; or
4. parent-global deletion/minimality coupling.

The narrowest next theorem suggested by this lane is therefore a **planar
serial two-row consumer**: either show that the serial support packet cannot
embed in the actual cap geometry, or extract one additional row incidence
that feeds `ATailOrdinalKalmansonCycle.false_of_transGen_cycle`.  Do not treat
the two outside-pair count or pair-bank disjointness alone as a contradiction.
The first algebraic subtarget should be the two induced row-Ptolemy equalities,
before escalating to a full eight-point Gram/rank encoding.

## Reproduction and validation

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --frozen python \
  scratch/atail-force/collision-oncap-kalmanson/audit_kalmanson.py --linear-all

UV_CACHE_DIR=/tmp/p97-uv-cache uv run --frozen python \
  scratch/atail-force/collision-oncap-kalmanson/audit_kalmanson.py

cd lean
lake env lean -s 65536 \
  ../scratch/atail-force/collision-oncap-kalmanson/\
OnCapKalmansonLinearModel.lean
```

The direct single-file Lean invocation is the repository's scratch exception;
no production build is claimed by this lane.
