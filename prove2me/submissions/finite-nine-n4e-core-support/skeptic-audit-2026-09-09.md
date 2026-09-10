# Math Skeptic Audit: finite-nine N4e core support

**Target**: `submissions/finite-nine-n4e-core-support`
**Date**: 2026-09-09
**Verdict**: CERTIFIED
**Claims audited**: 7

## Summary

The public definition and 259,042-byte proof solution elaborate under Lean 4.33.1. The solution
source contains no proof placeholder or compiler-trust escape. Prove2Me accepted the proof against
the accepted dependency nodes. This supports a platform-verified PROVEN label. The offline axiom
report still contains `sorryAx` from statement-only dependency mirrors, so this audit does not
claim a separately observed local transitive core-only closure.

## Findings

### F1: Local elaboration is supported

- **Location**: `validation.json`
- **Quote**: "solution_elaboration: PASS"
- **Stated label**: Lean-elaborated locally
- **Evidence present**: `lake-build` log ending with exit 0
- **Actual label**: PROVEN as a local elaboration claim
- **Verdict**: OK
- **Reason**: The named solution target completed under Lean 4.33.1.

### F2: The support theorem is platform-verified

- **Location**: `provenance.md`
- **Quote**: "This establishes the theorem as platform-verified."
- **Stated label**: platform-verified PROVEN
- **Evidence present**: Prove2Me submission `1a2e8096-87cf-4595-b748-0c0ada857b8a` is `ACCEPTED`
- **Actual label**: PROVEN by platform verification
- **Verdict**: OK
- **Reason**: Server acceptance discharges the Prove2Me verification gate. The prose separately
  records that the offline mirrors prevent observing a local transitive core-only closure.

### F3: The node does not claim the final Form b exclusion

- **Location**: `explanation.md`
- **Quote**: "This node is a support result. It does not by itself exclude Form `b`."
- **Stated label**: support result
- **Evidence present**: theorem conclusion is `Nonempty (N4eCoreSupport S)`
- **Actual label**: support result
- **Verdict**: OK
- **Reason**: The prose matches the formal conclusion.

### F4: Source trust scan is supported

- **Location**: `provenance.md`
- **Quote**: "contains no `sorry`, named axiom, native reduction, compiler-trust primitive, unsafe declaration, partial declaration, or external implementation"
- **Stated label**: source-level absence claim
- **Evidence present**: generator rejects those tokens before writing the artifacts
- **Actual label**: PROVEN as a generated-source property
- **Verdict**: OK
- **Reason**: The check is deterministic and covers both generated definition and solution files.

### F5: The split completes within the server verification window

- **Location**: `README.md`
- **Quote**: "At 259,042 bytes it is less than half the 694,176-byte Form `b` monolith"
- **Stated label**: byte-size comparison
- **Evidence present**: generated artifact sizes
- **Actual label**: PROVEN as a byte-size claim and empirically verified for this server submission
- **Verdict**: OK
- **Reason**: Prove2Me accepted the 259,042-byte proof submission rather than returning the
  monolith's 300-second timeout.

### F6: Support-field count corrected

- **Location**: `provenance.md`
- **Quote**: "24 exact proof facts needed by later N4d branches, plus the zero-defect cap layout"
- **Stated label**: exact field count
- **Evidence present**: the `N4eCoreSupport` declaration
- **Actual label**: PROVEN as a source count
- **Verdict**: OK
- **Reason**: The record has 25 total fields: one layout field and 24 proof-fact fields. The earlier
  draft's claim of 25 proof facts plus the layout was corrected.

### F7: Live identifiers and statuses are supported

- **Location**: `validation.json`
- **Quote**: "\"submission_status\": \"ACCEPTED\""
- **Stated label**: live platform status
- **Evidence present**: Prove2Me apply receipt and returned server state
- **Actual label**: PROVEN as a platform-status claim
- **Verdict**: OK
- **Reason**: The definition, theorem, and submission identifiers match the successful apply result.

## Lean sorry graph

The generated solution has no `sorry`. The local final-consumer closure reaches `sorryAx` through
the statement-only mirrors of already accepted platform theorems. Prove2Me accepted the submission
using those accepted dependency nodes. A local transitive core-only axiom closure was not
separately observed.

## Required before CERTIFIED

No labeling correction remains. A future local core-only claim would require a separate axiom
closure that does not use the offline statement mirrors.
