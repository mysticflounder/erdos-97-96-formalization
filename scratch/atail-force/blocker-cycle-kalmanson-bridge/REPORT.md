# Blocker-cycle / Kalmanson bridge audit

## Result

`CycleSupportBridge.lean` proves
`exists_blocker_cycle_with_support_predecessors` and its collision-row
specialization
`exists_blocker_cycle_with_support_predecessors_of_collision`.  This is the
strongest direct selected-row incidence consequence of
`CriticalShellSystem.exists_blocker_cycle`:

- there are an orbit vertex `q` and a period `k ≥ 2`;
- for every `j`, the row selected at `qⱼ` contains `qⱼ`; and
- the center of that row is `qⱼ₊₁`.

The theorem is independent of the unresolved frontier leaf.  Its axiom print
is exactly:

```text
propext, Classical.choice, Quot.sound
```

The isolated nested project was checked by:

```bash
LAKE_BUILD_NO_REFRESH=1 lake-build CycleSupportBridge
```

The build completed successfully (10855 jobs).  The full output is in
`lake-build-final.log`.

## Exact obstruction

The blocker cycle does not supply the inputs of either checked Kalmanson
consumer.

`false_of_two_selected_rows_shared_late_pair` needs:

- a common CCW boundary and indices `ia < ib < ic < id`; and
- two rows, each containing both `boundary ic` and `boundary id`.

`false_of_selected_rows_in_five_ccw_order` needs:

- a common CCW boundary and indices `iO < iA < iY < iE < iC`; and
- six named support incidences distributed over three rows.

The cycle theorem supplies only one support incidence per row, namely
`qⱼ ∈ support(row centered at qⱼ₊₁)`.  Its existential `q` is not identified
with any of `P.source₁`, `P.source₂`, `Pρ.source₁`, or `Pρ.source₂`, and no
hypothesis of the target says that a blocker-cycle orbit meets the indexed cap
or either collision pair.  The target's tri-apex residual only supplies rich
apex structures, a cardinality cover inequality, and exclusion of one center
covering all three apices; it provides no such orbit localization.

Therefore `exists_blocker_cycle` cannot be fed to the present Kalmanson
consumers without a new producer furnishing at least:

1. orbit localization to named boundary vertices in the relevant cap, and
2. a second named support incidence in the same selected row (repeatedly, in
   a cyclic ordinal pattern).

Neither datum follows at the type level from the blocker-cycle result.
