# Math Skeptic Audit: counting-assembly-support

**Target**: `submissions/counting-assembly-support`
**Date**: 2026-09-12
**Verdict**: CERTIFIED
**Claims audited**: 6

## Summary

The four theorem statements match their pinned source declarations. All four
standalone solutions and validation wrappers compile under Lean 4.33.1. Direct
axiom probes of the source declarations report only `propext`,
`Classical.choice`, and `Quot.sound`. The packet publishes support lemmas used
by the accepted nine-point proof and does not claim another milestone.

## Findings

### F1: Total isosceles-count lower bound

- **Location**: `plan.toml`, theorem 1
- **Claim**: Four equal-distance witnesses at each point force
  `6 * A.card ≤ iCount A`.
- **Evidence**: `Problem97.six_mul_card_le_iCount_of_K4` and
  `SixMulCardKernelValidation.result`.
- **Verdict**: PROVEN, Lean-formalized.
- **Reason**: The proof sums the six unordered witness pairs supplied at each
  vertex. Its statement matches the pinned source declaration.

### F2: Non-collinearity

- **Location**: `plan.toml`, theorem 2
- **Claim**: A nonempty strictly convex set with four equal-distance witnesses
  at each point is not collinear.
- **Evidence**: `Problem97.not_collinear_of_K4` and
  `NotCollinearKernelValidation.result`.
- **Verdict**: PROVEN, Lean-formalized.
- **Reason**: The proof obtains at least five points, hence at least three, and
  applies the published strict-convexity obstruction.

### F3: Minimum-enclosing-circle boundary

- **Location**: `plan.toml`, theorem 3
- **Claim**: At least three points lie on the minimum enclosing circle.
- **Evidence**: `Problem97.boundary_card_ge_three_of_K4` and
  `BoundaryCardKernelValidation.result`.
- **Verdict**: PROVEN, Lean-formalized.
- **Reason**: The proof combines F2 with the published theorem excluding the
  two-point diameter case.

### F4: Conditional nine-point reducer

- **Location**: `plan.toml`, theorem 4
- **Claim**: The stated quadratic upper bound on `iCount A`, together with the
  equal-distance hypotheses, forces `9 ≤ A.card`.
- **Evidence**:
  `Problem97.counterexample_card_ge_nine_of_iCount_upper_bound` and
  `CountingUpperBoundKernelValidation.result`.
- **Verdict**: PROVEN, Lean-formalized.
- **Reason**: The proof combines F1 with the assumed upper bound and invokes
  the already published arithmetic lemma. It does not claim to prove the upper
  bound in this theorem.

### F5: Attribution

- **Location**: `README.md`, `explanation.md`, and the lower-bound Lean modules
- **Claim**: The counting method follows Adrian Dumitrescu's 2006 argument in
  *On Distinct Distances from a Vertex of a Convex Polygon*.
- **Verdict**: Correctly scoped attribution.
- **Reason**: The text credits the mathematical counting method and separately
  credits Adam McKenna for the Lean formalization and Prove2Me proofs.

### F6: Trust and scope

- **Location**: the full packet
- **Claim**: These are reusable components of the accepted nine-point proof.
- **Verdict**: Correctly scoped.
- **Reason**: No theorem claims the full quadratic upper bound, a new
  fixed-cardinality exclusion, or either Erdős problem.

## Lean trust audit

The theorem presentation files contain the statement holes required by the
Prove2Me upload format. The submitted solution and validation files contain no
`sorry`, `admit`, custom `axiom`, `native_decide`, `ofReduceBool`, `unsafe`,
`partial`, `implemented_by`, or `extern` declaration. The isolated validation
wrappers report `sorryAx` only because their harness imports already-published
theorem statements as local stubs. Direct probes of all four declarations in
the source project report `[propext, Classical.choice, Quot.sound]`, with no
`sorryAx`, native evaluator axiom, or project axiom.

## Weasel words and scope conflation

The public prose contains none of the banned proof-context phrases and does
not promote the conditional reducer to the full counting upper bound.

## Required before CERTIFIED

None.
