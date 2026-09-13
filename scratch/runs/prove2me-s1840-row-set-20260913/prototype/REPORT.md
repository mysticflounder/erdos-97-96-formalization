# S1840 eleven-row structural-certificate promotion

Status: promoted and exhaustive within the generator's depth-two compatibility
abstraction. Two prototype generations and one canonical regeneration matched
byte-for-byte. The promoted Lean modules build through the populated-cell dispatcher,
and the semantic Lean-ingress record binds the generated root to that aggregate.

## Inputs and targets

- Repository lane base: `eb88c6dc7ec21c9270b51cd38933d20e1198906e`.
- Cell: `(s1, 840)`, with fixed masks `v = 201` and `w = 840`.
- Pinned source bank: `a7c93a9c69a26271a8e75447d3b66c8f116fdde86c70c219380c5407d0f2457a`.
- Label order: `u, v, w, s1, s2, s3, Pw, Pu, Q1, Q2`.
- Search-center order: `u, Q1, Q2, Pw, Pu, s2, s3, s1`.
- `s1840TargetA` (`s1_003`): `[368, 201, 840, 275, 170, 86, 660, 45, 547, 390]`.
- `s1840TargetB` (`s1_005`): `[368, 201, 840, 660, 294, 29, 142, 581, 674, 275]`.
- `s1840TargetC` (`s1_004`): `[368, 201, 840, 278, 676, 29, 142, 581, 658, 291]`.
- `s1840TargetD` (`s1_009`): `[432, 201, 840, 86, 43, 156, 390, 609, 531, 300]`.
- `s1840TargetE` (`s1_010`): `[432, 201, 840, 275, 45, 86, 156, 593, 646, 298]`.
- `s1840TargetF` (`s1_011`): `[432, 201, 840, 275, 45, 86, 156, 609, 646, 298]`.
- `s1840TargetG` (`s1_006`): `[432, 201, 840, 86, 291, 29, 170, 549, 531, 390]`.
- `s1840TargetH` (`s1_007`): `[432, 201, 840, 86, 291, 29, 170, 609, 531, 390]`.
- `s1840TargetI` (`s1_008`): `[432, 201, 840, 86, 291, 29, 172, 609, 531, 390]`.
- `s1840TargetJ` (`s1_012`): `[432, 201, 840, 86, 291, 533, 154, 45, 610, 390]`.
- `s1840TargetK` (`s1_013`): `[688, 201, 840, 533, 43, 156, 418, 337, 582, 300]`.

The independent separation oracle enumerated exactly these eleven rows in A-K order.

Source and input SHA-256 digests:

- Canonical generator and governed prototype driver:
  `6d7f372c101f4288d44da83e2a63555912c89c6cddce7878dfb6f9c0d4813669`.
- Promoted compatibility checker source:
  `78397f892cc1de95755cafae1ce899765ccca0446ab014a213629e74d8a12f0c`.
- Stored-row Lean bank input:
  `197631f1e75ef334fb98a46149b805aafd0d43e7b74b810701947abf8eb4e74e`.

## Generation and byte parity

The primary generation command was:

```text
uv run python scratch/runs/prove2me-s1840-row-set-20260913/prototype/tmp/surplus-compg-s1840.py --cell s1840 --output-dir scratch/runs/prove2me-s1840-row-set-20260913/prototype/artifacts/data --tree-proof-dir scratch/runs/prove2me-s1840-row-set-20260913/prototype/artifacts/lean/S1840TreeProof --tree-module-prefix Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof --tree-certificate-json scratch/runs/prove2me-s1840-row-set-20260913/prototype/artifacts/s1840-tree.json
```

The fresh run used the same driver and paths beneath `tmp/fresh/`. The canonical run
used `scripts/surplus-compg-singleton-cnf.py` and paths beneath `tmp/canonical-run/`.
Recursive comparisons found no differences among the three data trees, Lean trees,
or certificate JSON files. The promoted Lean tree also matches canonical output.

