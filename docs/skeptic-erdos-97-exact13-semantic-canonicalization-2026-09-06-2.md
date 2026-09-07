# Scoped skeptic audit: exact-thirteen source status and coverage

**Target:** [semantic note](erdos-97-exact13-semantic-canonicalization.md),
its checked-source/coverage sections, and the corresponding
[atomic-proof paragraph](erdos-97-descent-prose-proof-atomic.md#114-the-two-radius-branch-exact-twelve-and-larger-carriers).
**Date:** 2026-09-06.
**Verdict:** CERTIFIED for the recorded local results and status distinctions.
**Claims audited:** three local adapter results and the conditional finite
coverage contract. This is not a new whole-proof or aggregate axiom audit.

## Evidence and findings

### F1: Canonicalization has a retained focused Lean check

- **Location:** semantic note, “Checked source implementations.”
- **Quote:** “The canonicalization and eighteen-choice public probes report
  only `propext`, `Classical.choice`, and `Quot.sound`.”
- **Label:** PROVEN, Lean-formalized under the declarations' hypotheses.
- **Evidence:** the [canonicalization receipt](audits/2026-09-06-exact13-semantic-canonicalization.md)
  records a successful Lean 4.27 check and both public axiom probes.
- **Verdict:** OK for the recorded focused check. Current source SHA-256 is
  `74b6279c153c0659b20f9d34deb8d263715477310adad77e2a510b7249c7dda3`,
  matching the source committed at `2c677e734`.

### F2: Raw-cover validation is described at its supported scope

- **Location:** semantic note, RawCover table row.
- **Quote:** “Checked as a dependency of the focused canonicalization check.”
- **Evidence:** the canonicalization receipt states that RawCover was
  materialized and checked as a dependency. There is no separately retained
  RawCover axiom-probe receipt in this audit's evidence set.
- **Verdict:** OK. The note does not invent a standalone receipt. Current
  source SHA-256 is
  `81968814e6a1a6a770a21451f77acf84785fc96f4c2ad07d72a48bdbfe5e9628`,
  matching `2edd25755`.

### F3: The eighteen-choice result has a complete local audit

- **Location:** semantic note, ExclusiveApex18 table row.
- **Quote:** “Exclusive blocker, support-partition witness, and eighteen choices.”
- **Label:** PROVEN, Lean-formalized under the declarations' hypotheses.
- **Evidence:** the [fourteen-declaration audit](skeptic-CardGeThirteenExact13ExclusiveApex18-2026-09-06.md)
  records a successful focused check and the three standard axioms for every
  public declaration. Its checked source SHA-256 matches current bytes:
  `75ed653182b37db7df61466de7fb7ebca2db57fdb7ee6d74543ebf3ca9f3429b`.
- **Verdict:** OK. The earlier recorded execution HEAD is consistent with
  the receipt's documented pre-commit testing and later finalization; it is
  not asserted to be the commit containing the final checked source bytes.

### F4: Source key production and universal coverage remain distinct

- **Location:** semantic note, “Remaining finite-coverage obligation.”
- **Quote:** “It does not supply the exhaustive coverage proof.”
- **Evidence:** `exists_mem_strongValidKeys` returns a valid key and its
  source-order witness for every `Input`. `StrongValidKeyCover bank` still
  requires a checked matching entry for every key in the finite set.
  The [strong-source receipt](audits/2026-09-06-exact13-strong-valid-source-refinement-20260906.md)
  records the source theorem checks; the
  [representative certificate receipt](audits/2026-09-06-exact13-representative-certificate-20260906.md)
  checks only two authenticated entries.
- **Verdict:** OK. Arbitrary strong-key membership does not assert geometric
  realizability. The complete coverage theorem and exact-thirteen terminal
  are not claimed. The wave5 SAT budget terminal and interrupted wave6 are
  described consistently with their retained audits.

## Historical draft handling

The [archive](archive/2026-09-06-exact13-semantic-uncompiled-drafts.md) labels
the prior note as historical and points readers to current authority.
Its payload is byte-for-byte the note from `fa66927f7`, with SHA-256
`cf1a4549e57322252e187a9da3651d3fbbbb846e0b862b86af697a754914e9ca`.
The archival header is additional metadata and is excluded from that payload
hash. The active note contains no embedded obsolete Lean implementation.

Independent source/receipt review and an independent final document review
accepted this scope. No new Lean build was run for this documentation audit.
These receipts do not establish aggregate-spine reachability, publication,
Lean-ingress promotion, or the final contradiction.
