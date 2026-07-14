# ATAIL Stage-I dangerous-equality producer attempt

Date: 2026-07-14

## Verdict

The requested equalities were **not derived**:

```text
c := rows.uRow.center

dist c q = dist c t1
dist c q = dist c t3.
```

Nor did the full common-`CriticalShellSystem` provenance produce the endpoint
pair's first reciprocal critical-row incidence.

The two equalities are already contradiction-strength.  With `hfixed` and
`p != c`, the checked sink
`false_of_fixedTriple_secondCenter_two_equalities` in
`stage1_three_dangerous_equidistant_sink.lean` applies
`eq_of_equidistant_three_noncollinear` and closes immediately.  Thus this is
not a routine intermediate equality: proving it is a complete Stage-I
closure theorem.

No production source, protected source, generated document, LIVE-T1 file, or
card-11 artifact was edited.  No Lean/Lake process was started.

## Exact proof attempt

Write

```text
B = {q,t1,t2,t3}
R = rows.uRow.selected.toCriticalFourShell.support
c = rows.uRow.center.
```

The full outer-path common provenance gives

```text
c = Hcritical.centerAt u huA
R = (Hcritical.selectedAt u huA).support
u in R
not HasNEquidistantPointsAt 4 (D.A.erase u) c.
```

It also identifies the dangerous row with the same system:

```text
Hcritical.centerAt t2 ht2A = p
(Hcritical.selectedAt t2 ht2A).support = B.
```

Since the separated frontier gives `p != c`, the `t2` and `u` blocker fibers
are distinct.  Same-center support locking therefore does not couple `B` and
`R`.

Three possible derivations were checked.

### 1. Put three dangerous points in the exact u-row

The sufficient incidence packet

```text
q in R, t1 in R, t3 in R
```

would produce both equalities.  But it is stronger than the metric target and
cannot be obtained incrementally from current row facts:
`SelectedFourClass.inter_card_le_two` already gives

```text
card (R intersect B) <= 2
```

because `c != p`.  Common provenance supplies only the diagonal point `u in
R`; it supplies no member of `B intersect R`.

### 2. Use a secondary three-point radius class at c

The metric target does not require the three labels to lie in `R`; it asks for
a possibly different radius class

```text
q,t1,t3 in D.A.filter (fun z => dist c z = dist c q).
```

Criticality after deleting `u` forbids a q-free class of cardinality at least
four at `c`, but permits an unrelated three-point class.  Global K4 at `c`
is already discharged by the exact class `R` containing `u`.  Hence neither
global K4 nor deletion criticality creates this secondary triple.

The exact first missing antecedent on this route is already the first named
metric coupling

```text
dist c q = dist c t1,
```

and no current cap, full-filter, no-M44, blocker-fiber, or all-center-K4
theorem produces it.  Even after it is supplied, the independent `q/t3`
equality remains necessary.

### 3. Use the endpoint pair and critical rows sourced at its members

For an endpoint witness `x != y`, the known endpoint center `c0` bisects the
pair.  Common provenance gives only

```text
x in selectedAt(x).support
y in selectedAt(y).support.
```

The first absent field is

```text
y in selectedAt(x).support.
```

The symmetric incidence

```text
x in selectedAt(y).support
```

and pairwise distinctness of

```text
c0, centerAt(x), centerAt(y)
```

then feed the already-checked `Dumitrescu.perpBisector_apex_bound` adapter.
All-center K4 supplies selected classes at the blocker centers but does not
put the unrelated member of the pair into either class.

## Strongest concrete independence witness

The new exact checker

```text
stage1_dangerous_equality_euclidean_countermodel_2026-07-14.py
```

specializes the pinned 33-point integer-coordinate Euclidean construction
from `blocker_graph/euclidean_countermodel.py`.  It verifies with exact
integer squared distances:

- cardinality `33`;
- genuine Euclidean distance and noncollinearity;
- global K4 at every carrier center;
- every single carrier deletion destroys global K4;
- an exact deletion-blocker row for every source, hence a common
  `CriticalShellSystem`-shaped choice;
- the common system is overridden on all four dangerous sources so that their
  blocker center is `p` and their exact full support is `B`;
- all finite-set/metric fields of the localized no-q-free packet at `(q,p)`;
- all finite-set/metric fields of the fixed triple and exact q-deleted radius
  class;
- the selected-candidate field shape for `u` off the dangerous circle;
- the same common system's exact `u` row; and
- failure of both requested equalities.

The pinned labels are

```text
p  = (0,5)
q  = (0,0)
t1 = (3,1)
t2 = (4,2)
t3 = (5,5)
u  = (0,1)
c  = (0,6).
```

At `p`, the exact squared-radius-25 class is

```text
B = {(0,0),(3,1),(4,2),(5,5)}.
```

Deleting any member of `B` blocks K4 at `p`.  The same common system's row at
source `u` has center `c`, squared radius `25`, and exact support

```text
R = {(0,1),(3,2),(4,3),(5,6)},
```

which is disjoint from `B`.  The squared distances from `c` are

```text
q  -> 36
t1 -> 34
t2 -> 32
t3 -> 26.
```

Thus all four are distinct, so both target equalities fail.

Validation command:

```bash
UV_CACHE_DIR=/tmp/codex-uv-cache \
  uv run python \
  scratch/atail-force/stage1_dangerous_equality_euclidean_countermodel_2026-07-14.py
```

The checker reports `PASS` with base digest
`a78922fbf1a30e7642019a65859c93d34d45f668e06e0f60310bf780b45c55c5`
and specialization digest
`4d30244388226a71dbd03d63ca94efb41de95072ad1d8811faa9d79236aeb7fd`.

This is **not** a counterexample to K-A-PAIR.  The carrier is non-convex, so it
does not instantiate `CounterexampleData.convex`, the nonobtuse
circumscribed-MEC/Moser packet, the sharp separated-cap placement, or
`hNoM44`.  It is nevertheless stronger than the earlier finite-incidence
shadow: exact Euclidean metric, global K4, deletion-minimality, full filters,
the live local packet, and actual common provenance all coexist with total
failure of the dangerous equalities.

## Exact remaining theorem

The countermodel leaves only the coupled convex/MEC/cap/no-M44 layer outside
its exact surface.  Consequently the next theorem cannot be another generic
global-K4, blocker, full-filter, or common-provenance lemma.  It must visibly
use that geometric layer to prove one of:

```text
SeparatedCapSharpFrontier
  -> dist rows.uRow.center q = dist rows.uRow.center t1
     and dist rows.uRow.center q = dist rows.uRow.center t3
```

or, on the endpoint arm,

```text
URowOppositeEndpointInteriorPairFields
  -> y in selectedAt(x).support
     and x in selectedAt(y).support
     and PairwiseDistinct [c0, centerAt(x), centerAt(y)].
```

The first genuinely missing datum is the first cross-center metric/incidence
coupling in either display.  Everything after the complete displayed packet
is already consumed by a named core-axiom theorem.

Epistemic labels:

- **PROVEN / kernel-checked elsewhere:** the two-equality and triple-bisector
  sinks;
- **EMPIRICALLY VERIFIED EXACTLY:** the pinned integer-coordinate countermodel
  on its stated weakened surface;
- **NOT CLAIMED:** a model of convexity, the live Moser/cap packet, no-M44, or
  the complete K-A-PAIR antecedent; and
- **OPEN-PROOF:** the convex/MEC/cap/full-filter coupling which produces the
  first dangerous equality or first reciprocal endpoint incidence.
