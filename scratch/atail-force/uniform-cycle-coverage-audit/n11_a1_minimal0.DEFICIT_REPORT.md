# `n11_a1_minimal0`: exact live-field and Euclidean-deficit audit

## Outcome

`n11_a1_minimal0.full_lra.json` is an exact rational **abstract metric** witness,
not a planar geometric witness.

Independent `Fraction` substitution verifies all 55 distances, all 495 triangle
inequalities, both strict Kalmanson inequalities on all 330 increasing
quadruples, all eleven row equalities, every whole-radius filter, and all chosen
blocker/deletion conditions expressible using distances.  The resulting status
is:

```text
FIXED_METRIC_EXACTLY_VERIFIED_NON_EUCLIDEAN
```

The exact checker and its machine-readable result are:

- `audit_live_distance_fields.py`
- `n11_a1_minimal0.live_fields.verify.json`

## Exact checks

### Metric and Kalmanson layer

- All 55 unordered off-diagonal distances are present and positive; the
  minimum is `11`.
- All 495 triangle inequalities hold exactly; minimum slack is `0`.
- Both strict Kalmanson families hold on all 330 increasing quadruples; the
  minimum slack in each family is `1`.

### Rows and full filters

Every selected row has radius `32`, and the complete radius-`32` class is
exactly its displayed four-set.  Thus **no nonmember shares the selected radius
at any row**:

| center | complete radius-32 class | extra nonmembers |
|---:|:---|:---|
| 0 | `{2,4,9,10}` | none |
| 1 | `{3,5,7,10}` | none |
| 2 | `{0,3,4,8}` | none |
| 3 | `{1,2,5,8}` | none |
| 4 | `{0,2,6,9}` | none |
| 5 | `{1,3,6,7}` | none |
| 6 | `{4,5,7,8}` | none |
| 7 | `{1,5,6,9}` | none |
| 8 | `{2,3,6,10}` | none |
| 9 | `{0,4,7,10}` | none |
| 10 | `{0,1,8,9}` | none |

