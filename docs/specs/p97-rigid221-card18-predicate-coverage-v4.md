# P97 Rigid221 card-18 predicate coverage contract (v4)

**Status: ALL PREDICATE-COVERAGE V4 PUBLICATION GATES COMPLETE.**

Lane: `rigid221-card18-custody-refresh-v2-20260828`.

Lane base: `6d0fcc389255ac24be267636abb8f7545d63bcb7`.

## 1. Scope

Coverage v4 is a custody-only refresh of the exact coverage-v3 ledger. It
preserves all 188 candidate rows and all 38 source IDs, statuses,
representations, anchors, and execution/blocking flags. It changes exactly 37
source `custody_digest` fields to the source-manifest hashes authenticated by
the new labeled-projection and crossed-incidence custody-v2 receipts.

The remaining source row, `enrichment.labeled_finite_data`, retains the v3
domain-separated no-custody compatibility digest
`ece9e242bdeaf9a0b3feb550bf125440df4020e2e7c07c4e834878ddeb59088c`.
It is not reclassified as custody-authenticated.

## 2. Immutable predecessor

The v3 implementation and artifact are immutable inputs:

- module: 68,892 bytes, SHA-256
  `0f892acee8e0d6f1e39c985b55cecaf848aa906130cb223eae42b0ee1e15b668`;
- canonical artifact: 153,018 bytes, file SHA-256
  `6b909aa48ec05cb32735c81ecd6f0fe6bd820b7fb126b7e3c1700b162905d501`;
- artifact body self-hash:
  `818ab7814ac6ab9d926aee756b2e782e57d5138a3f3abadfaa6359e14389e9d9`;
- frozen v3 configuration:
  `2c85fb76c85513297fc64766ff3a6d6043deb9576044faf7581278e24be91ba9`.

Fresh v4 attestation reads both paths with descriptor-relative no-follow
custody, verifies these exact byte records, and strictly parses the v3 artifact.
It does not freshly attest v3 against the changed Exact-A2 source tree; that
would improperly reinterpret a historical receipt.

## 3. Custody-v2 bindings

The labeled receipt authenticates the official 26-module kernel-mined source
tuple. Its source-manifest SHA-256 is
`aca73e5476aacfefd25b675e29a785d41a40e7b594bdccf6ed2ad4c98c3e93cc`.
Exactly 36 v3 source rows carrying the old labeled custody digest change to
that value.

The crossed receipt authenticates the official 27-module kernel-mined source
tuple. Its source-manifest SHA-256 is
`0740aa1cefe54d9c68bc5b1852f685cdb11c8d7fba55f9b27898be59660ef90e`.
Only `profile.crossed_missing_incidence` changes to that value.

`ExactA2CapMetric` is not added to either official dependency tuple. Both
custody modules and both canonical receipts are exact byte bindings, and fresh
v4 attestation calls both custody-v2 receipt attesters against the live tree.

## 4. Frozen universes and delta

The candidate universe remains byte/structure-identical to v3:

- candidate count: 188;
- candidate-row hash:
  `93130f6c5d8d59ccec64528653698eb7ca36b73a7eae734701e0d185d5644f3e`;
- candidate-ID hash:
  `ca7a9c209a01eb76153f4784569a5282bd54c96734d4e4db492a61b61d616561`;
- v4 candidate delta count: zero;
- empty candidate-delta hash:
  `4f53cda18c2baa0c0354bb5f9a3ecbe5ed12ab4d8e11ba873c2f11161202b945`.

The source universe remains 38 rows with the same 15 labeled, 16 Prop-only,
and seven absent statuses. Its refreshed row hash is
`72b634e12de9eb68d9c2f7f451e997ba3ba54331eed9450e7c7a53d27185b7c4`.
The exact sorted 37-ID custody-refresh set has SHA-256
`28dc1f316c91a9c9aef64972ecfdd3f9ef034f723005afefa02db90c504ba433`.
Validation derives this delta from v3 and rejects a change to any other field.

## 5. Admission boundary

Every candidate `source_entitled` and `hard_clause_admission` flag remains
false. `hard_clause_count` remains zero. Serializer, Python/Lean
serialization, solver admission, solver readiness, proof readiness, and
canary authorization all remain false.

Coverage v4 records source custody only. It does not authenticate a Lean
build, an `.olean` tree, an axiom audit, a Python/Lean serializer relation, a
solver result, or a proof.

## 6. Fail-closed acceptance gates

The candidate implementation must:

1. reject duplicate JSON keys, non-finite constants, noncanonical bytes,
   unknown keys, malformed types, and wrong self-hashes;
2. bind exact v3 module/artifact and custody-v2 module/artifact bytes through
   no-follow, singly-linked regular-file reads;
3. freshly attest both custody-v2 receipts against the live source tree;
4. bind its own live module record and reconstruct the complete manifest;
5. preserve the exact v3 candidates and permit only the exact 37 custody
   digest changes;
6. freeze full candidate/source hashes, the empty candidate delta, the exact
   custody-refresh ID set, and the complete configuration hash;
7. reject v1-v4 schema substitution and every admission escalation; and
8. round-trip the durable artifact byte-identically under focused tests and
   Ruff.

The frozen configuration hash is
`982a54886646d6b87a96105e08fa7cc715803dc90db2260d39a1dab8451515ac`.

Passing implementation tests is necessary but does not by itself authorize a
proof or solver claim. Publication remains a separate gate.

## 7. Review evidence

At the reviewed checkpoint:

- the implementation is 24,579 bytes with SHA-256
  `d321d90f83bcc59a633cffac3e861297b6e9b025c39dbd10e86424cc7eaab988`;
- the canonical artifact is 149,496 bytes with file SHA-256
  `b5f6a852199270e890a916dbfbe2193829a7e5b57c30c71f734a262e7626ede0`
  and body self-hash
  `b152ec0b1e924947bace23ec9e774170f348e94bc3d742a229891fbe6d6c577c`;
- the focused v4 suite passes 10 tests, including exact-delta derivation,
  canonical round-trip, fresh live attestation, schema substitution,
  malformed JSON, immutable-input tampering, and stale-source rejection; and
- Ruff check and format-check pass for the v4 implementation and tests;
- the full live v2/v4 suite passes 131 tests, while all 348 immutable
  predecessor tests pass in the pinned v3 source snapshot;
- the Card18 aggregate build completes successfully at 10,887 jobs; and
- independent adversarial review returns **GO**, finding exactly 36 labeled
  custody changes, one crossed custody change, and no other row delta.

Exact-path staged hygiene passes with zero lane issues and no foreign staged
path. These results do not constitute a proof or solver claim.
