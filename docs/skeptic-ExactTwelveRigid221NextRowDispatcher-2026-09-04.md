# Math Skeptic Audit: ExactTwelveRigid221NextRowDispatcher

**Target**: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/ExactTwelveRigid221NextRowDispatcher.lean`
**Date**: 2026-09-04
**Verdict**: NEEDS WORK
**Claims audited**: 4

## Summary

The target compiles and exposes a finite twelve-cell source-to-job bridge.
Its statements retain the row and blocker hypotheses and explicitly leave
terminal unsatisfiability open.  The author-side axiom probe found no
`sorryAx` or custom axiom; it did find the native-decision trust boundary.
An independent publication audit of the native decision procedure and final
consumer reachability has not run, so this is not a promotion record.

## Findings

### F1: Twelve-cell enumeration

- **Location**: target:30-39
- **Quote**: "Every normalized source placement is one of the twelve named schedule cells used by the clause-delta collection."
- **Stated label**: implicit Lean-formalized result
- **Evidence present**: `frozenNextRowCell_cases`, focused `lake env lean` exit 0, and an author-side `#print axioms` probe
- **Actual label**: PROVEN under the repository's native-reduction trust boundary
- **Verdict**: CLARIFY
- **Reason**: The proof uses `native_decide`; the probe reports `Lean.ofReduceBool` and `Lean.trustCompiler` in addition to core axioms.  The report does not claim a pure-kernel proof.

### F2: Cell-to-job selection

- **Location**: target:41-72
- **Quote**: "The source-checked compiled job attached to a normalized placement cell."
- **Stated label**: implicit Lean-formalized result
- **Evidence present**: `nextRowJobForCell`, exhaustive finite cases, and the twelve imported typed job declarations
- **Actual label**: PROVEN
- **Verdict**: OK
- **Reason**: Each branch selects the named typed declaration, and the impossible branch is discharged from `frozenNextRowCell_cases`.

### F3: Source witness lift

- **Location**: target:74-125
- **Quote**: "The source normal-form producer supplies a named typed job for its normalized placement, while retaining the row and blocker hypotheses needed by the job's source-witness contract."
- **Stated label**: implicit Lean-formalized result
- **Evidence present**: `exists_source_namedNextRowJob` applies `exists_source_normalized_nextRowOnlyHitJob` and returns its `FrozenSafeCubeOK` and `FrozenNextRowOnlyHitAddedConstraintsHold` fields together with the selected typed job
- **Actual label**: PROVEN
- **Verdict**: OK
- **Reason**: The theorem's conclusion contains the source placement equality, both source hypotheses, and a typed job equal to `nextRowJobForCell`.

### F4: Terminal scope

- **Location**: target:12-16
- **Quote**: "It does not provide terminal unsatisfiability certificates or close the geometric residual."
- **Stated label**: explicit scope limitation
- **Evidence present**: no terminal theorem or universal contradiction appears in the target; the closure matrix records the same residual
- **Actual label**: PROVEN as a scope statement
- **Verdict**: OK
- **Reason**: The module introduces no terminal certificate, bank coverage theorem, or contradiction theorem.

## Weasel words

None found in the audited claims.

## Scope conflation

No conflation between source semantics, typed job construction, and terminal
UNSAT evidence was found.  The closure matrix correctly keeps terminal bank
coverage open.

## Lean sorry graph

The author-side probe reported axioms
`propext`, `Classical.choice`, `Lean.ofReduceBool`, `Lean.trustCompiler`, and
`Quot.sound` for all three exported declarations.  It reported no `sorryAx` or
custom project axiom.  This is an author-side probe, not an independent
publication audit.

## Upgrade drift

No stronger claim was found in this target relative to the preceding closure
register.  The documentation upgrade is limited to source-to-job dispatch;
terminal certificates and aggregate bank coverage remain open.

## Required before CERTIFIED

Run an independent verifier against the committed source revision.  It must
check final-consumer reachability, the transitive evaluated closure of the
native decision procedure, the repository native-axiom whitelist, and fresh
proof-spine state.
