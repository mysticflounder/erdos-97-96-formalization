# Latest FreshThird global theorem-bank audit

Date: 2026-08-02

## Verdict

**NO-GO.** No new n>=17-faithful (or genuinely general-n) round has been
banked, and no source-clean producer/direct bridge for
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual` was found.
The live normalized-residual leaf remains open (`sorry` at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:9738`).

## Round and encoder status

* `V17-PRODUCTION1-GLOBAL-THEOREM-BANK.md`: exact n=15 `(6,6,6)` only;
  wall-clock `unknown`, Boolean prepass `sat_no_cut`; equality blockers reuse
  the existing generic bank, but no universal cut or live bridge is admitted.
* V18 was interrupted before any completed assignment or theorem-bank search.
  V19/V20/V21 remain exact-n=15 finite Boolean/QF_NRA experiments (V21's three
  residual probes are canceled `unknown`), not universal evidence.
* `N17-ENCODER-INVENTORY.md` audits all retained candidates and finds none
  carrying variable `n>=17`/general `n`, cap cardinality >=8, same-cap source
  pair, collision-endpoint exclusion, and exact support/deletion together.
  The generic whole-carrier Kalmanson search lacks cap/deletion data; the exact
  17-point rational fixture is fixed-witness data with required packet fields
  omitted. Thus no n>=17-faithful round or certificate exists to bank.

## Registry and indexed-Lean search

The three mandatory theorem-bank inventories contain zero declarations matching
`FreshThird`, `normalized_residual`, or `twoCapSources`:

* `certificates/p97_rvol_general_n_mining.json`
* `certificates/erdos97_legacy_general_n_mining.json`
* `certificates/erdos_general_theorem_p97_mining.json`

`nthdegree docs search --lean` (indexed 2026-08-02 17:56 UTC) returns only the
current declarations (`FreshThirdNormalizedResidualCase`, its normalizer, and
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`) plus
unrelated generic U1/U5 consumers. No indexed source-clean theorem supplies
the missing incidence/placement bridge.

## What is source-clean, and what is not

Source-clean existing pieces are the positive routers
`freshThirdNormalizedResidualCase_of_crossRowResidual` and
`nonempty_freshThirdCapSourceInteraction_of_noAlignment`, and the closed
distinct-center arm `false_of_two_freshThirdCrossRowHits_distinctCenters`.
The equal-center exact-row/omission packet exposes data but does not prove
`False`. The stronger theorem
`false_of_twoCapSources_sameBlockerAllEndpointOmission` is source-clean for
its explicit `FreshOutsideFirstBlockerFiber`/all-endpoint-omission packet, but
that packet is strictly stronger and is not a bridge from generic
`FreshThirdBlockerFiber` normalized residual data.

The current refactor plan still requires a positive, branch-preserving
incidence producer for the normalized residual arms; V17--V21 do not alter that
frontier. Keep their JSON artifacts as external solver discovery data only and
do not promote finite selectors, cuts, or fixed-17 observations into the
theorem bank.

## Trust boundary

This is a read-only source/registry/index audit. No Lean, Lake, solver,
certificate replay, or kernel/axiom gate was run. `unknown`/`canceled` statuses
are not UNSAT and provide no theorem closure.
