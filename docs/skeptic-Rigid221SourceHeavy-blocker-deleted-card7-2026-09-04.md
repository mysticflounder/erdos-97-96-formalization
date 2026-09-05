# Math Skeptic Audit: Rigid221SourceHeavy card-seven blocker normal form

**Target**: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean:4507-5037`
**Date**: 2026-09-04
**Verdict**: CERTIFIED
**Claims audited**: 7

## Summary

The new lower-bound theorem and the card-seven normal-form theorem are
Lean-formalized under the live deleted-blocker hypotheses.  The lower bound
uses only the exact-card-six helper.  At card seven, the `xu` center is shown
off the physical class and inside the strict second-cap interior; `v` is
excluded from that interior; the five displayed points exhaust it; and the
existing `xu` row pair and forced four-point order are retained.  The off-class
`v`-center is also shown outside the strict interior.  The general
blocker-deleted theorem begins at line 5039 and remains open.

## Findings

### F1: Lower bound

- **Location**: `Rigid221SourceHeavy.lean:4507-4574`
- **Quote**: `theorem exactFourRigid221_sourceHeavy_pentagonBlockerDeleted_card_ge_seven`
- **Stated label**: PROVEN, Lean-formalized
- **Evidence present**: contradiction from `¬ 7 ≤ card`, arithmetic yielding `card = 6`, and the exact-card-six helper
- **Actual label**: PROVEN, Lean-formalized
- **Verdict**: OK
- **Reason**: The proof invokes the checked exact-card-six declaration and does not invoke the open general theorem.

### F2: Five-point interior cardinality

- **Location**: `Rigid221SourceHeavy.lean:4576-4690`
- **Quote**: `have hIcard : I.card = 5 := by`
- **Stated label**: PROVEN, Lean-formalized
- **Evidence present**: `capInteriorByIndex_card_add_two`, the source-local cap identity, and `hcap`
- **Actual label**: PROVEN, Lean-formalized
- **Verdict**: OK
- **Reason**: Arithmetic derives the strict interior cardinality from the supplied card-seven hypothesis.

### F3: Class exclusion and surviving interior

- **Location**: `Rigid221SourceHeavy.lean:4819-4888`
- **Quote**: `have hcxOff : Hlate.centerAt packet.xu hxuA ∉ C`
- **Stated label**: PROVEN, Lean-formalized
- **Evidence present**: the `xu`-center class reduction, all three tagged off-class center branches, explicit six-point distinctness, and `Finset.card_le_card`
- **Actual label**: PROVEN, Lean-formalized
- **Verdict**: OK
- **Reason**: A class-valued `xu` center supplies `v` in the interior; each tagged branch supplies a sixth distinct interior point, contradicting `I.card = 5`. Reusing the same six-point argument with the surviving center excludes `v` from `I`.

### F4: Exact finite-set description

- **Location**: `Rigid221SourceHeavy.lean:4889-4912`
- **Quote**: `have hset : ({P.u.1, P.jointDeletion.deleted.1, packet.xv, packet.xu, Hlate.centerAt packet.xu hxuA} : Finset ℝ²) = I`
- **Stated label**: PROVEN, Lean-formalized
- **Evidence present**: five-point subset membership, explicit cardinality five, and `Finset.eq_of_subset_of_card_le`
- **Actual label**: PROVEN, Lean-formalized
- **Verdict**: OK
- **Reason**: The displayed five-point set is contained in `I` and has the same cardinality as `I`; the returned statement is oriented as `I =` that set.

### F5: Row and order retention

- **Location**: `Rigid221SourceHeavy.lean:4913-4921`
- **Quote**: `have horder := exactFourRigid221_sourceHeavy_pentagon_deleted_exists_forced_secondCap_order`
- **Stated label**: PROVEN, Lean-formalized
- **Evidence present**: the existing source-row pair theorem and the existing deleted-blocker four-point order theorem
- **Actual label**: PROVEN, Lean-formalized
- **Verdict**: OK
- **Reason**: The normal-form result returns both the universal `xu`-row pair and the forced order witness without changing the open leaf.

### F6: `v`-row center dichotomy

- **Location**: `Rigid221SourceHeavy.lean:4919-4961`
- **Quote**: `theorem exactFourRigid221_sourceHeavy_pentagonBlockerDeleted_v_center_dichotomy`
- **Stated label**: PROVEN, Lean-formalized
- **Evidence present**: `v`-center exclusion from the deleted point, the existing class reduction, and the off-class branch
- **Actual label**: PROVEN, Lean-formalized
- **Verdict**: OK
- **Reason**: The theorem packages the three surviving cases: `centerAt v = u` with interior membership, `centerAt v = xu` with interior membership, or a center outside the physical class.

### F7: Off-class `v`-center is outside the card-seven interior

- **Location**: `Rigid221SourceHeavy.lean:4961-5037`
- **Quote**: `theorem exactFourRigid221_sourceHeavy_pentagon_card_seven_offClass_v_center_not_interior`
- **Stated label**: PROVEN, Lean-formalized
- **Evidence present**: the returned five-point interior set, class membership of the four named points, and support transport under equal centers
- **Actual label**: PROVEN, Lean-formalized
- **Verdict**: OK
- **Reason**: If the off-class `v`-center were interior, the finite-set description would reduce it to the `xu` center. Equal centers make the `v` and `xu` selected supports equal, putting `xv` in the `xu` row and contradicting `hxvNotXuRow`.

## Weasel words

No flagged proof-context terms occur in the audited source region.

## Scope conflation

The lower-bound declaration and the normal-form declaration state their
cardinality hypotheses explicitly.  The general theorem at line 5039 is not
claimed closed.

## Lean sorry graph

The audited source region contains no `sorry`, custom `axiom`, or
`native_decide`.  The focused single-file check exits 0.  A source-text
`#print axioms` probe reports the standard core axiom list beginning with
`propext` for all four declarations in this card-seven lane, with no `sorryAx`
occurrence.

## Upgrade drift

The base source had no lower-bound or card-seven normal-form declaration at
these locations.  The PROVEN labels are supported by the compiling
declarations and the source-text axiom probe.

## Required before CERTIFIED

None for the declarations in this lane.  The general blocker-deleted theorem still
requires a separate argument for caps larger than the exact-card-six case.
