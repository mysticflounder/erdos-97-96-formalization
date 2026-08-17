# Lane D — FreshThird firstNonHit common-radius six-center faithful-boundary re-check

Target theorem:
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_freshThird_firstNonHit`
(`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean`,
namespace `TwoSourceExactCollisionRowsTerminal`). The `common_radius_payload` arm
(`false_of_freshThird_firstNonHit_commonRadius`) is still `sorry`.

## Why D
The v7 common-only lane (`freshthird_firstnonhit_common_only_v7`) encodes the reduced
finite payload (30 fields incl. `has4/{deleted}/{center}` 5-center deletion survival,
`common_radius_eq`, source omission, exact trace) but **explicitly omits** the faithful
six-center `classAt`/`SelectedFourClass` boundary:
- `faithful_six_center_boundary_encoded = False` (encoder + manifest + receipt),
- `missing_relations = ["classAt", "SelectedFourClass"]`,
- `SIX_CENTER_OMISSION` in `OMITTED_RELAXATIONS`: "…faithful SixCenterFaithfulCarrierBoundary
  classAt/SelectedFourClass component … omitted because that relation is absent from the
  assignment vocabulary."

So the SAT readback (`validate_model`) verifies the reduced payload but cannot by itself
witness the six-center faithful boundary. D is the post-`validate_model` **re-check** that
either re-derives the boundary from carried facts or records the precise missing antecedent
and routes it to the Lean authority.

## Feasibility finding (decides D's shape)
- **(a) Pure-assignment re-derivation of `classAt`/`SelectedFourClass` is infeasible.** The
  relation is absent from the assignment vocabulary by construction, so no SAT witness can
  carry it directly.
- **(b) Bridge/route (adopted).** Given a v7 SAT readback, reconstruct the six-center bridge
  antecedents the model DOES carry — `common_radius_eq` (equal common-radius blocker centers),
  the two common sources + mutual cross-membership, the first/second non-hit arms, and the
  5-center `has4` deletion survival — then report the precise missing antecedent
  (`classAt`/`SelectedFourClass`) and route to
  `lean/scratch/firstnonhit-common-sixcenter-math/SixCenterMath.lean:
  commonRadius_mutual_firstNonHit_sixCenterFaithful_doubleNonHit`
  (which closes `FirstFiberCollisionSixCenterFaithfulResidual` from those antecedents).

## First deliverable (this turn)
Additive module `census/p97_search/freshthird_firstnonhit_commonradius_recheck_v1.py`:
- `reconstruct_sixcenter_antecedents(readback)` — pull carried antecedents from a v7 readback dict.
- `recheck(readback)` — return `{reached, missing, route, antecedents}`; honest that
  `classAt`/`SelectedFourClass` are the missing antecedent and the route is the Lean authority.
- Focused test over a synthetic readback matching the v7 readback contract (no full solve).
No change to the frozen v7 encoder/run hashes or the 3 in-progress Lean edits.
