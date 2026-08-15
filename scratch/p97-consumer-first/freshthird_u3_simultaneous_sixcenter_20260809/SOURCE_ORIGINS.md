# Source origins and semantic guards

This namespace is a new, one-wave finite diagnostic.  It does not reuse the
semantic namespace or results of `freshthird_u3_obstruction_wave_20260809`.

## Licensed clauses

| SMT/schema clause | Exact Lean source | Use here |
|---|---|---|
| Six audit centers are `t1,t2,t3,u,a0,a1` and are pairwise distinct | `U3FixedTripleAuditFrame` in `lean/Erdos9796Proof/P97/U3ToU5Terminal.lean:208`; constructor fields plus `U5BoundedAuditCenters` in `U5GlobalIncidenceBasic.lean:545` | Fixed six-row label set; distinct-center antecedent for overlap cuts |
| Each audit center has an exact-cardinality q-deleted row or a critical four-shell | `U3FixedTripleAuditFrame.auditCenters_qDeleted_or_criticalFourShell`, `U3ToU5Terminal.lean:283` | Three finite modes: confined q-deleted, escaping q-deleted, shell |
| All six confined q-deleted rows are impossible | `RowwiseConfinedQDeletedClasses`, `false_of_rowwiseConfinedQDeletedClasses`, `U3ToU5Terminal.lean:296,310` | Source target of the all-confined finite case |
| Some center escapes bounded support or has a critical shell | `exists_qDeleted_escape_or_criticalFourShell`, `U3ToU5Terminal.lean:334` | Live symbolic case requires at least one non-confined mode |
| Live exact-radius escape witness is outside bounded support and off the dangerous p-radius | `SixSurvivorU3ExactRadiusAuditObstruction`, `SixSurvivorExactRowsBoundary.exists_u3ExactRadiusAuditObstruction`, `TwoSourceClosure.lean:1173,1205` | Escape mode records one abstract outside witness; off-radius is a provenance tag, not Euclidean arithmetic |
| Exact q-deleted rows at distinct centers intersect in at most two points | `U5QDeletedK4Class.inter_card_le_two`, `U5GlobalIncidenceSupport.lean:412` | All q-deleted/q-deleted pair cuts |
| Any exact selected four-classes at distinct centers intersect in at most two points | `SelectedFourClass.inter_card_le_two`, `U1CarrierInjection.lean:474`; `CriticalFourShell.toSelectedFourClass`, line 713 | Abstract intersection cardinalities for mixed/shell pairs; no shell incidence labels |
| Every exact q-deleted audit row meets `{q} ∪ T` in at most two points | `U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two`, `U5GlobalIncidenceSupport.lean:545`, with audit-center-not-p derived from the frame; support-level wrapper at lines 698-714 | Hard cut for every q-deleted mode; card four gives at least two row points outside that p-circle |
| Fifteen bounded q-free four-subsets per center and 1,440 pair-overlap-compatible tuples | `U5AuditLabel.choices`, `boundedIndexPattern_count`, `U5FiniteAudit.lean:64,356` | Exact finite label encoding before the newer dangerous-p-circle cut |
| Seven named prefilters exhaust every bounded overlap-compatible pattern | `PrefilterReason`, `prefilterReason`, `exact_prefilter_exhaustion`, `U5FiniteAudit.lean:255,265,375`; metric routing in `U5FiniteExtraction.lean` | Source-derived no-good bank; after the p-circle cut, 468 patterns remain and all still receive a named reason |

The manifest records SHA-256 hashes of every source file and of the generated
schema, case matrix, and no-good bank.

## Explicitly unavailable or dormant

- **No arbitrary same-center identity.** `U5QDeletedK4Class` witnesses are
  noncanonical subsets.  The model does not assert that two witnesses at the
  same center are equal.  The actual six audit labels are already pairwise
  distinct, so no same-center case arises.
- **No boundary-center projection.** The six centers in
  `SixSurvivorExactRowsBoundary` are not the six U3 audit centers.  None of its
  center-cardinality, actual-blocker, or selected-shell membership facts are
  transferred here.
- **No blocker-fiber bound.** `actualBlockerFiber_card_le_four` in
  `ATail/SurvivalCover.lean:86` requires a `CriticalShellSystem` and equality of
  actual blocker vertices.  That antecedent is absent for these U3 audit
  centers, so the clause is not encoded.
- **No canonical return or collision.** Escape witnesses are anonymous and are
  not equated to a boundary row, source, or other escape witness.
- **No shell support labels or dangerous-row incidence.** Shell mode has an
  exact-full-shell provenance tag and abstract pair-intersection cardinalities,
  but zero named support-membership variables are enabled for the shell.
- **No Euclidean coordinates or full-row nonmembership.** Only named finite
  consequences already proved in Lean are hard clauses.  The diagnostic never
  infers that an unlisted ambient point is off a row.

## Four-valued reading

- `semantic-UNSAT`: all encoded clauses for that finite case have verified
  Lean origins.  Its scope remains the bounded finite schema.
- `relaxation-UNSAT`: a deliberately weakened finite case is still UNSAT.
- `SAT-abstraction`: a finite abstract model survived and passed an independent
  readback checker.  It is not a Euclidean realization or counterexample.
- `UNKNOWN`: timeout, crash, malformed status, engine disagreement, or invalid
  readback.  UNKNOWN is fail-closed and yields no conclusion.
