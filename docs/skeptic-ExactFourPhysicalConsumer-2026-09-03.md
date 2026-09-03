# Math Skeptic Audit: ExactFourPhysicalConsumer

**Target**: `lean/Erdos9796Proof/P97/ATail/ExactFourPhysicalConsumer.lean`
**Date**: 2026-09-03
**Audited source revision**: `46d92fbad948b6102274fae754d51eb1ca1e783c`
**Proof edit commit**: `617c84a617696459925e523899730ac3c8d22b35`
**Verdict**: NEEDS WORK
**Claims audited**: 10

## Summary

The ten substantive claims in the module have source-backed Lean proofs.  A
fresh direct check of the current source exits successfully.  A source-fed
`#print axioms` audit of all ten public theorem declarations reports only
`propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`, custom axiom,
`native_decide`, `unsafe`, `implemented_by`, or `extern` marker occurs in the
target module.

The verdict remains **NEEDS WORK** as a project-integration verdict.  The two
new source-count theorems are not called by any live Lean consumer: the first
is used only by the second, and the second has no source consumer.  The
current proof-blueprint index is stale and the last graph refresh failed in an
unrelated module.  These facts do not weaken the local theorem proofs, but
they prevent claiming a live frontier reduction or a completed publication
path.

## Findings

### F1: Bad-source blocker coincidence

- **Location**: `ExactFourPhysicalConsumer.lean:151-224`
- **Quote**: "All bad outside sources share one actual blocker."
- **Stated label**: Implicit PROVEN
- **Evidence present**: The Lean theorem
  `Problem97.ATailExactFourPhysicalConsumer.bad_source_blockers_eq`; direct
  source check; source-fed `#print axioms` audit.
- **Actual label**: PROVEN (Lean-formalized)
- **Verdict**: OK
- **Reason**: The proof derives three distinct points on the perpendicular
  bisector and applies the imported convexity bound.  The theorem is scoped to
  `OriginalUniqueFourResidual` and the two members of
  `badOutsideSources R`.

### F2: At most two bad outside sources

- **Location**: `ExactFourPhysicalConsumer.lean:227-309`
- **Quote**: "There are at most two bad outside sources."
- **Stated label**: Implicit PROVEN
- **Evidence present**: The Lean theorem
  `Problem97.ATailExactFourPhysicalConsumer.badOutsideSources_card_le_two`;
  direct source check; axiom audit.
- **Actual label**: PROVEN (Lean-formalized)
- **Verdict**: OK
- **Reason**: The proof fixes one bad source, identifies the common blocker,
  embeds every bad source point in the two-point difference of exact
  four-supports, and closes with finite-set cardinality.  It does not assert a
  bound for arbitrary sources or arbitrary residuals.

### F3: Carrier lower bound

- **Location**: `ExactFourPhysicalConsumer.lean:311-338`
- **Quote**: "The exact-four residual forces a carrier of cardinality at least
  eleven."
- **Stated label**: Explicitly scoped PROVEN
- **Evidence present**: The Lean theorem
  `carrier_card_ge_eleven_of_original_unique_four_residual`; its docstring
  explicitly restricts the claim to the residual carrying `noM44`; direct
  source check and axiom audit.
- **Actual label**: PROVEN (Lean-formalized)
- **Verdict**: OK
- **Reason**: The proof uses the cap sum, surplus-cap lower bound, opposite-cap
  lower bounds, and contradiction with `R.noM44` at carrier size ten.  The
  docstring correctly rejects a universal claim for arbitrary counterexamples.

### F4: Outside-fiber lower bound

- **Location**: `ExactFourPhysicalConsumer.lean:341-368`
- **Quote**: "The complement of the late first-apex fiber has at least seven
  sources."
- **Stated label**: Implicit PROVEN
- **Evidence present**: The Lean theorem
  `seven_le_outsideFirstApexFiber_card`; it uses the exact fiber-cardinality
  theorem and F3; direct source check and axiom audit.
- **Actual label**: PROVEN (Lean-formalized)
- **Verdict**: OK
- **Reason**: The theorem is an exact consequence of the residual's carrier
  lower bound and the four-element actual blocker fiber.

### F5: Five good outside sources

- **Location**: `ExactFourPhysicalConsumer.lean:371-394`
- **Quote**: "At least five outside sources preserve one of the two retained
  singleton deletions at their actual late blocker."
- **Stated label**: Implicit PROVEN
- **Evidence present**: The Lean theorem
  `five_le_goodOutsideSources_card`; it uses the good/bad partition and F2;
  direct source check and axiom audit.
- **Actual label**: PROVEN (Lean-formalized)
- **Verdict**: OK
- **Reason**: The proof counts the outside complement from F4 and subtracts at
  most two bad sources.  The surviving deletion is one of the two named
  frontier deletions, exactly as the definitions state.

### F6: Carrier bound by the good-source count

- **Location**: `ExactFourPhysicalConsumer.lean:397-442`
- **Quote**: "The exact-four residual leaves at most six carrier points outside
  the good-source count: four in the first-apex blocker fiber and at most two
  bad outside sources."
- **Stated label**: Implicit PROVEN
- **Evidence present**: The Lean theorem
  `carrier_card_le_goodOutsideSources_card_add_six`; direct source check and
  axiom audit.
- **Actual label**: PROVEN (Lean-formalized)
- **Verdict**: OK
- **Reason**: The proof establishes the good/bad partition of the outside
  fiber, rewrites the complement of the four-element fiber, and applies F2.
  The theorem has no unstated cardinality premise beyond `R`.

