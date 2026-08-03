# Fresh-third / seven-source integration audit (2026-08-02)

## Verdict

**NO for direct source-faithful closure of**
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`.
The seven-source module is a source-clean, reusable producer, but no current
theorem maps its witnesses to the normalized fresh-third residual constructors.
Importing it and calling it without that bridge would be orphan/bookkeeping,
not a proof of `False`.

## Evidence

`lean/Erdos9796Proof/P97/ATail/SevenSourceCriticalShellMutualOmission.lean`
compiles directly with `cd lean && lake env lean ...` (rc 0; log:
`scratch/seven-module-check-20260802.log`).  Its two printed axiom sets contain
only `propext`, `Classical.choice`, `Lean.ofReduceBool`, `Lean.trustCompiler`,
and `Quot.sound` (no `sorryAx`).

The module exports:

* `exists_mutualOmission` (lines 29--53): for any embedding of seven carrier
  vertices, two sources are omitted from each other's critical-shell supports.
* `exists_seven_sources_outside_two_supports_with_mutualOmission` (lines
  59--75): assuming `15 ≤ D.A.card` and two `SelectedFourClass` values, it
  returns seven sources outside both supports plus the same mutual-omission
  pair.

There are no repository consumers/imports of these declarations beyond this
file (`rg` found only the definitions).

## Hypothesis/support fit

* **Cardinality:** the live surface has only
  `TwoCapSourceThirdCanonicalRowSurface.cap_card_ge_eight` (lines
  7941--47), insufficient for the module's `hcard : 15 ≤ D.A.card`.  In the
  current all-large context, `triApexAllLargeContext_of_residuals L N T`
  (`FrontierLiveClosure.lean:7141--74`) gives all three cap sizes at least six;
  `ATailExactFifteenApexProfile.card_ge_fifteen_of_all_cap_card_ge_six`
  (`ExactFifteenApexProfile.lean:53--72`) then supplies `hcard`.  This is a
  viable *partial* fit only while `L,N,T` are in scope.
* **Selected classes:** any critical shell can be wrapped with
  `CriticalFourShell.toSelectedFourClass` (`lean/Erdos9796Proof/P97/U1CarrierInjection.lean:616--33`),
  so C's source shells (or Q's source shells) can supply `K₁,K₂`.  The returned
  outside-support facts, however, mention arbitrary seven sources, not
  `C.firstSource`, `C.secondSource`, `Q.source₁`, or `Q.source₂`.
* **Shell facts:** the seven-source proof internally uses exact four-support,
  self-membership, and intersection constraints.  It supplies no cross-hit,
  blocker/deletion-survival, or radius-order statement.
* **Unused live hypotheses:** target
  `FrontierLiveClosure.lean:9802--15` includes `hρne`, `hfrontierFour`,
  `hρfour`, both interior equalities, `T`, pair disjointness, blocker
  inequality, and the two localized omission cycles.  The seven-source theorem
  neither consumes nor derives any of these.

## Missing bridge

`FreshThirdNormalizedResidualCase` (`FrontierLiveClosure.lean:9203--15`) has
three positive arms: `firstNonHit`, `secondNonHit`, and
`equalCrossRowCenters` (the latter carries two cross-row hits and center
equality).  A usable integration needs a proved theorem taking the seven-source
mutual-omission pair (plus the live minimality/tri-apex/cycle data) to one of
these arms or to a contradiction/deletion consumer.  No such bridge or
consumer exists.  Existing residual/core coordinators (around lines
11226--339) call the target but do not change this interface.

## Recommendation

Keep the module as an independent producer.  Reuse is conditional on first
adding the explicit bridge above; do not treat cardinality derivation plus a
naked invocation as progress toward the normalized target's closure.