This is stronger than a generic `SelectedFourClass`, which only selects four
same-radius witnesses
([`U1CarrierInjection.lean`, lines 405-419](../../../lean/Erdos9796Proof/P97/U1CarrierInjection.lean#L405)).
It exactly supplies the distance content of `CriticalFourShell.support_eq`,
`support_card`, and `q_mem_support`
([lines 547-561](../../../lean/Erdos9796Proof/P97/U1CarrierInjection.lean#L547)).

### Reciprocal incidence and the common radius

The row-incidence relation is symmetric and connected.  It has 44 directed
incidences, hence 22 undirected edges, and every vertex has degree four.

On a reciprocal selected edge `c--p`, the same distance is both row radius
`r_c` and row radius `r_p`.  Connectivity therefore forces **one common row
radius in every metric realization of these row equalities**, not merely in the
displayed metric.  After scaling it to one, the survivor asks for a spanning
4-regular, 22-edge unit-distance graph.  In the displayed metric, the 22
selected pairs are exactly all pairs at distance `32`.

### Blocker rows and `CriticalShellSystem`

The chosen blocker map is

```text
0->2, 1->10, 2->4, 3->5, 4->6, 5->3,
6->7, 7->6, 8->3, 9->4, 10->9.
```

For every source `q`, exact substitution verifies:

- `b(q) != q` and `b(q)` survives deletion of `q`;
- `b(q)` is neither omitted physical apex `0` nor `1`;
- `q` belongs to the selected row at `b(q)`;
- that blocker row is the complete positive-radius class, with cardinality
  exactly four; and
- after deleting `q`, every positive-radius class about `b(q)` has cardinality
  at most three.

The last item is exactly the distance-level `no_qfree` field of
`CriticalShellSystem`
([`U1CarrierInjection.lean`, lines 1015-1024](../../../lean/Erdos9796Proof/P97/U1CarrierInjection.lean#L1015)).
Source membership and exactness are the live bridge obligations
([`GeneralCarrierBridge.lean`, lines 173-198](../../../lean/Erdos9796Proof/P97/Census554/GeneralCarrierBridge.lean#L173));
`ExactAt` forbids every outside label from sharing a support distance
([`EqualityCore.lean`, lines 130-134](../../../lean/Erdos9796Proof/P97/Census554/EqualityCore.lean#L130)).

The audit also checked every source/center pair, not just the selected blocker:
after deleting `q`, a four-point class survives at center `c` exactly when `q`
is absent from row `c`.

## Exact Euclidean deficit

Let vertex `0` be the Gram basepoint.  If this fixed distance table came from
points in any real inner-product space, its Gram matrix would be positive
semidefinite.  The principal submatrix on vertices `1,2,3` is

```text
[[121,   352, 861/2],
 [352,  1024,   882],
 [861/2, 882,  1764]]
```

and has exact determinant `-16597476`.  The full exact Gram rank is `10`.
Consequently this particular rational metric is not Euclidean in any
dimension, hence is not realizable in `R^2` and is not itself a live geometric
`CriticalShellSystem` witness.

This is **not** an infeasibility proof for the whole row/Kalmanson cell.  A
different assignment of distances, or planar coordinates directly, could
satisfy the same selected rows and strict Kalmanson ordering.  That existential
problem remains open after this audit.

## Reduced exact planar encoding

The smallest direct coordinate formulation exposed by the verified graph
reductions is as follows.  This is a reduction of the present formulation, not
a claim of global optimality among all encodings.

Let `p_i = (x_i,y_i)` for `i=0,...,10`.  Euclidean isometry and the forced
common radius allow the exact gauge

```text
p_0 = (0,0),  p_2 = (1,0),
```

leaving **18 real coordinate variables**.

1. Impose the 22 equations `||p_i-p_j||^2 = 1` for the undirected selected
   edges.
2. Impose strict CCW convex order without distance auxiliaries:
   `orient(p_i,p_(i+1 mod 11),p_j) > 0` for every boundary edge and every
   other vertex `j` (99 strict polynomial orientation inequalities).  For each
   cyclic quadruple the diagonals then cross internally; strict triangle
   inequalities at the crossing imply both strict Kalmanson inequalities.
3. For exactness at the eight actual blocker centers
   `{2,3,4,5,6,7,9,10}`, impose `||p_c-p_z||^2 != 1` for `z` outside
   `{c} union row(c)`.  After deduplication this is **30 nonedge
   disequalities**.  Exactness at all eleven rows, matching the fixed witness
   but stronger than `CriticalShellSystem` requires away from blocker centers,
   adds only the remaining three nonedges, for 33 total.
4. For exact `no_qfree`, at each of the eight distinct blocker centers `c`, no
   four of the six nonunit candidates may have equal squared distance from
   `c`.  Semantically this is eight multiplicity-at-most-three conditions.
   Expanded without strengthening, it is `8 * choose(6,4) = 120` clauses, each
   saying that the four indicated squared distances are not all equal.

Blocker source membership, blocker/source inequality, and avoidance of apices
`0,1` are already fixed by the discrete row and blocker tables and add no real
variables or polynomial constraints.

This coordinate system captures the exact distance-level content of the rows,
blocker full filters, and `CriticalShellSystem.no_qfree`.  It still does not by
itself encode unrelated packet/cap/frontier residual choices or certify the
full `CounterexampleData` minimality interface.

## Reproduction

No Lean or Lake command is involved.

```bash
UV_CACHE_DIR=/private/tmp/codex-uv-cache uv run python \
  scratch/atail-force/uniform-cycle-coverage-audit/audit_live_distance_fields.py \
  scratch/atail-force/uniform-cycle-coverage-audit/n11_a1_minimal0.full_lra.json \
  scratch/atail-force/uniform-cycle-coverage-audit/n11_a1_minimal0.result.json \
  scratch/atail-force/uniform-cycle-coverage-audit/n11_a1_minimal0.verify.json \
  --output scratch/atail-force/uniform-cycle-coverage-audit/n11_a1_minimal0.live_fields.verify.json
```
