# Math Skeptic Audit: finite-nine Form A at v1

**Target**: `submissions/finite-nine-child-form-a-v1`
**Date**: 2026-09-09
**Verdict**: CERTIFIED
**Claims audited**: 6

## Summary

The generated solution compiles under Lean 4.33.1 and passes the source-level trust scan. Prove2Me
accepted proof submission `c8238e1b-ad33-43cc-8566-185a03a405e6` for theorem
`34a0a695-2a9d-47f4-b9c6-c3b38c82705d`, supporting the platform-verified label. Its offline
transitive axiom closure contains `sorryAx` through the offline dependency theorem mirrors/stubs,
so the packet makes no local core-only proof claim.

## Findings

### F1: Artifact identity is supported

- **Location**: `README.md:11`
- **Quote**: "The generated solution is 265,766 bytes."
- **Stated label**: exact artifact property
- **Evidence present**: generator replay and SHA-256 record in `validation.json`
- **Actual label**: PROVEN as an artifact property
- **Verdict**: OK
- **Reason**: Regeneration reproduced the byte count and digest
  `7ec0d0a7fc86089ed2236b947ca35e6026cf3d28f879961ac880aad51e36fea2`.

### F2: Source-custody claim is supported

- **Location**: `provenance.md:19`
- **Quote**: "`generate.py` authenticates the preserved full-stream snapshot, the 171,986-byte Form A fragment, both current source modules, and the exact current target declaration header."
- **Stated label**: exact source-binding claim
- **Evidence present**: pinned byte counts and SHA-256 checks enforced by `generate.py`
- **Actual label**: PROVEN as an artifact-custody property
- **Verdict**: OK
- **Reason**: Generator replay failed closed on every named source and reproduced the submitted
  artifact.

### F3: Local elaboration claim is supported

- **Location**: `validation.json:81`
- **Quote**: "lean_4_33_1_solution_elaboration: PASS"
- **Stated label**: Lean-elaborated locally
- **Evidence present**: governed solution build log ending with 8,752 jobs and exit 0
- **Actual label**: PROVEN as a local elaboration claim
- **Verdict**: OK
- **Reason**: The exact generated solution target completed under Lean 4.33.1.

### F4: Source-level trust claim is supported

- **Location**: `README.md:15`
- **Quote**: "The generated source contains no proof placeholder, named axiom, native/compiler trust primitive, unsafe or partial declaration, or external implementation."
- **Stated label**: generated-source absence claim
- **Evidence present**: generator rejection rule and independent forbidden-token scan
- **Actual label**: PROVEN as a generated-source property
- **Verdict**: OK
- **Reason**: The scan returned no matching token in the submitted solution source.

### F5: Accepted dependency claims are supported

- **Location**: `provenance.md:8`
- **Quote**: "The proof imports these live Prove2Me dependencies:"
- **Stated label**: platform-status claim for the named imports
- **Evidence present**: theorem, proof, and definition identifiers from their accepted receipts
- **Actual label**: PROVEN as a dependency-status claim
- **Verdict**: OK
- **Reason**: The identifiers match the accepted Form-B-at-v2 and N4e-core packets and the public
  N4d packet definition.

### F6: Final platform status is supported

- **Location**: `validation.json:98`
- **Quote**: "platform-verified through accepted proof submission c8238e1b-ad33-43cc-8566-185a03a405e6"
- **Stated label**: platform-verified target proof
- **Evidence present**: accepted proof submission `c8238e1b-ad33-43cc-8566-185a03a405e6` for theorem
  `34a0a695-2a9d-47f4-b9c6-c3b38c82705d`
- **Actual label**: PROVEN as a platform-acceptance claim
- **Verdict**: OK
- **Reason**: Prove2Me created the submission at `2026-09-10T05:30:23.712256+00:00` and accepted it
  at `2026-09-10T05:37:09.807499+00:00`.

## Weasel words

No proof-context weasel word or prohibited proof-comparison wording was found in the packet prose.

## Scope conflation

The packet keeps source authentication, local elaboration, accepted dependency status, accepted
target status, and the offline mirror/stub limitation as separate claims.

## Lean sorry graph

The generated solution contains no proof placeholder. The final-consumer audit reports
`[propext, sorryAx, Classical.choice, Quot.sound]`; `sorryAx` enters through offline dependency
theorem mirrors/stubs. This supports local elaboration and does not support a local transitive
core-only proof claim.

## Upgrade drift

The upgrade from locally elaborated candidate to platform-verified PROVEN is supported by accepted
proof submission `c8238e1b-ad33-43cc-8566-185a03a405e6`. A future local transitive core-only claim
would require replacing or discharging the offline dependency theorem mirrors/stubs with proof
terms whose status is independently evidenced, then rerunning the final-consumer audit.
