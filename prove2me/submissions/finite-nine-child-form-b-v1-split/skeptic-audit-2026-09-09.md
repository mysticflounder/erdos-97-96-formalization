# Math Skeptic Audit: finite-nine Form B at v1 split proof

**Target**: `submissions/finite-nine-child-form-b-v1-split`
**Date**: 2026-09-09
**Verdict**: CERTIFIED
**Claims audited**: 6

## Summary

The 374,744-byte generated solution elaborates under Lean 4.33.1 and passes the source-level trust
scan. The two imported support theorems and the final theorem have accepted Prove2Me proofs. Proof
submission `03e034b0-3f2c-4371-bf58-a37f96e453a2` supports the platform-verified PROVEN label. The
offline statement mirrors place `sorryAx` in the locally observed transitive axiom closure, so this
audit does not claim a separate local transitive core-only result.

## Findings

### F1: Local elaboration claim is supported

- **Location**: `validation.json:52`
- **Quote**: "lean_4_33_1_solution_elaboration: PASS"
- **Stated label**: Lean-elaborated locally
- **Evidence present**: solution `lake-build` log ending with exit 0
- **Actual label**: PROVEN as a local elaboration claim
- **Verdict**: OK
- **Reason**: The named solution target completed under Lean 4.33.1.

### F2: Artifact size and digest are supported

- **Location**: `README.md:8`
- **Quote**: "The generated solution is 374,744 bytes."
- **Stated label**: exact artifact property
- **Evidence present**: generator replay and SHA-256 record
- **Actual label**: PROVEN as an artifact property
- **Verdict**: OK
- **Reason**: Regeneration reproduced both the byte count and digest.

### F3: Source-level trust scan is supported

- **Location**: `provenance.md:31`
- **Quote**: "The generated solution contains no `sorry`, named axiom, native reduction, compiler-trust primitive, unsafe or partial declaration, or external implementation."
- **Stated label**: generated-source absence claim
- **Evidence present**: generator rejection rule and independent token scan
- **Actual label**: PROVEN as a generated-source property
- **Verdict**: OK
- **Reason**: The scan returned no matching token in the proof source.

### F4: Accepted dependency claims are supported

- **Location**: `provenance.md:14`
- **Quote**: "accepted theorem `Erdos9796FiniteNine.n4e_core`"
- **Stated label**: platform-status claim
- **Evidence present**: accepted proof IDs for both imported support theorems
- **Actual label**: PROVEN as a dependency-status claim
- **Verdict**: OK
- **Reason**: The recorded theorem and proof identifiers match the accepted support packets.

### F5: Timeout history is accurately scoped

- **Location**: `README.md:10`
- **Quote**: "each timed out after 300 seconds"
- **Stated label**: server-attempt history
- **Evidence present**: preserved submission IDs and error messages
- **Actual label**: PROVEN as a historical status claim
- **Verdict**: OK
- **Reason**: Both monolithic attempts returned the same timeout without a Lean diagnostic.

### F6: Final theorem is platform-verified

- **Location**: `validation.json:54`
- **Quote**: "server_verification: PASS"
- **Stated label**: platform-verified PROVEN
- **Evidence present**: accepted proof submission `03e034b0-3f2c-4371-bf58-a37f96e453a2`
- **Actual label**: PROVEN by platform verification
- **Verdict**: OK
- **Reason**: The accepted final proof consumes the two accepted support theorem dependencies, and
  the local statement-mirror caveat is recorded separately.

## Lean sorry graph

The generated solution has no proof placeholder. The offline audit reports
`[propext, sorryAx, Classical.choice, Quot.sound]` because accepted Prove2Me dependencies are
represented locally by statement-only mirrors. This is sufficient for the local elaboration claim
and insufficient for a local transitive core-only claim.

## Required before CERTIFIED

No labeling correction remains. A future local transitive core-only claim would require an axiom
closure that does not use the offline statement mirrors.
