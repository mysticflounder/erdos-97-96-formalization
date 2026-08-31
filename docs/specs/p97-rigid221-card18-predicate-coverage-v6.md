# P97 Rigid221 card-18 predicate coverage contract (v6)

**Status: PROMOTION READY. Verification and exact-path staged hygiene are
complete. This document records a custody-only candidate, not a Lean proof or
solver claim.**

Lane: `rigid221-card18-predicate-v6-20260831`.

Lane base: `ff935411514804caf003171164807f79d16a341e`.

## 1. Scope

Coverage v6 is a custody-only refresh of the exact coverage-v5 ledger. It
preserves all 188 candidate rows and all 38 source IDs, statuses,
representations, anchors, and execution/blocking flags. It changes exactly 37
source `custody_digest` fields to the source-manifest hashes authenticated by
the new labeled-projection and crossed-incidence custody-v4 receipts.

The remaining source row, `enrichment.labeled_finite_data`, retains the v5
domain-separated no-custody compatibility digest
`ece9e242bdeaf9a0b3feb550bf125440df4020e2e7c07c4e834878ddeb59088c`.
It is not reclassified as custody-authenticated.

## 2. Immutable predecessor

The v5 implementation and artifact are immutable inputs:

- module: 25,092 bytes, SHA-256
  `e995294e6488218a45df6ff8e2f053a338c899d58ff108a957c57c1e9ebbbd7d`;
- canonical artifact: 149,496 bytes, file SHA-256
  `99e04c4d086058de9de9de1b1c29bc0bca5eac418081792467dfc959dc77fd31`;
- artifact body self-hash:
  `cea1feeeb2c3f6543680ffdf2637feebbb22778dbe997717907ea3f27ff6bc1c`;
- frozen v5 configuration:
  `fdbba9211a117f7affab2f66d9328cb46923414ae4bf4b700ead6f6f5a110730`.

Fresh v6 attestation reads both paths with descriptor-relative no-follow
custody, verifies these exact byte records, and strictly parses the v5 artifact.
It does not freshly attest v5 against the changed source tree; that
would improperly reinterpret a historical receipt.

## 3. Custody-v4 bindings

The labeled receipt authenticates the official 26-module kernel-mined source
tuple. Its source-manifest SHA-256 is
`5248f7ac37b12e3b623059959d7f6f3c541297569c128aa7d192da93cdb39900`.
Exactly 36 v5 source rows carrying the old labeled custody digest change to
that value.

The crossed receipt authenticates the official 27-module kernel-mined source
tuple. Its source-manifest SHA-256 is
`d6348b804496e3ae6c25f70aa140ffd64ff59ac7091522fb1d0e2f7158d93929`.
Only `profile.crossed_missing_incidence` changes to that value.

`ExactA2CapMetric` is not added to either official dependency tuple. Both
custody modules and both canonical receipts are exact byte bindings, and fresh
v6 attestation calls both custody-v4 receipt attesters against the live tree.

## 4. Frozen universes and delta

The candidate universe remains byte/structure-identical to v5:

- candidate count: 188;
- candidate-row hash:
  `93130f6c5d8d59ccec64528653698eb7ca36b73a7eae734701e0d185d5644f3e`;
- candidate-ID hash:
  `ca7a9c209a01eb76153f4784569a5282bd54c96734d4e4db492a61b61d616561`;
- v6 candidate delta count: zero;
- empty candidate-delta hash:
  `4f53cda18c2baa0c0354bb5f9a3ecbe5ed12ab4d8e11ba873c2f11161202b945`.

The source universe remains 38 rows with the same 15 labeled, 16 Prop-only,
and seven absent statuses. Its refreshed row hash is
`a278b38f19da9b5b611d47b4b496d28d78cf68fc2ba8cbd1969492534434fdfe`.
The exact sorted 37-ID custody-refresh set has SHA-256
`28dc1f316c91a9c9aef64972ecfdd3f9ef034f723005afefa02db90c504ba433`.
Validation derives this delta from v4 and rejects a change to any other field.

## 5. Admission boundary

Every candidate `source_entitled` and `hard_clause_admission` flag remains
false. `hard_clause_count` remains zero. Serializer, Python/Lean
serialization, solver admission, solver readiness, proof readiness, and
canary authorization all remain false.

Coverage v6 records source custody only. It does not authenticate a Lean
build, an `.olean` tree, an axiom audit, a Python/Lean serializer relation, a
solver result, or a proof.

## 6. Fail-closed acceptance gates

The candidate implementation must:

1. reject duplicate JSON keys, non-finite constants, noncanonical bytes,
   unknown keys, malformed types, and wrong self-hashes;
2. bind exact v5 module/artifact and custody-v4 module/artifact bytes through
   no-follow, singly-linked regular-file reads;
3. freshly attest both custody-v4 receipts against the live source tree;
4. bind its own live module record and reconstruct the complete manifest;
5. preserve the exact v5 candidates and permit only the exact 37 custody
   digest changes;
6. freeze full candidate/source hashes, the empty candidate delta, the exact
   custody-refresh ID set, and the complete configuration hash;
7. reject v1-v6 schema substitution and every admission escalation; and
8. round-trip the durable artifact byte-identically under focused tests and
   Ruff.

The frozen configuration hash is
`36308a91099a1cdd7721fa6139ca3e580955646f35118e7115bfd49ceced5c41`.

Passing implementation tests is necessary but does not by itself authorize a
proof or solver claim. Publication remains a separate gate.

## 7. Review evidence

At the reviewed checkpoint:

- the implementation is 25,086 bytes with SHA-256
  `c0eaf23a98de062aeb148d1737a745479edd9cff0e6cb3c967c3dc8c6a2eb240`;
- the canonical artifact is 149,490 bytes with file SHA-256
  `1f5367af16a781b4edd0698ed5bdf90e61d462a2b47e13c15925f96c14cb6579`
  and body self-hash
  `95519eba17be4bcbe4205ed1a9d919e0c8d428f1cbace337aa905afa06227bb6`;
- the focused v6 suite passes 10 tests in 1,493.46 seconds;
- Ruff passes for the v6 implementation and tests; and
- the governed Card18 runner passes its historical v2 replay (131 passed,
  348 skipped), historical v3 replay (131 passed), live v4/v6 tests (133
  passed), and the 10,891-job `Rigid221Card18Aggregate` Lean build.

The generated run receipt records the commands, exact source and artifact
hashes, and outcomes. Exact-path staged hygiene passes for this lane; the
shared worktree's unrelated global backlog remains outside this promotion.
These results do not constitute a proof or solver claim.
