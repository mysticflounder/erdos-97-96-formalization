# S2912 thirteen-row structural-certificate promotion

Status: promoted and exhaustive within the generator's depth-two compatibility
abstraction. Two prototype generations and one canonical regeneration matched
byte-for-byte. The promoted Lean modules build through the populated-cell dispatcher,
and the semantic Lean-ingress record binds the generated root to that aggregate.

## Inputs and targets

- Repository lane base: `517502051b8dede8547868c3f03d212d1ed3565a`.
- Cell: `(s2, 912)`, with fixed masks `v = 209` and `w = 912`.
- Pinned source bank: `a7c93a9c69a26271a8e75447d3b66c8f116fdde86c70c219380c5407d0f2457a`.
- Label order: `u, v, w, s1, s2, s3, Pw, Pu, Q1, Q2`.
- Search-center order: `u, Q1, Q2, Pw, Pu, s3, s1, s2`.
- `s2912TargetA` (`s2_053`): `[424, 209, 912, 291, 556, 86, 29, 609, 646, 330]`.
- `s2912TargetB` (`s2_058`): `[424, 209, 912, 306, 616, 86, 29, 579, 549, 267]`.
- `s2912TargetC` (`s2_059`): `[424, 209, 912, 306, 549, 86, 29, 99, 646, 267]`.
- `s2912TargetD` (`s2_060`): `[424, 209, 912, 306, 556, 86, 29, 99, 646, 267]`.
- `s2912TargetE` (`s2_061`): `[424, 209, 912, 306, 556, 86, 29, 609, 646, 267]`.
- `s2912TargetF` (`s2_062`): `[424, 209, 912, 306, 556, 86, 29, 609, 646, 330]`.
- `s2912TargetG` (`s2_054`): `[424, 209, 912, 278, 610, 92, 51, 585, 549, 267]`.
- `s2912TargetH` (`s2_056`): `[424, 209, 912, 534, 354, 92, 51, 585, 549, 267]`.
- `s2912TargetI` (`s2_057`): `[424, 209, 912, 534, 354, 92, 51, 585, 549, 270]`.
- `s2912TargetJ` (`s2_055`): `[424, 209, 912, 534, 291, 92, 166, 609, 525, 330]`.
- `s2912TargetK` (`s2_052`): `[616, 209, 912, 549, 170, 332, 29, 323, 646, 306]`.
- `s2912TargetL` (`s2_064`): `[680, 209, 912, 354, 549, 142, 51, 329, 582, 284]`.
- `s2912TargetM` (`s2_063`): `[680, 209, 912, 549, 354, 142, 51, 329, 582, 284]`.

The independent separation oracle enumerated exactly these thirteen rows in A-M order.

Source and input SHA-256 digests:

- Canonical generator and governed prototype driver:
  `1b33b852fbc8017ab6282df32190a7c8d971f04815d19fd34b6f393b1709df4e`.
- Compatibility checker used by generation:
  `78397f892cc1de95755cafae1ce899765ccca0446ab014a213629e74d8a12f0c`.
- Promoted compatibility checker:
  `0ba35a420c017854f2bb4e6d2e03aefd12db33c3c543d4324abe30e7bfd95242`.
- Stored-row Lean bank input:
  `197631f1e75ef334fb98a46149b805aafd0d43e7b74b810701947abf8eb4e74e`.

## Generation and byte parity

The primary generation command was:

```text
uv run python scratch/runs/prove2me-s2912-row-set-20260913/prototype/tmp/surplus-compg-s2912.py --cell s2912 --output-dir scratch/runs/prove2me-s2912-row-set-20260913/prototype/artifacts/data --tree-proof-dir scratch/runs/prove2me-s2912-row-set-20260913/prototype/artifacts/lean/S2912TreeProof --tree-module-prefix Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof --tree-certificate-json scratch/runs/prove2me-s2912-row-set-20260913/prototype/artifacts/s2912-tree.json
```

The fresh run used the same driver and paths beneath `tmp/fresh/`. The canonical run
used `scripts/surplus-compg-singleton-cnf.py` and paths beneath `tmp/canonical-run/`.
Recursive comparisons found no differences among the three data trees, Lean trees,
or certificate JSON files. The promoted Lean tree also matches canonical output.

The encoding has 260 variables and 20,325 clauses: 8 at-least-one, 4,830
at-most-one, 15,474 cross-separation, and 13 blocked-target clauses. Domain sizes are
`u=13`, `Q1=36`, `Q2=36`, `Pw=34`, `Pu=59`, `s3=20`, `s1=21`, and `s2=41`.
Pair-count constraints are not used for this populated-cell certificate.

