# FreshThird crossed saturation v1: origin and landing contract

## Live origin

This campaign targets one crossed constructor inside the on-spine theorem
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicHardResidual`.
The source packet is a `FreshThirdAlignedDistinctBlockerFirstCapResidual` arm
with `i = S.oppIndex1` and
`E : FirstFiberCrossedThreeRowExactSupports ...`.

The finite ingress consists only of facts already produced in Lean:

- the two cap-source canonical-row witnesses and reciprocal source incidence;
- disjointness of the two source endpoint pairs and first-cap-interior
  membership of all four endpoints;
- the twelve common-endpoint source-deletion arm pairs;
- all three exact crossed supports and their stated nonmemberships;
- distinct source blockers and the nonshared fourth-blocker avoidance theorem;
- `FreshThirdAlignedMutualBlockerBoundaryPacket`;
- `sharedFourth_or_selectedRowOmissionSaturation`; and
- generic cap/boundary localization for both fourth-point actual blockers.

The campaign materializes the selected rows at the two fourth points as real
four-element finite supports.  It does not encode omission literals as free
rowless flags.  Actual blocker equality is functional in the blocked point,
and equal blocker vertices force equal selected supports.  The older equal-
blocker canary's unconditional equality of the two source rows is deliberately
absent.

## Finite compression

The 27 slots are not a claim that `D.A.card <= 27`.  They represent the 19
named physical roles plus at most eight distinct unnamed members across the
second-source row and the two fourth-point rows.  Any finite source packet can
be relabelled into this many slots.  Boundary ranks retain only the relative
order of distinguished points and therefore do not bound the ambient boundary
cardinality.

## Trust and landing boundary

Z3 proposes a structural verdict and cvc5 independently replays every emitted
QF_LIA case.  Neither verdict is a Lean theorem.  SAT is diagnostic evidence
that the encoded source layer has no structural contradiction.  Any UNSAT
case is only a candidate obstruction until all of the following exist:

1. a Lean extraction theorem from the live constructor to this finite schema;
2. an authenticated certificate or ordinary kernel proof of finite coverage;
3. a cardinality-independent lift or bounded-obstruction theorem; and
4. a direct call from the existing on-spine terminal.

No result from this directory may be described as closing a `sorry` without
those four items and a fresh publish-spine audit.

## Round history

The initial round-0 over-approximation omitted endpoint-pair disjointness and
the endpoints' first-cap-interior membership.  It returned SAT in all 240
positive cases and UNSAT in both controls.  Because the omissions only weakened
the schema, that result was a valid diagnostic but not the intended complete
named incidence/order ingress.  Its compact record is preserved as
`results/round0_overapprox_summary.json`; the current encoder includes both
source clauses.

The source-complete structural round returned dual-solver SAT in all 240
positive cases and dual-solver UNSAT in both controls.  The branch-survival
rounds then universally admitted the existing two-row shared-late-pair and
four-row chained-late-pair Kalmanson consumers over all six materialized rows.
Each of the twenty orientation/saturation-branch classes still had an
immediate deletion-arm witness accepted as SAT by both solvers; both controls
remained UNSAT.  These rounds close no Lean obligation.  They establish the
current stop condition for this local model: another round requires a new
source-level positive incidence, order, metric, or minimal-core producer.
