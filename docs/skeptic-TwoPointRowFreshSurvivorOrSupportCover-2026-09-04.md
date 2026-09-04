# Math Skeptic Audit: TwoPointRowFreshSurvivorOrSupportCover

**Target**: `lean/Erdos9796Proof/P97/ATail/TwoPointRowFreshSurvivorOrSupportCover.lean`
**Date**: 2026-09-04
**Verdict**: CERTIFIED
**Claims audited**: 3

## Summary

The module states two source-neutral disjunctions and supplies complete Lean
proofs for both.  The focused `lake-build` passed, the target imports no
`Rigid221SourceHeavy`, and the axiom probe found only the standard core axioms
`propext`, `Classical.choice`, and `Quot.sound` for both exported theorems.

## Findings

### F1: Survivor-or-cover bridge
- **Location**: `lean/Erdos9796Proof/P97/ATail/TwoPointRowFreshSurvivorOrSupportCover.lean:31-34`
- **Quote**: "An outside source either yields a fresh five-center packet for one of the two endpoint deletions, or all sources outside the selected support lie in the prescribed finite cover."
- **Stated label**: implicit Lean-formalized claim
- **Evidence present**: `Problem97.ATailTwoPointRowFreshSurvivorOrSupportCover.two_point_row_fresh_survivor_or_support_cover`, compiled by focused `lake-build`; its proof invokes `two_point_row_deletion_survival` and constructs both five-center conjunctions or the finite-support inclusion.
- **Actual label**: PROVEN (Lean-formalized)
- **Verdict**: OK
- **Reason**: The theorem conclusion and proof directly match the sentence, including the outside source, `t ∉ U`, relevant center freshness, and cover branch.

### F2: Exact-row boundary adapter
- **Location**: `lean/Erdos9796Proof/P97/ATail/TwoPointRowFreshSurvivorOrSupportCover.lean:104-107`
- **Quote**: "The same fresh-survivor split, with each five-center branch normalized to the exact-row boundary consumed by downstream source-faithful arguments."
- **Stated label**: implicit Lean-formalized claim
- **Evidence present**: `Problem97.ATailTwoPointRowFreshSurvivorOrSupportCover.two_point_row_fresh_boundary_or_support_cover`, compiled by focused `lake-build`; each survivor branch is passed to `fiveSurvivorExactRowsBoundary`.
- **Actual label**: PROVEN (Lean-formalized)
- **Verdict**: OK
- **Reason**: The adapter preserves the source and freshness fields and produces the declared `Nonempty (FiveSurvivorExactRowsBoundary ...)` branch.

### F3: Import and trust scope
- **Location**: `lean/Erdos9796Proof/P97/ATail/TwoPointRowFreshSurvivorOrSupportCover.lean:7-8`
- **Quote**: "import Erdos9796Proof.P97.ATail.TwoPointSelectedRowDeletionSurvival" and "import Erdos9796Proof.P97.ATail.FiveCenterDeletionBoundary"
- **Stated label**: implicit source-neutral scope claim
- **Evidence present**: focused build log and source marker log; the source contains no `Rigid221SourceHeavy` reference or `sorry`, and the axiom probe reports only `[propext, Classical.choice, Quot.sound]` for both declarations.
- **Actual label**: PROVEN (Lean-formalized)
- **Verdict**: OK
- **Reason**: The import list is low-module and the checked dependency surface contains no custom axiom or sorry marker for the exported declarations.

## Weasel words

None found in proof explanations.

## Scope conflation

None found.  The first theorem is parameterized by `CounterexampleData`,
`ConvexIndep`, a `CriticalShellSystem`, explicit survivor centers, and an
alias-to-cover hypothesis; the second theorem adds only the exact-row adapter.

## Lean sorry graph

Focused build: `scratch/runs/luna-swarm-proofforge-two-point-row-fresh-survivor-cover-20260904/run-0001/focused-build.log` (`BUILD-EXIT=0`).

The #print axioms probe at
`scratch/runs/luna-swarm-proofforge-two-point-row-fresh-survivor-cover-20260904/run-0001/axiom_probe.lean`
reports for both declarations:

`[propext, Classical.choice, Quot.sound]`

The source and axiom logs contain no `sorry` or `sorryAx` marker.

## Upgrade drift

No pre-existing claim label was upgraded in the lane diff; this is a new Lean
module whose claims are supported by the focused compilation and axiom probe.

## Required before CERTIFIED

None.
