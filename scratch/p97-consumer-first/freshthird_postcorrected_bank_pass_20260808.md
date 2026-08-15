# FreshThird corrected-round bank pass (2026-08-08)

## Verdict

The corrected scan is not an exhaustive two-arm closure.  It establishes a
useful finite obstruction diagnostic, but the metric arm is conditional on 48
selected models and has no universal producer/lift into a checked Lean
consumer.

## Rechecked artifact

`freshthird_cross_deletion_motif_scan_20260808.results.md` reports 576/576
structural SAT branches, zero structural `unknown`, zero universal
`Not(motif)` UNSAT branches, and 576 motif-free SAT countermodels.  It then
stores the first motif-free model for each key
`(order, fresh_cap, row_cap, cap-pair/mutual-pair overlap)` and replays that
model in `cross_metric_check`.  The result is 48 representatives, all Z3
`QF_LRA` UNSAT and all independently echoed as cvc5 `unsat`.

The source assumptions are visible in the script: `motif_formulas` requires
distinct blocker centres, two distinct shell points from one shell, aliases
of both points into the other shell, and one of the four order arms
(`freshthird_cross_deletion_motif_scan_20260808.py:69-108`).  The structural
loop adds the full-fidelity, row-pair, selected-row-pair, and cross-survivor
constraints before checking `Not(motif)`
(`freshthird_cross_deletion_motif_scan_20260808.py:184-235`).  Thus the
corrected SAT result really says that the existing two-centre motif producer
is absent from every tested finite branch.

## Why the 48 UNSATs do not close the second arm

1.  Each metric check is model-specific.  `metric_reps.setdefault` keeps one
    arbitrary Z3 model per key; `cross_metric_check` freezes that model's
    occupied alias partition, shell membership, blocker equalities, and active
    support slots, then solves one QF_LRA distance system
    (`freshthird_cross_deletion_cegar_20260807.py:151-238`).  It does not
    quantify over the other motif-free models in the same branch or orbit.

2.  The proposed S4 quotient is only a label-level observation.  The
    `same/shared-one/disjoint` relation classifies the overlap of the two
    selected blocker pairs, and simultaneous blocker relabelling preserves
    the structural constraints.  However, the metric formula also depends on
    the concrete alias partition, `shell_z_contains_wj` profile, equal-centre
    pattern, and the four selected slot supports.  These data are not
    canonicalized or proved invariant by the script.  Therefore 48 first
    representatives are not a checked universal lift of all 576 branches (or
    of all motif-free models within a branch).

3.  Even a proved quotient would still be an external arithmetic result.  The
    cvc5 call rechecks the generated SMT2 text but emits no DRAT/LRAT artifact,
    Lean theorem, or source-level producer connecting an arbitrary
    motif-free FreshThird branch to one of those 48 formulas.  The result file
    itself correctly says “source-faithful structural diagnostic; no Lean
    closure or promoted cut.”

Consequently the logical shape is still

`source branch -> (motif consumer OR universal normalized metric-core producer)
-> Lean metric consumer`.

The first disjunct is refuted by all 576 `Not(motif)` SAT checks.  The second
producer and its universal lift are missing; the 48 UNSATs are only candidate
consumers for it.

## Bank mining and weakest reusable core

The indexed Lean search (agentic mode was unavailable because the configured
Codex-Spark quota was exhausted; plain corpus-scoped searches were run) found:

* `TwoCenterBisectorParity.false_of_two_centers_equidistant_pair_{after,enclosed,split,before}`: the weakest repeatable consumer.  It needs only a convex CCW boundary, two distinct ordered chord endpoints, two distinct ordered centres, and the two equal-radius incidences.  This is exactly the four-incidence motif searched by the corrected structural scan.
* `FivePointEuclideanObstruction.false_of_five_ccw_second_three_row_equalities`
  and `false_of_five_ccw_three_row_equalities`: stronger five-point
  orientation/equality consumers; they require a concrete five-point ordered
  ingress and are not implied by an arbitrary frozen metric representative.
* `KalmansonThreeEqualitySchemas`: cardinality-independent six-/five-point
  three-equality schemas, e.g.
  `false_of_six_ccw_three_shell_equalities_013_412_523` and the
  `false_of_five_ccw_three_shell_equalities_*` family.  These are promising
  normalized targets only after a source proof supplies the six/five ordered
  vertices and exact equalities.
* `KalmansonRadiusOrderReversal.false_of_seven_ccw_radius_order_reversal_equalities`
  plus its three-/four-selected-row adapters: a stronger seven-point
  reversal core, not a weaker landing target for the current branch.

The required theorem-bank registries contain no direct FreshThird,
cross-deletion, or exact `KalmansonRadiusOrderReversal`/`FivePointEuclideanObstruction`
producer entry.  The general-n registry documents the existing
`KalmansonThreeEqualitySchemas` consumers and their exact-cardinality source
adapters, but explicitly does not provide the missing universal FreshThird
ingress.

## Exact Lean landing contract (not implemented)

Introduce a source-facing theorem whose hypothesis is a *normalized* finite
metric core, not a solver transcript.  The contract should package:

* `BoundaryIndexing A`, injectivity, image, and `IsCcwConvexPolygon`;
* four named blocker/source rows with positive radii and exact selected-shell
  membership (including all alias/equal-centre cases);
* the two cross-survivor and two mutual-survivor supports, with deletion
  avoidance and the cap witnesses from the source fan;
* a proved S4 canonicalization function that maps every concrete assignment to
  one of finitely many schemas while transporting order, cap, alias, and
  support data; and
* a finite disjunction whose leaves are either the existing
  `false_of_two_centers_equidistant_pair_*` consumer or one of the exact
  `KalmansonThreeEqualitySchemas`/five-point consumers.

The required producer theorem is then

`FreshThirdCrossDeletion.to_normalizedMetricCore : SourceFaithfulFreshThirdBranch -> NormalizedMetricCore`

and the checked consumer theorem is

`NormalizedMetricCore.false : NormalizedMetricCore -> False`.

Until both declarations (with source-clean proofs and a universal lift over
all alias/support profiles) exist, the corrected round remains a producer
search result, not closure.

