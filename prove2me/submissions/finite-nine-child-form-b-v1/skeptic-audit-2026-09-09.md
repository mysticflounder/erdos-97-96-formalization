# Math Skeptic Audit: finite-nine Form `b` at `v₁`

**Target**: `submissions/finite-nine-child-form-b-v1/`
**Date**: 2026-09-09
**Verdict**: NEEDS WORK
**Claims audited**: 1

## Summary

The generated `solution` elaborates under Lean 4.33.1 and contains no forbidden proof or trust
tokens. Its local transitive axiom report still contains `sorryAx` because the accepted Prove2Me
dependencies are represented in the offline workspace by statement-only `by sorry` mirrors.
Consequently, the local evidence does not support a core-clean Lean-formalized label. Prove2Me
attempted the monolithic source twice, but each verification timed out after 300 seconds without a
Lean rejection diagnostic. Keep the packet at **NEEDS WORK** and split its support chain into
smaller accepted nodes before retrying the final proof.

## Findings

### F1: Local dependency closure contains `sorryAx`

- **Location**: `explanation.md:8`
- **Quote**: "These branch eliminations show that no positive-radius four-point witness class escaping the first cap can have Form `b`."
- **Stated label**: Implicitly Lean-formalized.
- **Evidence present**: `Sol_Erdos9796FiniteNine_form_b_v1.lean:14933` defines the top-level
  `solution`; the solution build completed 8,749 jobs and exited 0; the audit build completed 8,750
  jobs and exited 0; `#print axioms solution` reported
  `[propext, sorryAx, Classical.choice, Quot.sound]`.
- **Actual label**: CONJECTURED as an unconditional core-clean claim in this offline packet. The
  generated proof is a locally elaborated submission candidate conditional on the mirrored
  Prove2Me dependencies.
- **Verdict**: DOWNGRADE TO CONJECTURED pending server verification.
- **Reason**: The math-skeptic policy does not certify a Lean-backed claim whose transitive closure
  contains `sorryAx`, even when that axiom comes only from statement mirrors and is absent from the
  submitted solution source.

### F2: Server verification did not complete

- **Location**: `validation.json` (`server_attempts`)
- **Quote**: "Verification timed out after 300s"
- **Stated label**: No certified label; server verification was the outstanding gate.
- **Evidence present**: Submission `e79c8662-4da5-4028-a16a-ae1139352bd1` and receipt-backed retry
  `c48a71c4-7c62-4cd8-8fb6-0e12fad9dada` both ended in `ERROR` with the same timeout message.
- **Actual label**: CONJECTURED as an unconditional core-clean claim.
- **Verdict**: REJECT certification of the monolithic packet.
- **Reason**: A timeout supplies no server-checked proof evidence. It also supplies no Lean
  diagnostic against the proof, so the finding is about verification completeness and payload
  size, not mathematical falsity.

## Weasel words

No flagged proof-context weasel words were found in the packet explanation.

## Scope conflation

The packet metadata now distinguishes local elaboration from server-side dependency verification.
It does not present the successful local build as a core-clean closure audit.

## Lean sorry graph

- Generated solution scan: no `sorry`, `sorryAx`, `native_decide`, compiler-trust primitive,
  unsafe/partial declaration, external implementation, or named axiom token.
- Local transitive closure: `[propext, sorryAx, Classical.choice, Quot.sound]`.
- Identified source of `sorryAx`: imported statement-only mirrors for accepted Prove2Me theorem
  nodes.

## Upgrade drift

No unsupported label upgrade was identified. The metadata records the current result as
`SERVER_TIMEOUT_SPLIT_REQUIRED`.

## Required before CERTIFIED

1. Split the reusable authenticated support chain into smaller Prove2Me theorem nodes.
2. Replace the monolithic final payload with a short proof consuming those accepted nodes.
3. Record server evidence that the final proof was accepted without relying on the offline
   statement-only `by sorry` mirrors.
4. Re-run the skeptic audit using that server evidence and update the verdict only if the remaining
   trust boundary is discharged.
