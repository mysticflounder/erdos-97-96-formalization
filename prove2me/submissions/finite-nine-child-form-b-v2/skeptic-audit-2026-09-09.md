# Math Skeptic Audit: finite-nine Form `b` at `v₂`

**Target:** `Erdos9796FiniteNine.form_b_v2` packet  
**Date:** 2026-09-09  
**Verdict:** CERTIFIED  
**Claims audited:** 7

## Summary

The 5,656-byte generated source and its audit elaborate under Lean 4.33.1. The source contains no
forbidden proof or implementation-trust token, and its only proof dependency is the accepted
Form-B-at-v1 submission. Prove2Me accepted target proof submission
`4dc55b21-a512-4a1c-9e81-161649b772be` and reports theorem status `Proved`, supporting the
platform-verified PROVEN label. The local final-consumer probe separately contains `sorryAx`
because the offline workspace represents the accepted predecessor by a statement-only mirror.

## Findings

### F1: Target proof is platform verified

- **Location:** `explanation.md:7`
- **Quote:** “Applying it to the cyclically shifted shell and rewriting the three transported
  objects produces the target proof term for `S.N4dExcludesFormB_v2`.”
- **Stated label:** Platform-verified Lean proof.
- **Evidence present:** Accepted predecessor proof `03e034b0-3f2c-4371-bf58-a37f96e453a2`, local
  solution build exit 0, and accepted target proof submission
  `4dc55b21-a512-4a1c-9e81-161649b772be` for theorem
  `706aaedc-4e9a-4aad-8ee6-3b57c6a19423`, now status `Proved`.
- **Actual label:** PROVEN — Lean-formalized and platform verified.
- **Verdict:** OK.
- **Reason:** Prove2Me accepted the final target proof. The local
  `[propext, sorryAx, Classical.choice, Quot.sound]` report describes the offline predecessor mirror
  and is not presented as the platform proof closure.

### F2: Authenticated-source claim is exact

- **Location:** `provenance.md:19`
- **Quote:** “The stage-3 authenticated target fragment is
  `submissions/finite-nine-modular/source-fragments/form_b_v2.lean`, 644 bytes.”
- **Stated label:** Exact source-custody claim.
- **Evidence present:** Generator replay checks the 644-byte target fragment, the 12,271-byte
  cyclic fragment, the current module, and the target declaration header against recorded
  SHA-256 digests.
- **Actual label:** EMPIRICALLY VERIFIED over those exact repository bytes.
- **Verdict:** OK.
- **Reason:** The replayed generator fails closed on any digest or statement-header change.

### F3: Minimal-slice claim matches the generated source

- **Location:** `README.md:8`
- **Quote:** “The generated solution retains only the first cyclic-shift construction and the
  three definitional transport lemmas used by the 644-byte target fragment.”
- **Stated label:** Exact generated-source scope claim.
- **Evidence present:** The generated file contains the first shift construction, its required
  private non-membership theorem, and exactly the witness-class, first-cap, and Form-B transport
  lemmas; exclusion scans find no `cyclicShift3` or unrelated final exclusion.
- **Actual label:** EMPIRICALLY VERIFIED over the 5,656-byte generated artifact.
- **Verdict:** OK.
- **Reason:** Both positive declaration checks and negative exclusion scans agree with the claim.

### F4: Formal and natural-language statements agree

- **Location:** `plan.toml:17`
- **Quote:** “an escaping witness class with at least four points at the second distinguished
  vertex cannot have Form b.”
- **Stated label:** Natural-language rendering of the formal target.
- **Evidence present:** The public statement expands `N4dExcludesFormB_v2` to quantify a positive
  radius, require `4 ≤ card`, require escape from `C₂`, and refute `IsFormB_v2`.
- **Actual label:** EMPIRICALLY VERIFIED by statement inspection.
- **Verdict:** OK.
- **Reason:** “At least four points” preserves the formal lower bound rather than asserting exact
  cardinality four.

### F5: Accepted predecessor substitution is documented

- **Location:** `provenance.md:32`
- **Quote:** “The only deliberate proof-link substitution replaces the source-private call to
  `N4dExcludesFormB_v1_proof` by the accepted public theorem
  `Erdos9796FiniteNine.form_b_v1`.”
- **Stated label:** Exact dependency substitution claim.
- **Evidence present:** Generated line 132 applies the named public predecessor; receipt evidence
  records theorem `b6bb5e30-c060-4622-9cea-acaa92a6be0d` and accepted proof
  `03e034b0-3f2c-4371-bf58-a37f96e453a2`.
- **Actual label:** EMPIRICALLY VERIFIED over the source and receipt records.
- **Verdict:** OK.
- **Reason:** The generator requires exactly one source-private predecessor occurrence before
  performing the substitution.

### F6: Source-private antecedent accounting is sufficient

- **Location:** `provenance.md:29`
- **Quote:** “The non-membership theorem is the source-private antecedent required by the retained
  cap-triple construction.”
- **Stated label:** Dependency-accounting claim.
- **Evidence present:** `b3n9m073_cyclicShiftCP` directly calls
  `b3n9m073_not_mem_verts_of_not_mem_cyclicShift_verts`, and both elaborate in the generated
  solution.
- **Actual label:** EMPIRICALLY VERIFIED over the retained source slice.
- **Verdict:** OK.
- **Reason:** The wording records direct necessity for this construction without claiming a
  globally minimal proof basis.

### F7: Forbidden-token and local-axiom claims are separated

- **Location:** `README.md:12`
- **Quote:** “The local axiom report is expected to include `sorryAx` because the accepted
  predecessor is represented in the offline Prove2Me workspace by a statement-only mirror.”
- **Stated label:** Local trust-boundary claim.
- **Evidence present:** The generated-source scan has no forbidden token; the audit reports
  `[propext, sorryAx, Classical.choice, Quot.sound]` and the predecessor build warning identifies
  the statement-only mirror.
- **Actual label:** EMPIRICALLY VERIFIED in the pinned offline workspace.
- **Verdict:** OK.
- **Reason:** The packet does not infer transitive axiom cleanliness from the source scan.

## Weasel words

None found.

## Scope conflation

The packet distinguishes local elaboration, accepted predecessor verification, and accepted
platform verification of the new target. It does not describe the local mirror's `sorryAx` as a
dependency of the accepted platform proof.

## Lean sorry graph

The generated solution has no `sorry` or `sorryAx` token. The local transitive dependency graph
contains `sorryAx` through the statement-only mirror of the accepted predecessor. Prove2Me
accepted the target proof; the local mirror result remains a separate offline limitation.

## Upgrade drift

The upgrade from author-verified candidate to platform-verified PROVEN is supported by accepted
proof submission `4dc55b21-a512-4a1c-9e81-161649b772be` and theorem status `Proved`.
