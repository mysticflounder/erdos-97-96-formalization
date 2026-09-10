# Math Skeptic Audit: finite-nine N4d Form B branch support

**Target**: `submissions/finite-nine-n4d-formb-branch-support`
**Date**: 2026-09-09
**Verdict**: CERTIFIED
**Claims audited**: 6

## Summary

The public definition, theorem stub, and 327,541-byte proof solution elaborate under Lean 4.33.1.
The generated definition and solution contain no proof placeholder or compiler-trust escape.
Prove2Me accepted proof submission `e7aae940-ff91-4c37-a2d9-a7284461f1ba`, supporting the
platform-verified PROVEN label. The offline axiom report contains `sorryAx` from accepted-theorem
mirrors, so this audit does not claim a separately observed local transitive core-only closure.

## Findings

### F1: Local elaboration is supported

- **Location**: `validation.json:35`
- **Quote**: "solution_elaboration: PASS"
- **Stated label**: Lean-elaborated locally
- **Evidence present**: `lake-build` log ending with exit 0
- **Actual label**: PROVEN as a local elaboration claim
- **Verdict**: OK
- **Reason**: The named solution target completed under Lean 4.33.1.

### F2: The support record has the claimed scope

- **Location**: `explanation.md:11`
- **Quote**: "This is a branch-support theorem."
- **Stated label**: support result
- **Evidence present**: the theorem concludes `Nonempty (N4dFormBBranchSupport S Z)`
- **Actual label**: support result
- **Verdict**: OK
- **Reason**: The prose does not claim the final Form `b` exclusion.

### F3: The source-size statement is exact

- **Location**: `README.md:13`
- **Quote**: "The generated solution is 327,541 bytes"
- **Stated label**: byte-size claim
- **Evidence present**: generator output and `validation.json`
- **Actual label**: PROVEN as an artifact property
- **Verdict**: OK
- **Reason**: The generated file has the recorded byte count and remains below 350 KiB.

### F4: Source trust scan is supported

- **Location**: `provenance.md:36`
- **Quote**: "contain no proof placeholder, named axiom, native reduction, compiler-trust primitive, unsafe declaration, partial declaration, or external implementation"
- **Stated label**: source-level absence claim
- **Evidence present**: generator rejection rule and an independent forbidden-token scan
- **Actual label**: PROVEN as a generated-source property
- **Verdict**: OK
- **Reason**: Both generated proof-bearing artifacts pass the stated scan.

### F5: Accepted dependency state is supported

- **Location**: `provenance.md:9`
- **Quote**: "accepted theorem `Erdos9796FiniteNine.n4e_core`"
- **Stated label**: platform-status claim
- **Evidence present**: accepted proof ID `1a2e8096-87cf-4595-b748-0c0ada857b8a`
- **Actual label**: PROVEN as a dependency-status claim
- **Verdict**: OK
- **Reason**: The identifiers match the prior accepted packet receipt.

### F6: The new theorem is platform-verified

- **Location**: `validation.json:42`
- **Quote**: "server_verification: PASS"
- **Stated label**: platform-verified PROVEN
- **Evidence present**: accepted proof submission `e7aae940-ff91-4c37-a2d9-a7284461f1ba`
- **Actual label**: PROVEN by platform verification
- **Verdict**: OK
- **Reason**: The receipt records the definition and theorem as published and the proof as
  accepted. The local statement-mirror caveat is recorded separately.

## Lean sorry graph

The generated solution has no `sorry`. The local final-consumer closure reaches `sorryAx` through
the statement-only mirrors of accepted Prove2Me dependencies. The exact observed closure is
`[propext, sorryAx, Classical.choice, Quot.sound]`. A local transitive core-only closure was not
separately observed.

## Required before CERTIFIED

No labeling correction remains. A future local core-only claim would require a separate axiom
closure that does not use the offline statement mirrors.
