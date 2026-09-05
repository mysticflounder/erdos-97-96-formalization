# Math Skeptic Audit: Rigid221SourceHeavy exact-card-six helper

**Target**: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean:4307-4502`
**Date**: 2026-09-04
**Verdict**: CERTIFIED
**Claims audited**: 2

## Summary

The new theorem `false_of_exactFourRigid221_sourceHeavy_pentagonBlockerDeleted_card_eq_six` is Lean-formalized and closes only the explicit `S.oppCap2.card = 6` subcase. Its proof obtains an interior of cardinality four, verifies four distinct named interior class points, and consumes all three off-class/interior branches of the existing tagged-center theorem. The enclosing general blocker-deleted theorem remains open and is not upgraded by this helper.

## Findings

### F1: Exact interior cardinality

- **Location**: `Rigid221SourceHeavy.lean:4373-4378`
- **Quote**: `have hIcard : I.card = 4 := by`
- **Stated label**: PROVEN, Lean-formalized
- **Evidence present**: `ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two`, the source-local identity `capByIndex_oppIndex2_eq_oppCap2_sourceHeavy`, and hypothesis `hcap`
- **Actual label**: PROVEN, Lean-formalized
- **Verdict**: OK
- **Reason**: The focused `lake env lean` check succeeds, and the arithmetic derives `I.card = 4` from `I.card + 2 = S.oppCap2.card` and `S.oppCap2.card = 6`.

### F2: Five-point interior contradiction

- **Location**: `Rigid221SourceHeavy.lean:4443-4502`
- **Quote**: `have false_of_new_offClass {c : ℝ²} (hcOff : c ∉ C)`
- **Stated label**: PROVEN, Lean-formalized
- **Evidence present**: explicit support/class membership and disequality proofs, `Finset.card_le_card`, and the existing `exactFourRigid221_sourceHeavy_pentagon_tagged_offClass_strictCap_row_center`
- **Actual label**: PROVEN, Lean-formalized
- **Verdict**: OK
- **Reason**: Each of the tagged theorem's three alternatives supplies an off-class point in `I`; the helper proves it is distinct from the four named class points, embeds all five points into `I`, computes the finite set cardinality as five, and contradicts `I.card = 4`.

## Weasel words

No flagged proof-context terms occur in the audited source region.

## Scope conflation

The theorem name and hypothesis make the exact-card-six restriction explicit. No claim is made here for `S.oppCap2.card > 6`.

## Lean sorry graph

The audited source region contains no `sorry`, custom `axiom`, or `native_decide`. The focused single-file check exits 0. A source-text `#print axioms` probe reports the standard core axiom list beginning with `propext` and no `sorryAx` occurrence. The new theorem does not call the still-open general blocker-deleted theorem at line 4508.

## Upgrade drift

The base commit had no theorem at this declaration. The new PROVEN label is supported by the compiling declaration and the source-text axiom probe.

## Required before CERTIFIED

None for this exact-card-six helper. The general `6 ≤ S.oppCap2.card` blocker-deleted leaf still requires a separate argument for larger caps.
