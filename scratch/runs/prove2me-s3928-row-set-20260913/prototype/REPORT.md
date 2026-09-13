# S3928 five-row structural-certificate promotion

Status: promoted and exhaustive within the depth-two compatibility abstraction. Two
generations matched byte-for-byte; the canonical Lean modules were built, wired to the
dispatcher, axiom-audited, and bound by a semantic Lean-ingress record.

## Inputs and targets

- Repository base: `ab06a23ebed68ff3d313fe87b3dee4c6cd7375eb`.
- Cell: `(s3, 928)`, with fixed masks `v = 225` and `w = 928`.
- Label order in each row: `u, v, w, s1, s2, s3, Pw, Pu, Q1, Q2`.
- Search-center order: `u, Q1, Q2, Pw, Pu, s1, s2, s3`.
- `s3928TargetA`: `[344, 225, 928, 306, 588, 150, 45, 579, 533, 267]`.
- `s3928TargetB`: `[408, 225, 928, 306, 556, 86, 43, 593, 646, 269]`.
- `s3928TargetC`: `[408, 225, 928, 306, 588, 150, 45, 579, 533, 267]`.
- `s3928TargetD`: `[408, 225, 928, 338, 46, 596, 51, 585, 646, 269]`.
- `s3928TargetE`: `[408, 225, 928, 338, 588, 150, 45, 579, 533, 267]`.

The then-current canonical generator was copied to `tmp/surplus-compg-s3928.py`. Only
the governed scratch copy received the S3928 `CellSpec` during the prototype. Promotion
added the same specification to the canonical generator, whose bytes now match the
audited scratch driver.

Source and input digests:

- Promoted canonical generator: `00420ff0e6b04a3ea1929f8e389364d3059ea558cac3a9e9c801dd55eb12810b`.
- S3928 scratch driver: `00420ff0e6b04a3ea1929f8e389364d3059ea558cac3a9e9c801dd55eb12810b`.
- Promoted compatibility checker source: `57ec3265425626ee55f89a0d40a78250f07738dcb539768ac916db656b373704`.
- Stored-row bank input: `197631f1e75ef334fb98a46149b805aafd0d43e7b74b810701947abf8eb4e74e`.

## Generation

Primary command, run from the repository root:

```text
uv run python scratch/runs/prove2me-s3928-row-set-20260913/prototype/tmp/surplus-compg-s3928.py --cell s3928 --output-dir scratch/runs/prove2me-s3928-row-set-20260913/prototype/artifacts/data --tree-proof-dir scratch/runs/prove2me-s3928-row-set-20260913/prototype/artifacts/lean/S3928TreeProof --tree-module-prefix Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3928TreeProof --tree-certificate-json scratch/runs/prove2me-s3928-row-set-20260913/prototype/artifacts/s3928-tree.json
```

The second generation used the same command with the three primary output paths
replaced by `tmp/fresh/data`, `tmp/fresh/lean/S3928TreeProof`, and
`tmp/fresh/s3928-tree.json`. Recursive directory comparisons and a direct certificate
comparison found no differences.

The generated encoding has 261 variables and 20,788 clauses: 8 at-least-one, 4,850
at-most-one, 15,925 cross-separation, and 5 blocked-target clauses. Domain sizes are
`u=13`, `Q1=36`, `Q2=36`, `Pw=34`, `Pu=59`, `s1=21`, `s2=21`, and `s3=41`.

