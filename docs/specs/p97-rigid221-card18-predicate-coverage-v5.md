# P97 Rigid221 card-18 predicate coverage contract (v5)

**Status: ALL PREDICATE-COVERAGE V5 PUBLICATION GATES COMPLETE.**

Lane: `rigid221-card18-custody-refresh-v3-20260828`.

Lane base: `7cf1e60bde589fe27c246c0edbc7ad20e96d6db3`.

## 1. Scope

Coverage v5 is a custody-only refresh of the exact coverage-v4 ledger. It
preserves all 188 candidate rows and all 38 source IDs, statuses,
representations, anchors, and execution/blocking flags. It changes exactly 37
source `custody_digest` fields to the source-manifest hashes authenticated by
the new labeled-projection and crossed-incidence custody-v3 receipts.

The remaining source row, `enrichment.labeled_finite_data`, retains the v4
domain-separated no-custody compatibility digest
`ece9e242bdeaf9a0b3feb550bf125440df4020e2e7c07c4e834878ddeb59088c`.
It is not reclassified as custody-authenticated.

## 2. Immutable predecessor

The v4 implementation and artifact are immutable inputs:

- module: 68,892 bytes, SHA-256
  `0f892acee8e0d6f1e39c985b55cecaf848aa906130cb223eae42b0ee1e15b668`;
- canonical artifact: 153,018 bytes, file SHA-256
  `6b909aa48ec05cb32735c81ecd6f0fe6bd820b7fb126b7e3c1700b162905d501`;
- artifact body self-hash:
  `818ab7814ac6ab9d926aee756b2e782e57d5138a3f3abadfaa6359e14389e9d9`;
- frozen v4 configuration:
  `982a54886646d6b87a96105e08fa7cc715803dc90db2260d39a1dab8451515ac`.

Fresh v5 attestation reads both paths with descriptor-relative no-follow
custody, verifies these exact byte records, and strictly parses the v4 artifact.
It does not freshly attest v4 against the changed Exact-A2 source tree; that
would improperly reinterpret a historical receipt.

## 3. Custody-v3 bindings

The labeled receipt authenticates the official 26-module kernel-mined source
tuple. Its source-manifest SHA-256 is
`abf5ceef188044ce4aff831011cb88dfef9efeb19f30980dd33f1b85e69ec348`.
Exactly 36 v4 source rows carrying the old labeled custody digest change to
that value.

The crossed receipt authenticates the official 27-module kernel-mined source
tuple. Its source-manifest SHA-256 is
`bd84bae401c4852b236e46c7d4444698c8cf53392c875ebf2cebacd14060875e`.
Only `profile.crossed_missing_incidence` changes to that value.

`ExactA2CapMetric` is not added to either official dependency tuple. Both
custody modules and both canonical receipts are exact byte bindings, and fresh
v5 attestation calls both custody-v3 receipt attesters against the live tree.

## 4. Frozen universes and delta

The candidate universe remains byte/structure-identical to v4:

- candidate count: 188;
- candidate-row hash:
  `93130f6c5d8d59ccec64528653698eb7ca36b73a7eae734701e0d185d5644f3e`;
- candidate-ID hash:
  `ca7a9c209a01eb76153f4784569a5282bd54c96734d4e4db492a61b61d616561`;
- v5 candidate delta count: zero;
- empty candidate-delta hash:
  `4f53cda18c2baa0c0354bb5f9a3ecbe5ed12ab4d8e11ba873c2f11161202b945`.

The source universe remains 38 rows with the same 15 labeled, 16 Prop-only,
and seven absent statuses. Its refreshed row hash is
`9a8587a2953e137705d169e2db1b03b25255315115fccd1ad07c5662c649e76b`.
The exact sorted 37-ID custody-refresh set has SHA-256
`28dc1f316c91a9c9aef64972ecfdd3f9ef034f723005afefa02db90c504ba433`.
Validation derives this delta from v4 and rejects a change to any other field.

## 5. Admission boundary

Every candidate `source_entitled` and `hard_clause_admission` flag remains
false. `hard_clause_count` remains zero. Serializer, Python/Lean
serialization, solver admission, solver readiness, proof readiness, and
canary authorization all remain false.

Coverage v5 records source custody only. It does not authenticate a Lean
build, an `.olean` tree, an axiom audit, a Python/Lean serializer relation, a
solver result, or a proof.

## 6. Fail-closed acceptance gates

The candidate implementation must:

1. reject duplicate JSON keys, non-finite constants, noncanonical bytes,
   unknown keys, malformed types, and wrong self-hashes;
2. bind exact v4 module/artifact and custody-v3 module/artifact bytes through
   no-follow, singly-linked regular-file reads;
3. freshly attest both custody-v3 receipts against the live source tree;
4. bind its own live module record and reconstruct the complete manifest;
5. preserve the exact v4 candidates and permit only the exact 37 custody
   digest changes;
6. freeze full candidate/source hashes, the empty candidate delta, the exact
   custody-refresh ID set, and the complete configuration hash;
7. reject v1-v5 schema substitution and every admission escalation; and
8. round-trip the durable artifact byte-identically under focused tests and
   Ruff.

The frozen configuration hash is
`fdbba9211a117f7affab2f66d9328cb46923414ae4bf4b700ead6f6f5a110730`.

Passing implementation tests is necessary but does not by itself authorize a
proof or solver claim. Publication remains a separate gate.

## 7. Review evidence

At the reviewed checkpoint:

- the implementation is 25,092 bytes with SHA-256
  `e995294e6488218a45df6ff8e2f053a338c899d58ff108a957c57c1e9ebbbd7d`;
- the canonical artifact is 149,496 bytes with file SHA-256
  `99e04c4d086058de9de9de1b1c29bc0bca5eac418081792467dfc959dc77fd31`
  and body self-hash
  `cea1feeeb2c3f6543680ffdf2637feebbb22778dbe997717907ea3f27ff6bc1c`;
- predecessor rows are cached only as immutable canonical bytes/tuples, while
  every public row accessor returns fresh mutable copies;
- the focused exact-delta test passes 1 test in 91.41 seconds after correcting
  its immutable source-ID binding; and
- the complete v5 suite passes 10 tests in 793.14 seconds after replacing
  mutable row-object caches with immutable canonical payload caches;
- Ruff check passes for the v5 implementation and tests;
- the Card18 aggregate build completes successfully at 10,888 jobs.

The full governed Card18 runner passes 131 historical tests with 348 skips and
131 live v3/v5 tests. Exact-path staged hygiene passes with no foreign staged
path. These results do not constitute a proof or solver claim.