### F7: Seven good sources in the large-cardinality branch

- **Location**: `ExactFourPhysicalConsumer.lean:444-452`
- **Quote**: "The live large-cardinality branch supplies seven good outside
  sources."
- **Stated label**: Explicitly conditional PROVEN
- **Evidence present**: The Lean theorem
  `seven_le_goodOutsideSources_card_of_card_gt_twelve`, with the explicit
  premise `12 < D.A.card`; direct source check and axiom audit.
- **Actual label**: PROVEN (Lean-formalized), conditional on `12 < D.A.card`
- **Verdict**: OK
- **Reason**: `omega` combines F6 with the strict carrier-cardinality premise.
  The theorem does not claim the result at carrier size twelve and does not
  manufacture the premise from `OriginalUniqueFourResidual`.

### F8: Common-deletion ingress existence

- **Location**: `ExactFourPhysicalConsumer.lean:475-567`
- **Quote**: "Full source-faithful common-deletion ingress produced by exact
  four."
- **Stated label**: Implicit PROVEN when read with the following existence
  theorem
- **Evidence present**: The typed structure
  `ExactFourPhysicalCommonDeletionIngress`, the constructor theorem
  `nonempty_exactFourPhysicalCommonDeletionIngress_of_source`, and the
  unconditional theorem
  `nonempty_exactFourPhysicalCommonDeletionIngress`; direct source check and
  axiom audit.
- **Actual label**: PROVEN (Lean-formalized) for existence under the stated
  residual; the structure alone is only a contract
- **Verdict**: OK
- **Reason**: The inhabitants retain the deleted frontier point, good-source
  membership, actual blocker, blocker separation from the second apex, and
  the common-deletion packet.  The source does not silently replace the
  original residual with the new packet.

### F9: Robust-or-swapped outcome

- **Location**: `ExactFourPhysicalConsumer.lean:569-606`
- **Quote**: "Exact four reaches either a robust physical second apex or a
  swapped protected exact-four frontier."
- **Stated label**: Explicitly PROVEN as an audit boundary
- **Evidence present**: The Lean theorem
  `nonempty_exactFourPhysicalConsumerOutcome`; direct source check and
  axiom audit.
- **Actual label**: PROVEN (Lean-formalized) as a disjunctive outcome
- **Verdict**: OK
- **Reason**: The proof consumes the common-deletion ingress and the imported
  physical-second-apex split.  The docstring correctly says this is not a
  contradiction theorem and identifies the swapped arm as a recursive return.

### F10: Live-consumer and publication status

- **Location**: `ExactFourPhysicalConsumer.lean:397-452` and current project
  blueprint state
- **Quote**: "The live large-cardinality branch supplies seven good outside
  sources."
- **Stated label**: The plan documents this as infrastructure for a branch;
  the Lean declarations themselves do not assert reachability.
- **Evidence present**: `rg` finds the first new theorem only in its own
  declaration and the second theorem, and finds no Lean consumer of the second.
  `proof-blueprint status` reports a stale index, 2,141 stale symbol refs, and
  no anchor for this worker; the targeted spine refresh fails on an unrelated
  absent indexed declaration in `SevenSourcesOutsideTwoShells`.
- **Actual label**: CURRENT_CONSUMERS_UNVERIFIED / NEEDS WORK
- **Verdict**: CLARIFY
- **Reason**: The local proofs are valid, but prose infrastructure status is not
  a live consumer proof.  Before treating these lemmas as a frontier reduction,
  regenerate the blueprint from a warm verified build and either wire the
  seven-source theorem into a source-owned consumer or record the declarations
  as intentionally off-spine.

## Weasel words

The automatic scan found no prohibited hedging, unjustified-quantifier, or
comparison-language phrases in the target source.

## Scope conflation

The module is careful about the main scope boundary.  F3 is explicitly limited
to `OriginalUniqueFourResidual`; F7 carries its `12 < D.A.card` premise; and
F9 explicitly disclaims a contradiction result.  The remaining project risk is
not a false theorem statement but treating F6/F7 as a live branch reduction
while no current Lean declaration consumes F7.

## Lean sorry graph

The current source was checked with:

```text
lake env lean Erdos9796Proof/P97/ATail/ExactFourPhysicalConsumer.lean
```

The source-fed declaration audit printed, for each of F1--F9:

```text
[propext, Classical.choice, Quot.sound]
```

No `sorryAx` or non-core custom axiom was reported.  This establishes the
trust closure of the audited declarations, not the freshness of the global
blueprint graph.  The project status still reports unrelated stale and
uncommitted modules, so a publication-level reachability claim would exceed
the evidence.

## Upgrade drift

No user-supplied base commit was provided for a label-drift comparison.  The
proof edit commit `617c84a61` was nevertheless checked directly against its
current source and its public theorem closures.  The report does not upgrade
the declarations to a live-spine result.

## Required before CERTIFIED

- Complete a warm governed build sufficient for the `SevenSourcesOutsideTwoShells`
  dependency and refresh the blueprint index and refs.
- Re-run the targeted spine and record the resulting consumer path for the
  seven-source theorem.
- If no consumer is intended, mark F6/F7 as off-spine infrastructure in the
  current plan rather than describing them as a live frontier reduction.
- Preserve the explicit `12 < D.A.card` premise and the non-contradiction
  qualification when adapting the result downstream.
