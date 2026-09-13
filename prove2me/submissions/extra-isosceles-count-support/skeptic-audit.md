# Math Skeptic Audit: extra-isosceles-count-support

**Target**: `submissions/extra-isosceles-count-support`
**Date**: 2026-09-12
**Verdict**: CERTIFIED
**Claims audited**: 4

## Summary

Both theorem statements match their pinned source declarations. Their
standalone solutions and validation wrappers compile under Lean 4.33.1.
Direct source axiom probes report only `propext`, `Classical.choice`, and
`Quot.sound`. The packet exposes a strengthened counting interface and creates
no milestone.

## Findings

### F1: One excess local count raises the total lower bound

- **Claim**: Four equidistant neighbours at each point give the six-per-point
  baseline, and one point with at least seven local isosceles pairs raises the
  total lower bound to `6 * A.card + 1`.
- **Evidence**:
  `Problem97.six_mul_card_add_one_le_iCount_of_K4_of_iCountAt_ge_seven` and
  `ExtraApexCountKernelValidation.result`.
- **Verdict**: PROVEN, Lean-formalized.
- **Reason**: The proof separates the exceptional point from the finite sum,
  applies the six-pair bound to every remaining point, and adds seven for the
  exceptional point.

### F2: Nine points force a total count of at least fifty-five

- **Claim**: Under the same local hypotheses and `A.card = 9`, the total
  isosceles count is at least `55`.
- **Evidence**:
  `Problem97.fifty_five_le_iCount_of_card_nine_K4_of_iCountAt_ge_seven` and
  `NinePointFiftyFiveKernelValidation.result`.
- **Verdict**: PROVEN, Lean-formalized.
- **Reason**: The proof specializes F1 at cardinality nine and normalizes the
  arithmetic.

### F3: Attribution

- **Claim**: The counting method follows Adrian Dumitrescu's 2006 paper *On
  Distinct Distances from a Vertex of a Convex Polygon*.
- **Verdict**: Correctly scoped attribution.
- **Reason**: The public explanation credits the mathematical counting method
  and separately credits Adam McKenna for the Lean formalization and Prove2Me
  proofs.

### F4: Scope

- **Claim**: These theorems are reusable support for finite-nine counting
  arguments.
- **Verdict**: Correctly scoped.
- **Reason**: Neither theorem claims a full finite-nine exclusion or either
  Erdős problem, and the packet declares no milestone.

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

The public prose contains none of the banned proof-context phrases. Internal
source shorthand appears only in Lean declaration names and code.

## Required before CERTIFIED

None.
