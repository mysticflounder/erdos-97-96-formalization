# S1928 four-row structural-certificate promotion

Status: promoted and exhaustive within the depth-two compatibility abstraction. The
structural certificate was generated twice and matched byte-for-byte; its canonical Lean
modules were built, wired to the dispatcher, axiom-audited, and bound by a semantic
Lean-ingress record.

## Inputs and targets

- Repository base: `c464f037f5dfc968fda59ce7536d82fb17ab5d3a`.
- Cell: `(s1, 928)`, with fixed masks `v = 201` and `w = 928`.
- Label order in each row: `u, v, w, s1, s2, s3, Pw, Pu, Q1, Q2`.
- Search-center order: `u, Q1, Q2, Pw, Pu, s3, s2, s1`.
- `s1_037` / `s1928TargetA`: `[178, 201, 928, 338, 616, 142, 281, 579, 533, 300]`.
- `s1_038` / `s1928TargetB`: `[284, 201, 928, 178, 556, 326, 43, 593, 646, 275]`.
- `s1_039` / `s1928TargetC`: `[284, 201, 928, 178, 616, 326, 43, 593, 646, 275]`.
- `s1_040` / `s1928TargetD`: `[284, 201, 928, 178, 616, 86, 43, 593, 646, 293]`.

The then-current canonical generator was copied to `tmp/surplus-compg-s1928.py`; only
that governed scratch copy received the S1928 `CellSpec` during the prototype. Promotion
added the same specification to the canonical generator, whose bytes now match the
audited scratch driver.

Source and input digests:

- Promoted canonical generator: `28bf64bf30f51a7dd110d8ca3feb9a3fc148b09373f525f35f5a87f1e083a2f4`.
- S1928 scratch driver: `28bf64bf30f51a7dd110d8ca3feb9a3fc148b09373f525f35f5a87f1e083a2f4`.
- Promoted compatibility checker source: `801c37ae25c8f8161d776ff09580c1c52de9691f829c68d7c5f708641b7c5f62`.
- Stored-row bank input: `197631f1e75ef334fb98a46149b805aafd0d43e7b74b810701947abf8eb4e74e`.

## Generation

Primary command, run from the repository root:

```text
uv run python scratch/runs/prove2me-s1928-row-set-20260913/prototype/tmp/surplus-compg-s1928.py --cell s1928 --output-dir scratch/runs/prove2me-s1928-row-set-20260913/prototype/artifacts/data --tree-proof-dir scratch/runs/prove2me-s1928-row-set-20260913/prototype/artifacts/lean/S1928TreeProof --tree-module-prefix Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1928TreeProof --tree-certificate-json scratch/runs/prove2me-s1928-row-set-20260913/prototype/artifacts/s1928-tree.json
```

The second generation used the same command with outputs under `tmp/fresh/`. Recursive
directory comparison of the data and Lean trees, plus direct comparison of the certificate
JSON, found no differences.

The encoding has 280 variables and 21,687 clauses: 8 at-least-one, 5,313 at-most-one,
16,362 cross-separation, and 4 blocked-target clauses. Domain sizes are `u=9`, `Q1=27`,
`Q2=36`, `Pw=34`, `Pu=51`, `s3=41`, `s2=41`, and `s1=41`.

The certificate contains 442 partial states, 438 split nodes, 17,497 separation prunes,
and 4 terminal assignments. An independent recursive node census reproduced the split,
prune, and terminal counts.

It emitted 25 Lean modules totaling 669,902 bytes. The SHA-256 over sorted relative
filename, NUL, and raw-content records is
`766b680367069cbc3a58dffb80fba3b4904939ea753b97627667841e9fcf7311` for each run.

Generated modules:

```text
Root.lean
Shard00.lean
Shard01.lean
Shard02.lean
Shard03.lean
Shard04.lean
Shard05.lean
Shard06.lean
Shard06Child15.lean
Shard06Child17.lean
Shard06Child20.lean
Shard06Child21.lean
Shard06Child23.lean
Shard07.lean
Shard07Child02.lean
Shard07Child08.lean
Shard07Child09.lean
Shard07Child12.lean
Shard07Child13.lean
Shard07Child16.lean
Shard07Child21.lean
Shard07Child22.lean
Shard07Child24.lean
Shard07Child25.lean
Shard08.lean
```

## Artifact digests and checks

- CNF: `f59ac5a63e615a98edc28e16580d63b45b73825522f3dbeb86e1d7aec01b001e`.
- CNF manifest: `79a55b8410c453b395c0dae341306e493a18a485979d0e4c88c9d8d209da1c33`.
- Uniqueness-oracle JSON: `aed72c386343937c31912b754b55047c7d61ffdcf42c2d0be3ec1ba6aa87774e`.
- Variable map: `d1eec188a0630129f25c4b116924a0b3ee671722ded90cfdd58c5136862ffb38`.
- Structural-certificate JSON: `33fa41c039dc2789f3f077408e78bbcc7876fbf479d5c4e1c182a80c2237956b`.
- Generated-Lean aggregate: `766b680367069cbc3a58dffb80fba3b4904939ea753b97627667841e9fcf7311`.

A case-insensitive whole-word scan of all 25 generated Lean files found zero `sorry`,
`admit`, `unsafe`, or `native_decide` occurrences.

## Promotion and trust evidence

Promotion added the audited S1928 generator specification, the four target definitions,
the 25 generated modules, and the sixth structural-dispatcher branch. Fresh canonical
generation matches the promoted modules and all five earlier certificate families remain
byte-for-byte unchanged.

Targeted `lake-build` completed all 1,214 jobs, including the generated root and six-cell
dispatcher. Binding record
`docs/audits/2026-09-13-s1928-row-set-lean-ingress-binding.json` passed semantic
validation with self-hash
`a70c01421e5a6bb25738d38c8585f7500d1d01326797ca25fa3fe77039a9dd08`.
Its three exported declarations depend only on `propext`, `Classical.choice`, and
`Quot.sound`; its post-probe source recapture was stable.

## Hygiene

The read-only lane hygiene report accepted the checkpoint and run-manifest self-hashes and
reported zero issues. Its overall `blocking` flag comes from unrelated shared-worktree state:
13,748 entries, including 4,650 durable untracked paths, 8,938 unregistered generated paths,
127 root spills, and 32 foreign dirty paths. No lane-local blocker was reported.
