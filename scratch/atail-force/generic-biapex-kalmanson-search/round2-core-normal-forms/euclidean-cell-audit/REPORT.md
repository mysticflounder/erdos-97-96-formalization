# Corrected n=11 Euclidean cell audit

## Scope and conclusion

This audit checks the corrected full-Kalmanson SAT survivor
[`n11_a1_minimal0.full_lra.json`](../../../uniform-cycle-coverage-audit/n11_a1_minimal0.full_lra.json).
It separates two questions that the original LRA result did not decide:

1. is the exported rational distance assignment Euclidean; and
2. could some other distance assignment in the same selected-row/Kalmanson
   cell be realized by eleven distinct points in the Euclidean plane?

The answers are both **no**, for different exact reasons.

- The exported rational metric is not Euclidean in any dimension: its exact
  basepoint Gram matrices are indefinite.
- More importantly, the selected-row equalities alone contain a six-label
  instance of the already-banked theorem
  `Problem97.u5_qcritical_aux_base_collision_metric_incompatibility`.
  Hence no injective planar realization of the row-equality cell exists,
  regardless of the chosen rational distances or Kalmanson inequalities.

The first conclusion is an exact rational replay.  The second is an exact
finite adapter plus a source-proved sibling-bank match.  It has not yet been
elaborated in this repository: the matched theorem is in the sibling
`p97-rvol` worktree and the current no-Lean-build gate remains active.

## Exported metric replay

[`audit_fixed_metric.py`](audit_fixed_metric.py) reads all 55 rational
distances from the corrected survivor and performs exact `Fraction`/SymPy
calculations.  Its output is
[`fixed_metric_audit.json`](fixed_metric_audit.json).

The exact results are:

```text
triangle violations:                       0
four-point subsets checked:              330
negative four-point Gram determinants:    44
positive four-point Gram determinants:   286
zero four-point Gram determinants:         0
rank of each 10 x 10 basepoint Gram:      10
```

Every basepoint Gram matrix has a negative principal minor of order three.
The smallest absolute negative example is the four-point set
`{0,5,7,8}` based at `0`:

```text
Gram determinant:          -313600
Cayley-Menger determinant: -2508800
```

Thus the exported rational assignment is not even a Euclidean metric in a
higher-dimensional space.  This fact by itself would not exclude a different
metric in the same combinatorial cell, so it is kept separate from the
cell-level result below.

## Selected-support graph normal form

[`audit_support_graph.py`](audit_support_graph.py) reconstructs the complete
selected-support relation and verifies the row adapter.  Its output is
[`support_graph_audit.json`](support_graph_audit.json).

The relation is symmetric, connected, and 4-regular on eleven vertices.  It
has 22 undirected edges and graph6 encodings

```text
raw graph6:             JRhOYKqaU@_
nauty canonical graph6: Jsd@IgtIaS_
```

Nauty reports automorphism-group order two and six vertex orbits, so this is
not a circulant/vertex-transitive support graph.  It has seven triangles, ten
four-cycles, and chromatic number three.

Because the selected relation is symmetric and connected, the equal-radius
row constraints propagate one common positive radius through all 22 edges in
every realization.  The full propagation is not needed: the following five
rows already give a contradiction.

## Exact sibling-bank match

Use the role assignment

```text
p  = 0
q  = 2
t1 = 4
t2 = 9
t3 = 10
x  = 8
r  = dist(0,2)
```

The required unit edges are

```text
p-q, p-t1, p-t2, p-t3,
t1-q, t1-t2, t2-t3,
t3-x, x-q.
```

They follow from five selected rows:

| row | selected support | propagated edges |
|---:|:---|:---|
| 0 | `{2,4,9,10}` | `0-4`, `0-9`, `0-10` from `0-2` |
| 2 | `{0,3,4,8}` | `2-4`, `2-8` from `2-0` |
| 4 | `{0,2,6,9}` | `4-9` from `4-0` |
| 9 | `{0,4,7,10}` | `9-10` from `9-0` |
| 8 | `{2,3,6,10}` | `8-10` from `8-2` |

Therefore the rows supply exactly the metric hypotheses of

```lean
Problem97.u5_qcritical_aux_base_collision_metric_incompatibility
```

from sibling module
`RVOL.P97.U5GlobalIncidenceQCriticalAuxBaseCollision`.  The three inequality
hypotheses are just distinct labels:

```text
q != t2   because 2 != 9
t1 != t3  because 4 != 10
x != p    because 8 != 0
```

Positivity of `r` follows from distinctness of labels `0` and `2` and
`dist_pos`.  Row `8` gives both `dist x t3 = r` and
`dist x t3 = dist x q`.

Geometrically, the first seven equalities form three edge-sharing
equilateral triangles around `p`.  The banked antipodal-chain kernel forces
`q` and `t3` to be antipodal about `p`.  A point `x` at radius `r` from `t3`
and equidistant from `q,t3` must then equal `p`, contradicting `x != p`.

The bank census records the theorem as source-proved and reachable in the
sibling worktree.  Its exact local name is not currently present in this
repository.  However, the underlying antipodal scalar kernel
`Problem97.u5_chain_antipodal_coord` is already production-local in
`U5GlobalIncidenceKernels.lean`; the missing piece is the thin auxiliary
base-collision scalar/metric wrapper and the fixed-row adapter.

## Bounded production plan

Once the no-build gate is lifted:

1. Port the sibling auxiliary base-collision scalar and metric theorem, or
   write an equivalent thin theorem reusing the already-local
   `u5_chain_antipodal_coord`.
2. Add one adapter from the corrected fixed-row packet.  It should mention
   only rows `0,2,4,8,9`, derive the nine distance hypotheses above, and derive
   distinctness from the carrier embedding/injectivity.
3. Invoke that adapter before any Kalmanson classification.  This particular
   survivor needs neither order inequalities nor a nonlinear Euclidean search.
4. Run a focused Lean elaboration, `#print axioms` on the new metric theorem
   and adapter, then refresh the relevant exact search checkpoint.

This is a bounded reuse/adapter task, not a new geometry theorem.  It closes
this corrected n=11 survivor cell, but it is not yet a coverage proof for all
remaining n=11 cells or all carrier cardinalities.

## Reproduction

Run both exact audits with the project Python environment:

```bash
UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run python \
  scratch/atail-force/generic-biapex-kalmanson-search/round2-core-normal-forms/euclidean-cell-audit/audit_fixed_metric.py \
  scratch/atail-force/uniform-cycle-coverage-audit/n11_a1_minimal0.full_lra.json \
  --output scratch/atail-force/generic-biapex-kalmanson-search/round2-core-normal-forms/euclidean-cell-audit/fixed_metric_audit.json \
  --quiet

UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run python \
  scratch/atail-force/generic-biapex-kalmanson-search/round2-core-normal-forms/euclidean-cell-audit/audit_support_graph.py \
  scratch/atail-force/uniform-cycle-coverage-audit/n11_a1_minimal0.full_lra.json \
  --registry certificates/p97_rvol_general_n_mining.json \
  --output scratch/atail-force/generic-biapex-kalmanson-search/round2-core-normal-forms/euclidean-cell-audit/support_graph_audit.json
```
