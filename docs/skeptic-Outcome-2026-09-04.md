# Math Skeptic Audit: `TwoDeletionOutcome.survivalSquare`

**Target**: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletion/Outcome.lean`
**Date**: 2026-09-04
**Verdict**: NEEDS WORK
**Claims audited**: 6

## Summary

The target is a typed residue constructor, not a contradiction proof. The
source-clean producer proves a seven-way disjunction whose last four branches
are the four survival-square arms. In each such arm, one survival conjunct is
already supplied by an existing packet; the new information is one
`HasNEquidistantPointsAt 4` fact for the first blocker after deleting one named
center. The available packets do not connect that surviving K4 to the first
blocker's critical support, a common radius, a boundary order, or an existing
metric obstruction. The only terminal consumer currently supplied for this
case is `sorry`-backed.

The first missing antecedent is therefore a source-clean bridge from one of
those four singleton-deletion facts to a contradiction. A viable bridge would
need either universal/off-named survival strong enough for a removability
theorem, or explicit support, metric, and order data connecting the new K4 to
the critical row and an existing obstruction. No such bridge was found in the
one required theorem-bank preflight or in the cited source modules. No source
consumer was added.

## Findings

### F1: The packet is structural data, not a closure argument

- **Location**: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletion/Outcome.lean:74-77`
- **Quote**: “The shared hypothesis bundle of the two four-center common-deletion terminal arms. Its twenty-four fields are, verbatim, the twenty-four explicit binders those two arms share; the record carries no proof obligation of its own.”
- **Stated label**: Implicitly PROVEN as a Lean record invariant.
- **Evidence present**: The structure declaration and all twenty-four field signatures at lines 78-141; direct `#print axioms` probe.
- **Actual label**: PROVEN — Lean-formalized structural claim.
- **Verdict**: OK
- **Reason**: The record packages hypotheses and does not assert `False`; the probe reports only core axioms (`propext`, `Classical.choice`, `Quot.sound`).

### F2: `survivalSquare` stores a disjunction; it does not derive one

- **Location**: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletion/Outcome.lean:191-229`
- **Quote**: “One of the four surviving centers and the common deleted source form a bidirectional deletion-survival square.”
- **Stated label**: Implicitly PROVEN as a mathematical terminal.
- **Evidence present**: The constructor accepts `P` and an explicit four-way `hsquare` disjunction.
- **Actual label**: PROVEN only as a typed constructor; the semantic terminal claim is CONJECTURED.
- **Verdict**: CLARIFY
- **Reason**: The constructor concludes `TwoDeletionOutcome` from supplied data. It contains no derivation of `hsquare`, no metric contradiction, and no conclusion of `False`.

### F3: The finite square split is source-clean but weaker than a contradiction

- **Location**: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean:1142-1188`
- **Quote**: “Unless the common deleted source is itself one of the three actual blockers, one of the four surviving centers forms a bidirectional singleton-deletion survival square with that source's actual blocker.”
- **Stated label**: PROVEN.
- **Evidence present**: `exactFour_fourSurvivingCenters_survivalSquare_split`; its body uses the checked finite support split and constructs the four branches at lines 1222-1237.
- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK, with scope limitation
- **Reason**: The direct axiom probe reports no `sorryAx` for this theorem. The result is exactly a disjunction; it does not choose a geometrically useful center or close the branch.

### F4: The four square arms add only one new survival fact each

- **Location**: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean:1217-1237`
- **Quote**: “`first.uPacket.survives₂`”; “`first.uPacket.survives₁`”; “`first.vPacket.survives₁`”; “`crossPacket.survives₁`”.
- **Stated label**: Implicitly PROVEN as the arm construction.
- **Evidence present**: The four constructor pairs at lines 1222-1237 and the deletion-survival transport used for their second conjuncts.
- **Actual label**: PROVEN — Lean-formalized construction; no stronger metric conclusion.
- **Verdict**: CLARIFY
- **Reason**: The first conjunct in each arm is already a packet field. The second conjunct only says that the first blocker survives deletion of one named center. `CommonDeletionTwoCenterPacket` supplies exact rows at its two prescribed centers and an overlap bound, but does not supply a row at the first blocker or a support-membership relation for the newly surviving K4.

### F5: The survival-square contradiction terminal is unproved

- **Location**: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean:1451-1548`
- **Quote**: “Second terminal arm of the four-center common-deletion residue: one of the four surviving centers and the common deleted source form a bidirectional deletion-survival square.”
- **Stated label**: Implicitly PROVEN by the result type `False`.
- **Evidence present**: The declaration ends with `False := by` at line 1547 and `sorry` at line 1548.
- **Actual label**: CONJECTURED.
- **Verdict**: DOWNGRADE TO CONJECTURED
- **Reason**: The terminal has no proof body. The direct axiom probe reports `sorryAx` in its transitive dependency list. The theorem-bank preflight found this declaration and related split declarations, but no kernel-clean contradiction consumer.

### F6: The coordinator inherits the same gap

- **Location**: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletion/Coordinator.lean:266-296`
- **Quote**: “Each of the three open two-deletion terminals refutes its own branch.”
- **Stated label**: PROVEN by the coordinator theorem's `False` result.
- **Evidence present**: The `survivalSquare` case calls the terminal from F5 at lines 288-296.
- **Actual label**: CONJECTURED for the full theorem.
- **Verdict**: DOWNGRADE TO CONJECTURED
- **Reason**: `false_of_twoDeletionOutcome` and `false_of_twoDeletionIngress` both report `sorryAx`; their square branch is exactly the unproved terminal in F5. The source-clean narrowing step cannot promote the consuming theorem.

## Weasel words

No proof-body weasel word was used as evidence for the audit. The comments use
“forms” and “refutes” as architectural descriptions; those words do not supply
the missing proof obligations.

## Scope conflation

The source-clean theorem `exactFour_fourSurvivingCenters_survivalSquare_split`
proves a disjunction of possible branches. It does not prove that any one
branch has the support, radius, order, or row data needed by a terminal metric
obstruction. The `CommonDeletionTwoCenterPacket` overlap bound concerns its
two exact q-deleted rows, not the new K4 centered at the first actual blocker.

## Lean sorry graph

The direct probe was run from the current Lean tree on 2026-09-04. Results:

- `TwoDeletionOutcome.survivalSquare`: core axioms only; no `sorryAx`.
- `exactFour_fourSurvivingCenters_survivalSquare_split`: core axioms only; no `sorryAx`.
- `CommonDeletionTwoCenterPacket`: core axioms only; no `sorryAx`.
- `false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare`: includes `sorryAx`.
- `false_of_twoDeletionOutcome`: includes `sorryAx`.
- `false_of_twoDeletionIngress`: includes `sorryAx`.

The governed `lake-build` wrapper could not acquire its shared lock because
another build already held `.lake/lake-build.lock`; the direct `lake env lean`
probe completed with exit status 0 after the scratch probe's namespace check
was corrected. The result is suitable for the declaration-level axiom audit,
not a replacement for a clean full build.

## Upgrade drift

No base-commit label diff was supplied. No label upgrade is justified by this
audit.

## Required before CERTIFIED

1. Replace the `sorry` body of
   `false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare`
   with a source-clean argument.
2. Supply the first missing bridge: either a universal/off-named survival
   theorem that invokes a checked removability obstruction, or explicit
   support/metric/order data tying each selected square arm to an existing
   exact-four, six-point, or Kalmanson obstruction.
3. Re-run the aggregate Lean build and `#print axioms` for the terminal and
   both coordinator consumers, with no `sorryAx` or unsanctioned custom axiom.

