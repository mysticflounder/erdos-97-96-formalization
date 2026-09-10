# Math Skeptic Audit: split finite-nine Form `c` at `v₁`

**Target**: `submissions/finite-nine-child-form-c-v1-split`  
**Date**: 2026-09-09  
**Verdict**: CERTIFIED  
**Claims audited**: 3

## Summary

The generator replay, uploader validation, source scan, solution build, and final-consumer audit all
pass locally. Prove2Me accepted proof `da2c2503-a9f6-4569-beb8-72bc09713eef` for the target theorem.
The generated source has no proof placeholder or disallowed trust primitive. The offline axiom
closure still contains `sorryAx` through statement-only mirrors of accepted platform dependencies;
that local limitation does not contradict the recorded platform result.

## Findings

### F1: Local elaboration is accurately scoped

- **Location**: `README.md:14`
- **Quote**: "The solution elaborates under Lean 4.33.1."
- **Stated label**: Local Lean elaboration.
- **Evidence present**: `lake-build Solutions.Sol_Erdos9796FiniteNine_form_c_v1` completed 8,752
  jobs and exited 0; log
  `/Users/adam/prove2me_workspace/.lake/lake-build-logs/30833-1789016942934093000.log`.
- **Actual label**: Locally elaborated.
- **Verdict**: OK.
- **Reason**: The claim names only the check that ran and does not claim server verification.

### F2: The proof description matches the accepted proof

- **Location**: `explanation.md:1`
- **Quote**: "The proof follows the checked finite-nine Form C case analysis at the first distinguished vertex."
- **Stated label**: Lean-formalized proof transfer.
- **Evidence present**: Prove2Me accepted proof `da2c2503-a9f6-4569-beb8-72bc09713eef`; the generated
  `solution` also elaborates locally and imports the accepted `Erdos9796FiniteNine.n4e_core`
  dependency. The local audit reports `[propext, sorryAx, Classical.choice, Quot.sound]` because
  platform dependencies are mirrored by statement-only stubs.
- **Actual label**: Platform-verified Lean proof with a separately disclosed offline audit caveat.
- **Verdict**: OK.
- **Reason**: The accepted proof supports the platform label, while the packet reports the limit of
  the offline transitive-closure observation.

### F3: Final platform verification is recorded

- **Location**: `README.md:18`
- **Quote**: "Prove2Me accepted proof submission `da2c2503-a9f6-4569-beb8-72bc09713eef` for theorem `Erdos9796FiniteNine.form_c_v1` on 2026-09-10."
- **Stated label**: Accepted platform proof.
- **Evidence present**: The server receipt records theorem
  `0a9dd51c-149f-46d7-950a-fb2454f0c58f`, proof `da2c2503-a9f6-4569-beb8-72bc09713eef`, creation at
  `2026-09-10T05:37:27.92401+00:00`, and acceptance at `2026-09-10T05:45:27.265408+00:00`.
- **Actual label**: Accepted platform proof.
- **Verdict**: OK.
- **Reason**: The final status is supported by the accepted server record.

## Weasel words

None found.

## Scope conflation

The README, provenance, and validation record separate local elaboration, accepted dependency
evidence, final platform verification, and the offline statement-mirror limitation.

## Lean sorry graph

The generated solution source contains no `sorry` or `sorryAx` token. `#print axioms solution`
reports `[propext, sorryAx, Classical.choice, Quot.sound]`; the `sorryAx` enters through local
statement-only mirrors of accepted Prove2Me dependencies.

## Upgrade drift

The upgrade from submission candidate to accepted platform proof is supported by proof
`da2c2503-a9f6-4569-beb8-72bc09713eef` and its acceptance timestamp.

## Required before CERTIFIED

None for the platform-verified status. A separate offline core-clean audit remains unavailable
because accepted dependencies are represented locally by `by sorry` statement mirrors.
