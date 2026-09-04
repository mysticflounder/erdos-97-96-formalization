# Math Skeptic Audit: Rigid221SourceHeavy source-clean reductions

**Target**: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`
**Date**: 2026-09-04
**Verdict**: NEEDS WORK
**Claims audited**: 4

## Summary

The three newly added reductions are Lean-formalized and source-clean.  A
source-text compilation and direct `#print axioms` probe found only
`propext`, `Classical.choice`, and `Quot.sound` for each declaration.  The
existing deleted-blocker terminal remains an open `sorry` at line 3629, so
this file and its pentagon branch are not closed.

## Findings

### F1: Deleted-to-`xv`/`xu` distance separation

- **Location**: `Rigid221SourceHeavy.lean:3449`
- **Quote**: `exactFourRigid221_sourceHeavy_pentagon_deleted_dist_ne_xv_xu`
- **Stated label**: implicit PROVEN, as a theorem declaration
- **Evidence present**: focused source compilation and source-text `#print axioms`
- **Actual label**: PROVEN (Lean-formalized)
- **Verdict**: OK
- **Reason**: The proof derives `packet.xu` into the `xv` shell from a
  hypothetical equality, then contradicts the trace bound and row exclusion.

### F2: The `v`-row center is not deleted

- **Location**: `Rigid221SourceHeavy.lean:3512`
- **Quote**: `exactFourRigid221_sourceHeavy_pentagon_v_center_ne_deleted`
- **Stated label**: implicit PROVEN, as a theorem declaration
- **Evidence present**: focused source compilation and source-text `#print axioms`
- **Actual label**: PROVEN (Lean-formalized)
- **Verdict**: OK
- **Reason**: Equal blocker centers are transported to equal selected supports;
  the `v` source then violates the `xv`-row trace bound using the existing
  named distinctness facts.

### F3: Class-valued `v`-row center reduction

- **Location**: `Rigid221SourceHeavy.lean:3559`
- **Quote**: `exactFourRigid221_sourceHeavy_pentagon_v_center_class_reduction`
- **Stated label**: implicit PROVEN, as a theorem declaration
- **Evidence present**: focused source compilation and source-text `#print axioms`
- **Actual label**: PROVEN (Lean-formalized)
- **Verdict**: OK
- **Reason**: The five-point class cover is split; deleted, `v`, and `xv` are
  eliminated by the two support/source facts, while `u` and `xu` are taken
  into the strict-interior set from `source_pair_interior`.

### F4: Existing deleted-blocker terminal remains open

- **Location**: `Rigid221SourceHeavy.lean:3629`
- **Quote**: `theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerDeleted ... := by sorry`
- **Stated label**: terminal theorem, which could be mistaken for closure
- **Evidence present**: compiler warning `declaration uses 'sorry'`
- **Actual label**: CONJECTURED / open Lean obligation
- **Verdict**: CLARIFY
- **Reason**: The new reductions are not wired into this terminal and do not
  establish `False` for the full deleted-blocker residual.

## Weasel words

No proof-context weasel words were found in the three new declarations.

## Scope conflation

The three helper theorems are distinguished from the existing terminal; no
closure label is assigned to the terminal.

## Lean sorry graph

Each new helper's direct source-text axiom probe reported only
`[propext, Classical.choice, Quot.sound]`.  The existing terminal at line
3629 still reports `sorryAx` through its declaration.

## Upgrade drift

No prior label was upgraded in this checkpoint.  The added declarations are
new source-clean helpers, and the terminal remains open.

## Required before CERTIFIED

Wire these helpers only into a proof whose additional geometric obligations
are separately established, then remove the terminal's `sorry` and rerun the
transitive axiom audit for its intended consumer.
