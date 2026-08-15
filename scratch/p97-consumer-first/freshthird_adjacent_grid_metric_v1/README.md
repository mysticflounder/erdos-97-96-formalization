# FreshThird adjacent-grid exact metric v1

This directory is a bounded exact-17 CEGAR diagnostic.  It asks whether a
single frozen `(8,6,6)` FreshThird incidence signature can be extended to an
actual Euclidean coordinate model carrying the live adjacent-grid and radial
order contracts.  It is not a proof of P97, and a finite SAT result would not
be a P97 counterexample.

## Ingress contract

The finite incidence layer is imported from
`../freshthird_aligned_boundary_v2/freshthird_aligned_boundary_v2.py`.  It
provides 17 labels, the normalized cap profile `(8,6,6)`, two exact-cardinality
four source rows, two exact-cardinality four retained first-apex supports, the
four singleton adjacent-cap cells, the named blocker/source roles, and cyclic
separation.

Two source-audited CEGAR repairs are applied locally before a signature is
frozen:

1. The predecessor's cap-to-boundary-block permutation is not the normalized
   permutation used by the live `DirectBoundaryBlocks` / `MirrorBoundaryBlocks`
   ingress.  Its boundary conjuncts are removed, while all incidence,
   cap-cardinality, row, blocker, and grid conjuncts are retained.  A fresh
   boundary permutation is solved jointly with incidence using the normalized
   blocks: direct `(cap1, cap2, cap0)` and mirror `(cap0, cap2, cap1)` around
   `(surplus, opp2/opp1 apices)`.
2. The predecessor required disjointness only for the two named grid hits on
   each side.  Exact `SelectedClass` semantics plus unequal radii makes the
   entire two supports disjoint.  The first replay exposed shared non-grid
   labels; this source-entitled disjointness is now part of the refined ingress.

The four linear arms are exactly the alternatives in
`ExactFourAdjacentGridKalmanson.SharedBoundaryRadialOrder.direct_or_mirror`.
This structure is explicitly described in the Lean source as the genuinely
missing producer.  The diagnostic therefore tests each arm as a supplied
assumption; it does not claim to construct that producer.

The geometric replay uses exact `Real` variables and QF_NRA polynomial
constraints:

- coordinates for all 17 labels;
- a similarity gauge with MEC center `(0,0)` and squared radius `1`, all labels
  in the disk, all three apices on the circle, and the non-obtuse apex triangle;
- every strict cyclic-order determinant required by `BoundaryIndexing`;
- exact cap membership for every label via the source `OnArcOpposite` signed-
  area product;
- explicitly named squared-distance variables for every pair of active named
  points, each equated to its coordinate polynomial;
- the two first-apex selected classes, first as their eight member equations
  and radius order, then with every nonmember inequality;
- both source rows as exact selected classes centered at their named blockers;
- the source-entitled singleton own-cap slices; and
- positive distance variables whose squares are the four coordinate distances
  in `RadialCyclicOrder.strict_cross_distance`, followed by its strict
  Kalmanson inequality.  Thus the strict inequality is never a free symbolic
  assumption disconnected from the coordinates.

Every Z3 SAT stage is independently checked by re-evaluating its semantic
constraints in the returned exact model.  cvc5 is run separately on each
terminal SMT-LIB instance.  `unknown` and timeout remain unresolved, never
UNSAT.

## Deliberate omissions and scope limits

- Only one complete incidence signature is frozen for each structurally SAT
  arm.  This samples the finite master; it does not enumerate all signatures.
- `SharedBoundaryRadialOrder` has no live source-clean producer and is supplied
  arm-by-arm here.
- The predecessor's opaque survivor/deletion-core flags remain incidence
  obligations.  They are not promoted into additional metric facts.
- No radial-distance-to-boundary-index theorem is inferred beyond the supplied
  shared-order arm.
- No general-`n` lift, cardinality reduction, or universal Euclidean
  conclusion is encoded.
- Stages after the first non-SAT result are intentionally not run.  Their exact
  formulas remain emitted by the script, but an earlier `unknown` is not a
  contradiction.

## Reproduction

From the repository root:

```bash
uv run python -u scratch/p97-consumer-first/freshthird_adjacent_grid_metric_v1/freshthird_adjacent_grid_metric_v1.py \
  --timeout-ms 30000 --cvc5-timeout-ms 30000

uv run python -u scratch/p97-consumer-first/freshthird_adjacent_grid_metric_v1/support_subsequence_probe.py \
  --timeout-ms 30000
```

The script writes `results.json`, `results.txt`, and one QF_NRA `.smt2` file
for every stage actually reached.  The smoke suite fixes six rational points
on a strictly convex parabola and also checks collinear, negative-squared-
distance, and reversed-turn UNSAT controls.