The encoding has 277 variables and 22,586 clauses: 8 at-least-one, 5,575
at-most-one, 16,992 cross-separation, and 11 blocked-target clauses. Domain sizes are
`u=13`, `Q1=36`, `Q2=36`, `Pw=52`, `Pu=59`, `s2=20`, `s3=20`, and `s1=41`.

The structural certificate contains 5,174 partial states, 5,163 split nodes, 172,790
separation prunes, and 11 terminal assignments. An independent recursive census of
the certificate JSON reproduced 5,163 split, 172,790 prune, and 11 done nodes.

It emitted 246 Lean modules totaling 6,321,885 bytes. The SHA-256 over sorted relative
filename, NUL, and raw-content records is
`e78ec8dda6588d05bebb15a5e3b6aaa4bc1a7d3f5fc8d1e280e3337f092af393`.

Artifact digests:

- CNF (256,072 bytes):
  `67a070b1e1590b2badb1a72b139895625d1b89b06b5223ff0ed0c88647197d08`.
- CNF manifest (5,529 bytes):
  `c93df67f23a64c77a2956922879938c502366c6e27cec265013c89f9c48157c1`.
- Uniqueness-oracle JSON (1,557 bytes):
  `d07717e26d21918258b3f81878e30cdb3bccb14e1efeb2909e9e4b766321eec4`.
- Variable map (20,951 bytes):
  `f9cfeb4622f2762f58cb6cca316c21060414c9fa3c6dc315398119ec8fb385cf`.
- Structural-certificate JSON (66,998,411 bytes):
  `6a3d84de2572eab47ee859e5e4c7d286bb420105aac0243588676430b4477765`.

A case-insensitive whole-word scan of all 246 generated Lean files found zero
`sorry`, `admit`, `unsafe`, `native_decide`, `axiom`, `partial`, `extern`, or
`implemented_by` occurrences and zero `Lean.ofReduceBool`, `Lean.ofReduceNat`, or
`Lean.trustCompiler` occurrences.

## Promotion and trust evidence

Promotion added the canonical generator specification, eleven target definitions, all
246 generated modules, the `s1At840` populated-cell constructor, eleven stored-row
membership lemmas, and its dispatcher branch. It makes no claim about empty cells.

Ruff passed on the canonical and governed generator sources. Lean LSP reported no
errors in the compatibility checker, generated root, or populated-cell dispatcher.
The generated root retains the established flexible-`simp` linter warnings from this
generator family; the final dispatcher had no diagnostics.

Targeted `lake-build` completed all 1,681 jobs, including the generated root and
eleven-cell dispatcher. The full 407,513-byte build log is retained at
`artifacts/s1840-build.log`, has SHA-256
`ac598d93b5dc00be5b6da64070d01063729f16a1bf98e373fae0d5b9e07ab148`, and ends with
`BUILD-EXIT=0`.

Binding record `docs/audits/2026-09-13-s1840-row-set-lean-ingress-binding.json`
passed semantic validation with self-hash
`dbde223ee75286b37864db081761e28e6a24d7ddb50d6a62b26c118a1460a4bb`.
Each of its three exported declarations depends only on `propext`,
`Classical.choice`, and `Quot.sound`; its post-probe source recapture was stable.
The two temporary probe directories were moved after a fresh reference and writer scan
to recoverable temporary quarantine `/private/tmp/prove2me-s1840-probes.oJk0rA/`;
both probe logs remain under `artifacts/`.

A repository scan found no frozen bank `source_manifest` or pinned dependency entry
that names an owned S1840 source path, so no bank refreeze is required. Earlier
Lean-ingress binding records remain historical records of their captured aggregate
bytes.

## Hygiene

The final read-only hygiene report accepted the checkpoint and run-manifest hashes and
reported zero lane-local issues. Its overall `blocking` flag comes from unrelated
shared-worktree state: 14,009 entries, including 4,650 durable untracked paths, 8,948
unregistered generated paths, 127 root spills, and 32 foreign dirty paths.
