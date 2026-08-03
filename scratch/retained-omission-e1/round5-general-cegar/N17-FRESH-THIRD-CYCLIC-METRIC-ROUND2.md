# n=17 FreshThird cyclic/metric refinement — round 2

Date: 2026-08-02

## Model and run

The probe is `n17_freshthird_incidence_probe.py`, schema
`p97-freshthird-n17-generic-incidence-v2`, with the repaired faithful carrier
profile `(6,8,6)` and `--cyclic-metric`.  The run record is
`artifacts-n17-generic/20260802T111521Z/result.json`.

The optional refinement adds bounded cyclic positions for all 17 vertices,
fixed apex block locations, positive symmetric distances, exact-radius
equalities, non-strict triangle inequalities, the selected-row alternating
separator, and guarded strict Kalmanson implications for the two consecutive
center orientations.  It does not add the old strong-arm clauses, QF_NRA
coordinates, Lean ingress, or a universal-`n` quantifier.

Constraint counts include 14,280 cyclic shared-pair separators, 4,080
triangle inequalities, 2,040 radius equalities, 544 guarded Kalmanson
implications, and 136 positive-distance constraints.

## Result and trust boundary

The external Z3 run returned `SAT` in 12,855 ms.  The baseline incidence-only
run also returned `SAT`; the refinement therefore supplied no UNSAT core or
source-clean cut.  This is bounded diagnostic evidence only:

* `external_solver_only = true`;
* `lean_kernel_proof = false`;
* `universal_n_claim = false`;
* coordinates and full QF_NRA realizability remain omitted.

The SAT result is not a counterexample to the Lean theorem and does not close,
split, or replace the live `sorry`.  It only shows that this bounded
cyclic/metric relaxation is still too weak to furnish the missing producer.
The required post-round global theorem-bank audit is being run separately;
its result must be recorded before any route decision.

## Arm isolation

As a diagnostic replay of the same model (not a new theorem or CEGAR cut), each
residual selector was forced separately.  `firstNonHit`, `secondNonHit`, and
`equalCrossRowCenters` were all `SAT` (about 17.4s, 13.3s, and 13.0s in
separate invocations).  Thus no residual arm is eliminated by this refinement,
and there is no arm-specific source-clean producer to wire.
