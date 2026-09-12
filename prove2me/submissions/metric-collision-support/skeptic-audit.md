# Math Skeptic Audit: metric-collision-support

**Target**: `submissions/metric-collision-support`
**Date**: 2026-09-12
**Verdict**: CERTIFIED
**Claims audited**: 8

## Summary

The three published mathematical claims are Lean-formalized and match their
pinned local source declarations. Each standalone platform proof and its
validation wrapper compiles under Lean 4.33.1. Source and platform axiom probes
report only `propext`, `Classical.choice`, and `Quot.sound`. The packet makes no
claim that these support lemmas resolve a fixed-cardinality case or either open
problem.

## Findings

### F1: Uniqueness of an equidistant center

- **Location**: `plan.toml:17`
- **Quote**: "If A and B are each equidistant from P, Q, and R, then A = B."
- **Stated label**: PROVEN
- **Evidence present**: `Erdos9796Mission.eq_of_dist_eq_three_of_pairwise_ne` and `CircumcenterKernelValidation.result`
- **Actual label**: PROVEN, Lean-formalized
- **Verdict**: OK
- **Reason**: The standalone proof and validation wrapper compile, and the source and platform declarations have the same core axiom footprint.

### F2: Equilateral-bisector collision

- **Location**: `plan.toml:25`
- **Quote**: "then p = x or c = b."
- **Stated label**: PROVEN
- **Evidence present**: `Erdos9796Mission.equilateral_bisector_collision` and `EquilateralBisectorKernelValidation.result`
- **Actual label**: PROVEN, Lean-formalized
- **Verdict**: OK
- **Reason**: The rehosted signature matches the pinned source theorem, and the standalone proof compiles without computational evidence.

### F3: Three-triad collision

- **Location**: `plan.toml:33`
- **Quote**: "Then A = B."
- **Stated label**: PROVEN
- **Evidence present**: `Erdos9796Mission.three_triad_collision` and `ThreeTriadKernelValidation.result`
- **Actual label**: PROVEN, Lean-formalized
- **Verdict**: OK
- **Reason**: The six metric hypotheses and conclusion match the pinned source theorem, and the standalone proof compiles.

### F4: Trust and scope claims

- **Location**: `README.md:13`
- **Quote**: "They support later finite-configuration and descent arguments, but none of them alone resolves a fixed cardinality case or either Erdős problem."
- **Stated label**: bookkeeping scope claim
- **Evidence present**: The three theorem statements contain only local metric hypotheses and collision conclusions.
- **Actual label**: bookkeeping scope claim
- **Verdict**: OK
- **Reason**: The text does not promote a support lemma to a proof-spine milestone or problem resolution.

## Weasel words

The automatic scan found none of the banned proof-context phrases.

## Scope conflation

No fixed-cardinality or global problem conclusion is attributed to these local
metric lemmas.

## Lean sorry graph

The theorem presentation files contain the platform-required statement holes.
The submitted solution and validation files contain no `sorry`, `admit`,
custom `axiom`, `native_decide`, `ofReduceBool`, `unsafe`, `partial`,
`implemented_by`, or `extern` declaration. The source and platform
`#print axioms` probes contain no `sorryAx` or project axiom.

## Upgrade drift

The packet republishes existing local PROVEN declarations without strengthening
their hypotheses or conclusions.

## Required before CERTIFIED

None.
