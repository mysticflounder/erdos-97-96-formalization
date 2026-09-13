# Math Skeptic Audit: witness-deletion-support

**Target**: `submissions/witness-deletion-support`
**Date**: 2026-09-12
**Verdict**: CERTIFIED
**Claims audited**: 5

## Summary

The witness-system definition and both theorem statements match their pinned
source declarations. The standalone solutions and validation wrappers compile
under Lean 4.33.1. Direct source axiom probes report only `propext`,
`Classical.choice`, and `Quot.sound`. The packet provides a deletion interface
and its nine-point boundary consequence; it does not claim the open existence
step needed to close the larger descent argument.

## Findings

### F1: Witness-system definition

- **Claim**: Each point receives at least four other points at one common
  positive distance.
- **Evidence**: `Problem97.IsWitnessSystem`.
- **Verdict**: Exact rehost of the pinned source definition.

### F2: Deleting a point unused by witness classes

- **Claim**: If a point occurs in no selected witness class, deleting it
  preserves nonemptiness, strict convexity, and four equidistant neighbours at
  every surviving point.
- **Evidence**: `Problem97.K4_delete_of_indeg_zero` and
  `WitnessDeletionKernelValidation.result`.
- **Verdict**: PROVEN, Lean-formalized.
- **Reason**: Every surviving selected class already avoids the deleted point;
  the proof also derives enough original points to preserve nonemptiness.

### F3: Nine-point witness incidence

- **Claim**: In a nine-point configuration, every point occurs in some selected
  witness class.
- **Evidence**: `Problem97.exists_witness_mem_of_card_eq_nine` and
  `NinePointWitnessIncidenceKernelValidation.result`.
- **Verdict**: PROVEN, Lean-formalized.
- **Reason**: Otherwise F2 produces an eight-point configuration satisfying the
  four-neighbour property, contradicting the already accepted nine-point lower
  bound.

### F4: Attribution

- **Claim**: The nine-point counting input follows Adrian Dumitrescu's 2006
  isosceles-count method in *On Distinct Distances from a Vertex of a Convex
  Polygon*.
- **Verdict**: Correctly scoped attribution.
- **Reason**: The public explanation credits the mathematical counting input
  and separately credits Adam McKenna for the Lean formalization.

### F5: Descent scope

- **Claim**: These theorems form an interface used by a descent argument.
- **Verdict**: Correctly scoped.
- **Reason**: The packet expressly leaves open the theorem producing an unused
  point in a larger configuration. No mission milestone is created.

## Lean trust audit

The theorem presentation files contain the statement holes required by the
Prove2Me upload format. The submitted solution and validation files contain no
`sorry`, `admit`, custom `axiom`, `native_decide`, `ofReduceBool`, `unsafe`,
`partial`, `implemented_by`, or `extern` declaration. The isolated validation
wrappers report `sorryAx` only through already-published theorem presentation
stubs. Direct probes of both source declarations report
`[propext, Classical.choice, Quot.sound]`, with no `sorryAx`, native evaluator
axiom, or project axiom.

## Weasel words and scope conflation

The public prose contains none of the banned proof-context phrases. It does not
claim that the deletion condition holds for every larger configuration or that
these two theorems resolve the descent milestone.

## Required before CERTIFIED

None.