The structural certificate contains 1,821 partial states, 1,808 split nodes, 67,825
separation prunes, and 13 terminal assignments. An independent recursive census of
the certificate JSON reproduced 1,808 split, 67,825 prune, and 13 done nodes.

It emitted 70 Lean modules totaling 2,533,949 bytes. The SHA-256 over sorted relative
filename, NUL, and raw-content records is
`37b8e69765bd1c5e59092c73c806b5f7f2ba4d4897131fb58a6e9dd2b380aa56`.

Artifact digests:

- CNF (229,535 bytes):
  `d3fc55993ec1c14e5ad60870c0a925ce2607600e42236d529dc9aa5de2306f31`.
- CNF manifest (5,580 bytes):
  `947fad82ce803809803d4f54918a001b0e7549a6c65ff54f56089f86ac9c2dcf`.
- Uniqueness-oracle JSON (1,796 bytes):
  `fb616903c7ba7049174dacf06eb0fda0686adf6643d7287795a935f0c7364f08`.
- Variable map (19,658 bytes):
  `42f71d7f9e94c7dc34766fe5fb2a7a8adeb8ede40f1bf9d403ef206d3efdf982`.
- Structural-certificate JSON (24,880,964 bytes):
  `be3d94a786ccddbb7c893b224026865714e496761bb4cdd506365395bae998db`.

A case-insensitive whole-word scan of all 70 generated Lean files found zero
`sorry`, `admit`, `unsafe`, `native_decide`, `axiom`, `partial`, `extern`, or
`implemented_by` occurrences and zero `Lean.ofReduceBool`, `Lean.ofReduceNat`, or
`Lean.trustCompiler` occurrences.

## Promotion and trust evidence

Promotion added the canonical generator specification, thirteen target definitions,
all 70 generated modules, the `s2At912` populated-cell constructor, thirteen stored-row
membership lemmas, and its dispatcher branch. Structural coverage now contains twelve
populated cells. This promotion makes no claim about empty cells.

Ruff passed on the canonical and governed generator sources. Lean LSP completed the
compatibility checker and generated root with no errors; both retain established linter
warnings from this source family. The LSP instance later reported aggregate diagnostics
unavailable after its cold dependency build. A fresh standalone LSP import and `#check`
run for the aggregate's three exported declarations then succeeded. The targeted aggregate
build and two direct semantic Lean probes below also completed successfully.

Targeted `lake-build` completed all 1,751 jobs, including the generated root and
twelve-cell dispatcher. The 391,532-byte build log is retained at
`artifacts/s2912-build.log`, has SHA-256
`3b3041c235039273dc4fa956b8bb66a258f5a78123d0312f78b9019bb6e7a11e`, and ends with
`BUILD-EXIT=0`. Its warnings include pre-existing `native_decide` linter reports from
the stored-row bank; the generated-tree forbidden scan is clean.

Binding record `docs/audits/2026-09-13-s2912-row-set-lean-ingress-binding.json`
passed semantic validation with self-hash
`e0b2fa9f24198e1e5c065e72ff22db797509c264aac8d1ae74c965acf8c5a5d9`.
Each of its three exported declarations depends only on `propext`,
`Classical.choice`, and `Quot.sound`; its post-probe source recapture was stable. The
ingress root is 9,745 bytes with digest
`5daf619c5de6e47a4011d71e661239d77c8466991067aeec25890b33069cf95f`.
The aggregate is 25,876 bytes with digest
`19c62bf6bf7d87ba533318a16bbc52a9949202b5c3b248978a71e736a4c71f4e`.
The repository-local closure contains 73 modules, with modules digest
`90dde2173f2d2ca7951cc0972a65f2449ce4c544aa493c5051eb765cb9511b1c`.

After fresh reference and writer scans, the two exact temporary probe directories were
moved to recoverable temporary quarantine
`/private/tmp/prove2me-s2912-probes.WLmlbk/`; both probe logs remain under `artifacts/`.

A repository scan found no frozen bank `source_manifest` or pinned dependency entry
that names an owned S2912 source path, so no bank refreeze is required. Earlier
Lean-ingress binding records remain historical records of their captured aggregate
bytes.

The plan records that general empty-cell certificates must model pair-count and
terminal-validity rejections; those cells remain outside this populated-cell lane.

## Hygiene

The final read-only hygiene report accepted the checkpoint and run-manifest hashes and
reported zero lane-local issues. Its overall `blocking` flag comes from unrelated
shared-worktree state: 13,835 entries, including 4,650 durable untracked paths, 8,950
unregistered generated paths, 127 root spills, and 32 foreign dirty paths.
