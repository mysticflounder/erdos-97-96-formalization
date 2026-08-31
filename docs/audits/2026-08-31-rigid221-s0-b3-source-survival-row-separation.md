# Rigid221 S0 B3 source-survival row separation

**Status:** verified source-boundary audit; no new production declaration

## Question

Can `P.context.source_survives_q_or_w` place either residual point outside
both rigid rows in the literal-blocker-`v`, source-row-heavy B3 leaf?

## Verified facts

Let `K_source` be the selected support indexed by `P.source`, and let `K_v`
be the selected support indexed by `P.v`.

1. `cross_deletion_survives_iff_not_mem_selected_support` turns the retained
   survival disjunction into
   `R.interior_q ∉ K_source.support ∨ R.interior_w ∉ K_source.support`.

2. The B3 hypothesis `hblocker` states
   `centerAt(P.source) = P.v.1`.  It does not state that this center is
   `centerAt(P.v)`.

3. `K_v.q_mem_support`, `K_v.support_eq_radius`, and `K_v.radius_pos` prove
   `centerAt(P.v) ≠ P.v.1`.  Combining this with `hblocker` gives
   `centerAt(P.source) ≠ centerAt(P.v)`.

Consequently the selected-support equality theorem cannot identify
`K_source.support` with `K_v.support` in this leaf: its center hypothesis is
false here.  The source survival disjunction supplies no residual omission
from `K_v`.

## Global-deletion consequence

The rigid cover is

```text
C = {deleted} ∪ (K_source ∩ C) ∪ (K_v ∩ C).
```

For a residual point already known to lie in `C`, source survival rules out
only the first row.  A route through this cover still needs its omission from
`K_v`, or a separate source theorem that locates the point as `deleted`.
Neither field is present in `ExactFourMutualOmissionSourceContext` or
`ExactFourMutualOmissionJointDeletion`.

## Lean check

`scratch/runs/rigid221-s0-b3-source-survival-row-separation-20260831/lean-verify-v1/SourceSurvivalRowSeparation.lean`
elaborates the three facts above with no `sorry`.  The receipt and authenticated
run manifest are retained beside it.

## Next source target

The useful new antecedent is a source-faithful residual omission from the
row indexed by `P.v`, for the same residual selected by the source-survival
disjunction.  A theorem that produces it would have the direct B3 consumer
`false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy`.
Until such a theorem is found, the residual fact is not promoted as a new
Lean helper.
