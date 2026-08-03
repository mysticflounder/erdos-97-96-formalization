# v24 batch blocker minimization: terminal audit

## Outcome

The four-assignment canary terminated with three admitted blockers and one
fail-closed result.  The canary gate is `false`; no production batch was
launched.

The frozen manifest is
`artifacts-v24/20260802T181647.512190Z-v24-batch/manifest-v24.json`:

- file SHA-256:
  `1b77382c903ea4954ea96f4f8e7ae3681adbfb6563a3ab7a225378b6b6479769`;
- authenticated manifest payload SHA-256:
  `dcc3a76e433cca6f5278ac49cbfa8ee17573cd56fde711b7f59a1045562ad9ec`;
- raw blob SHA-256:
  `699807aa782a9083ebec185444b483f7e9da53b4f7a43e45ae923aa82f363067`;
- raw formula SHA-256:
  `bce451bab18921a6c0d0d29d5307c8aab59be1c1fc937d991c6b40a8d7ca2720`;
- 2,991 authenticated source assignments in 32 signatures.

The terminal gate is
`artifacts-v24/20260802T181647.512190Z-v24-batch/canary-gate.json`, with file
SHA-256
`b3b9811404299bf6ab608622f29c6af2613a36e3653075f453a88d04ace8815d`
and payload SHA-256
`c8e843c8071568cb47728aa7b1983a7a1e850f689d3cc56f5290c9ca88c88554`.

## Terminal canaries

### `sig-002-27e614e3d479`: admitted six-literal blocker

The admitted assignment is

```text
k4_0_1 = true
k4_0_10 = true
k4_10_0 = true
k4_10_3 = true
k4_3_1 = true
k4_3_10 = true
```

Equivalently, the reusable Boolean clause against this exact raw formula is

```text
¬k4_0_1 ∨ ¬k4_0_10 ∨ ¬k4_10_0 ∨
¬k4_10_3 ∨ ¬k4_3_1 ∨ ¬k4_3_10.
```

The candidate hash is
`3d2a0b396ffd8a328ca77842db21d5eef8bc0272dc84821397a83f1d17e116a9`.
Both independent fresh-parse admission replays returned `UNSAT`, with common
derived-formula SHA-256
`9f5c0c9c66b55667f8370e65038df8ca914ed918fd8e26894fad1b0fc09a4f34`.
The result file SHA-256 is
`226c354b3aeba4e68c02520574ff60d5d978b5ae5a2cfcdd3c598790f0ec6cf5`.
Its 13-record hash-chained journal has terminal head
`75011e2d1bec9d547f36dec7410d68e0f01948e10828599b44779783ba147d93`.

### `sig-003-37c8f45b50c4`: admitted six-literal blocker

The admitted assignment is

```text
critical_row_2_1 = false
critical_row_2_12 = true
k4_0_1 = true
k4_0_12 = true
k4_1_0 = true
k4_1_2 = true
```

Equivalently:

```text
critical_row_2_1 ∨ ¬critical_row_2_12 ∨ ¬k4_0_1 ∨
¬k4_0_12 ∨ ¬k4_1_0 ∨ ¬k4_1_2.
```

The candidate hash is
`3bab21459f88c7d7d548c614a7d0ca20a7d7e013122a73e37a8b066eff8b2180`.
Both independent fresh-parse admission replays returned `UNSAT`, with common
derived-formula SHA-256
`146b40fab6e020bea7c53df79c11581aeabed29bb15069e317fa79c3a0c77d17`.
The result file SHA-256 is
`acb23642b822553fe8c9a89fde944c93ca8253d1a4bcf45210babad84b3351b8`.
Its 13-record hash-chained journal has terminal head
`a744b39c90a7bb9f628c995bf70f17c2a01ea8e1101fef1c92511bda1b90c8a4`.

### `sig-007-6236b55111ff`: fail closed

Discovery saw an `UNSAT` 39-fix candidate, but both independent admission
replays returned `UNKNOWN`.  v24 therefore rejected the reduction and retained
the full 825-fix assignment.  This is not an admitted learned clause.