The structural tree has 1,814 partial states, 1,809 splits, 67,643 explicit separation
prunes, and 5 terminal target assignments. It emitted 82 Lean modules totaling
2,501,298 bytes. The sorted `filename NUL raw-content` SHA-256 over those modules is
`605ff7e6794fc3351f87a9898fc9a0e0ccc7801b6a0cf210565e81c0844fe236`.

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
Shard07.lean
Shard08.lean
Shard08Child03.lean
Shard08Child04.lean
Shard08Child11.lean
Shard08Child12.lean
Shard08Child15.lean
Shard08Child16.lean
Shard08Child17.lean
Shard08Child18.lean
Shard08Child19.lean
Shard08Child20.lean
Shard08Child24.lean
Shard08Child30.lean
Shard08Child31.lean
Shard08Child32.lean
Shard08Child33.lean
Shard08Child34.lean
Shard09.lean
Shard09Child03.lean
Shard09Child04.lean
Shard09Child07.lean
Shard09Child08.lean
Shard09Child15.lean
Shard09Child16.lean
Shard09Child16Child04.lean
Shard09Child16Child08.lean
Shard09Child16Child18.lean
Shard09Child16Child20.lean
Shard09Child16Child24.lean
Shard09Child16Child25.lean
Shard09Child16Child27.lean
Shard09Child16Child28.lean
Shard09Child16Child30.lean
Shard09Child16Child31.lean
Shard09Child16Child33.lean
Shard09Child16Child34.lean
Shard09Child17.lean
Shard09Child18.lean
Shard09Child19.lean
Shard09Child19Child03.lean
Shard09Child19Child07.lean
Shard09Child19Child15.lean
Shard09Child19Child17.lean
Shard09Child19Child24.lean
Shard09Child19Child25.lean
Shard09Child19Child26.lean
Shard09Child19Child27.lean
Shard09Child19Child30.lean
Shard09Child19Child31.lean
Shard09Child19Child32.lean
Shard09Child19Child33.lean
Shard09Child20.lean
Shard09Child24.lean
Shard09Child25.lean
Shard09Child26.lean
Shard09Child27.lean
Shard09Child28.lean
Shard09Child30.lean
Shard09Child30Child15.lean
Shard09Child30Child16.lean
Shard09Child30Child18.lean
Shard09Child30Child19.lean
Shard09Child30Child25.lean
Shard09Child30Child26.lean
Shard09Child30Child27.lean
Shard09Child30Child28.lean
Shard09Child30Child31.lean
Shard09Child30Child32.lean
Shard09Child30Child33.lean
Shard09Child30Child34.lean
Shard10.lean
Shard11.lean
Shard12.lean
```

## Artifact digests and checks

- CNF: `10f052a21f25067ac4ff8f00bc1a34afdaf7ef1bb912f2d5adbb40ebc6157878`.
- CNF manifest: `976e73b432ad14672c018489ce588cf2feaa6417a4d756bf6494bad67fe6fbda`.
- Uniqueness-oracle JSON: `5dd94f47fca962faea61273cdf6bcaa1c0f87178de3552321d10c8d393fdfa56`.
- Variable map: `b0385277903d71a1b3b2329e5e6c92a9eaaeaef087f7ef35a5169eaca8c46733`.
- Structural-certificate JSON: `bff6f37c4c078c48bfcc2b9abfca6999a9f64e83e915bb1cbcafbc4e5e783c66`.
- Generated-Lean aggregate: `605ff7e6794fc3351f87a9898fc9a0e0ccc7801b6a0cf210565e81c0844fe236`.

An exhaustive case-insensitive whole-word scan of all 82 generated Lean files found
zero `sorry`, `admit`, `unsafe`, `native_decide`, `axiom`, `partial`, `extern`, or
`implemented_by` occurrences and zero `Lean.ofReduceBool`, `Lean.ofReduceNat`, or
`Lean.trustCompiler` occurrences.

## Promotion and trust evidence

The five-row cell does not cause a generator explosion. Its 82 modules and 2.50 MB of
generated Lean are larger than the recent four-row prototypes but remain within the
same structural-certificate approach. Promotion added the audited generator
specification, five target definitions, all 82 modules, and the seventh dispatcher
branch. Fresh canonical generation matches the promoted modules and all six earlier
certificate families remain byte-for-byte unchanged.

Targeted `lake-build` completed all 1,296 jobs, including the generated root and
seven-cell dispatcher. Binding record
`docs/audits/2026-09-13-s3928-row-set-lean-ingress-binding.json` passed semantic
validation with self-hash
`fba39e1b998ee22718b7788f98611a99642e032e69acb40ace51341a164a7a2f`.
Its three exported declarations depend only on `propext`, `Classical.choice`, and
`Quot.sound`; its post-probe source recapture was stable.
