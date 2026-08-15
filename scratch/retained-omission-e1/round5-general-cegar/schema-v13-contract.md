# Schema 13 universal-escape contract

The machine-readable metadata for this lane is
`schema_v13_freshthird_universal_escape.json`; the pre-existing tracked
`schema_v13.json` belongs to a separate n=15 TriApex lane and is unchanged.

Schema 13 retains Schema 11's exact six-point pinned-seed ingress and adds
the complete public Lean conclusion
`exists_freshThirdCrossRow_pinnedCenter_universal_escape_dichotomy`.

The finite n=17 encoder expands the universal row quantifier with 17 Boolean
row-membership variables for each candidate center and a Z3 `ForAll`.  A row
is an exact-four candidate when it has four members, excludes its center, and
all members share one of the abstract radius anchors.  For every outside-seed
point `z`, the implication is exactly:

```text
(center = row_center[z] AND row support = source_row[z,*]
 AND critical deletion at center)
OR
(center != row_center[z]
 AND card(row support intersect source_row[z,*]) <= 2)
```

Here `row_center[z]` is the existing n17 canonical blocker selector and
`source_row[z,*]` is its projected exact critical support.  The existing
`critical_no_K4_after_source_deletion` constraints are guarded by every
`row_center[z] = center`; therefore `Or_s(row_center[s] = center)` is used
only as a source-level existential witness for `¬FullyDeletionRobustAt`, not
as an unconstrained robustness Boolean.  This is the precise finite mapping;
no independent arbitrary-cardinality deletion theorem is asserted.

The shell inventory and carrier are finite-only abstractions.  SAT/UNSAT from
this script is external bounded evidence, with no Euclidean realization,
universal-cardinality lift, or Lean closure claim.