The full-assignment hash is
`b52c22a057736eef37850a305a609288c7c39d659f98400da02eedfba35394a9`;
the result file SHA-256 is
`639e718d4b67e4869ed8411521dd82fb9099763215db6d6e7a490e690749150e`.
Its 11-record hash-chained journal has terminal head
`899011b29cd5f8225710c2cbd8b430fc7abc9cc73c724c9bbd3a40119b1b58a6`.

### `sig-014-80ddad537ccd`: admitted 58-literal blocker

All 58 admitted fixes are rich-profile membership bits.  The exact signed
assignment is recorded in
`artifacts-v24/20260802T181647.512190Z-v24-batch/workers/sig-014-80ddad537ccd/result.json`;
its negated conjunction is the corresponding 58-literal Boolean clause.

The candidate hash is
`54595cc002eb4377e5319bcd1f800d7c9784e320d28135b13fa4489930f44d52`.
Both independent fresh-parse admission replays returned `UNSAT`, with common
derived-formula SHA-256
`e1cda35cc8bfd38936d905106fd6af51d1f39128e6fc72cd0c26b618ba295f57`.
The result file SHA-256 is
`10f7a43409588065c93de21e7061d72efaed69245505421a5547c480de74a43b`.
Its 16-record hash-chained journal has terminal head
`1fd3fb73d26ed20d6831dd6748b181e95f707a70a425d1a40a23dee055bcf2ee`.

## Comparison with v27

The independently admitted v27 clause is

```text
¬rich_2_1_4 ∨ ¬rich_2_1_12.
```

The v24 58-fix assignment instead has both `rich_2_1_4 = false` and
`rich_2_1_12 = false`.  It therefore satisfies the v27 clause.  Neither result
subsumes or explains the other assignment: v27 is a much stronger reusable
two-literal blocker for the `true/true` pattern, while v24 witnesses a separate
incompatible exact rich-profile pattern.

## Mandatory theorem-bank audit

The prescribed current, sibling, and legacy theorem-bank Markdown/JSON
inventories were searched, as was the indexed Lean corpus.  Exact searches of
the repository's Lean sources found none of the raw `k4_*`, `critical_row_*`,
or `rich_*` SMT identifiers.  There is no exact named Lean terminal for any of
the three admitted v24 clauses.

The two six-literal clauses were also compared mechanically with every
profile-specific `StaticEqualityTriangleCut` produced by v18.  Neither has an
exact match.  In particular, they should not be relabeled as instances of the
existing length-two equality-path schema.

The closest reusable theorem-level primitives remain those found by the v27
audit:

- `two_circle_noncollinear_common_point_elim`;
- `oppositeCapRichClassInteriorPattern_of_apexRichClassStructure`;
- `oppositeVertex_distinct_K4_radii_force_capInterior_card_ge_four`;
- sibling `eq_of_equidistant_three_noncollinear`; and
- legacy `three_common_equidistant_centers_eq`.

None directly consumes these exact signed shell-membership patterns.  The
first missing bridge is a producer that decodes each finite exact shell
assignment into a stable geometric incompatibility, or a human reduction to
one of the existing circle/equidistance kernels.  Until that bridge exists:

- the two six-literal results are useful external next-wave Boolean clauses
  only for the authenticated raw formula above;
- the 58-literal result remains a bounded exact-15 rich-profile assignment
  blocker, not a named rich-profile/support theorem; and
- none is Lean ingress, kernel closure, or a proof certificate.

The theorem-bank no-match conclusion is syntactic, not a claim of semantic
novelty.

## Scope and verification

The source census refreshed after the manifest freeze to 52 profiles and 4,018
proposals.  That enlarged census is not covered by this immutable 32-signature
run.  Because the canary gate failed and the parent lane had already terminated
its broad v20 search, v24 launched neither production nor a follow-on manifest.

Focused unit tests:

```text
4 passed in 0.04s
```

Trust boundary: external Z3 `UNSAT` over two independently reconstructed fresh
raw parses, with exact raw SHA authentication.  There is no emitted proof
certificate and no Lean kernel check.
