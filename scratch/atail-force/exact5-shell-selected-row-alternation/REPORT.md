# Exact-five physical-shell / selected-row alternation

## Result

`ExactFiveShellSelectedRowAlternation.lean` proves the mixed shared-pair
exclusion exposed by the combined exact-six SAT assignment.

For an increasing CCW boundary quadruple

```text
ia < ib < ic < id,
```

if both endpoint centers `boundary ia` and `boundary id` are equidistant from
the middle pair `boundary ib`, `boundary ic`, then `False` follows immediately
from
`CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw`.

The source-facing adapter
`false_of_selected_row_and_radiusClass_shared_middle_pair` obtains:

- the `ia`-center equality from two support memberships in one
  `SelectedFourClass`; and
- the `id`-center equality from two memberships in the complete
  `SelectedClass carrier (boundary id) radius`.

On the exact-five physical-apex branch, instantiate `boundary id` with the
physical apex, `radius` with the profile radius, and the two
`SelectedClass` memberships with the two points of the complete exact-five
physical shell.  The cardinality-five fact is used upstream to obtain and
control that complete shell; after the two memberships are fixed, the
alternation contradiction itself needs no cardinality assumption.

This is therefore a source-valid clause schema, not a learned literal core:
when the physical apex and a selected-row center occupy the same open boundary
arc cut by a shared target pair, their simultaneous equalities are impossible.
The displayed theorem covers the normalized order with the two centers at the
outer indices.  Cyclic rotation/reflection belongs in the finite encoder or a
future production order adapter, not in this scratch kernel.

## Bank preflight

The required registry and indexed-corpus preflight found:

- the reusable strict inequality
  `complementary_dist_add_dist_lt_diagonal_sum_of_ccw`; and
- `false_of_two_selected_rows_shared_late_pair`, which is not the required
  adapter because it places the two selected-row centers at the first two
  vertices and the shared pair at the last two vertices.

No indexed theorem matched the mixed complete-physical-shell / selected-row
statement.  The new proof therefore reuses the banked Kalmanson primitive and
adds only the missing source adapter.

## Validation

Run from the repository root:

```bash
lake env lean -DwarningAsError=true \
  scratch/atail-force/exact5-shell-selected-row-alternation/ExactFiveShellSelectedRowAlternation.lean
```

The file has no `sorry`.  Both declarations report only the standard axiom
closure `propext`, `Classical.choice`, and `Quot.sound`.
