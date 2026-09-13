# S1904 ten-row structural-certificate promotion

Status: promoted and exhaustive within the generator's depth-two compatibility
abstraction. Two prototype generations and one canonical regeneration matched
byte-for-byte. The promoted Lean modules build through the populated-cell dispatcher,
and the semantic Lean-ingress record binds the generated root to that aggregate.

## Inputs and targets

- Repository lane base: `87dda007ce70a4836c8990126cb3dca2c0629205`.
- Cell: `(s1, 904)`, with fixed masks `v = 201` and `w = 904`.
- Pinned source bank: `a7c93a9c69a26271a8e75447d3b66c8f116fdde86c70c219380c5407d0f2457a`.
- Label order: `u, v, w, s1, s2, s3, Pw, Pu, Q1, Q2`.
- Search-center order: `u, Q1, Q2, Pw, Pu, s3, s2, s1`.
- `s1904TargetA` (`s1_020`): `[432, 201, 904, 338, 43, 533, 150, 325, 610, 300]`.
- `s1904TargetB` (`s1_019`): `[432, 201, 904, 338, 46, 596, 29, 609, 646, 291]`.
- `s1904TargetC` (`s1_015`): `[432, 201, 904, 275, 106, 29, 150, 581, 547, 300]`.
- `s1904TargetD` (`s1_014`): `[432, 201, 904, 275, 106, 150, 45, 593, 547, 326]`.
- `s1904TargetE` (`s1_018`): `[432, 201, 904, 278, 106, 596, 45, 83, 646, 291]`.
- `s1904TargetF` (`s1_016`): `[432, 201, 904, 534, 354, 92, 43, 593, 549, 275]`.
- `s1904TargetG` (`s1_017`): `[432, 201, 904, 275, 610, 92, 150, 593, 549, 298]`.
- `s1904TargetH` (`s1_022`): `[688, 201, 904, 549, 354, 150, 43, 337, 582, 284]`.
- `s1904TargetI` (`s1_021`): `[688, 201, 904, 338, 549, 150, 29, 353, 582, 298]`.
- `s1904TargetJ` (`s1_023`): `[688, 201, 904, 354, 549, 150, 43, 337, 582, 284]`.

The independent separation oracle enumerated exactly these ten rows in A-J order.

Source and input SHA-256 digests:

- Canonical generator and governed prototype driver:
  `8d58463eb9b0f073f7003bfd53b733c5e0f23201b04c6001af21f8993fcf8dd5`.
- Promoted compatibility checker source:
  `c13ba65c967935b27f9417b56726a4fec9e6da0587190dbc4c71b82cc6786487`.
- Stored-row Lean bank input:
  `197631f1e75ef334fb98a46149b805aafd0d43e7b74b810701947abf8eb4e74e`.

## Generation and byte parity

The primary generation command was:

```text
uv run python scratch/runs/prove2me-s1904-row-set-20260913/prototype/tmp/surplus-compg-s1904.py --cell s1904 --output-dir scratch/runs/prove2me-s1904-row-set-20260913/prototype/artifacts/data --tree-proof-dir scratch/runs/prove2me-s1904-row-set-20260913/prototype/artifacts/lean/S1904TreeProof --tree-module-prefix Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof --tree-certificate-json scratch/runs/prove2me-s1904-row-set-20260913/prototype/artifacts/s1904-tree.json
```

The fresh run used the same driver and paths beneath `tmp/fresh/`. The canonical run
used `scripts/surplus-compg-singleton-cnf.py` and paths beneath `tmp/canonical-run/`.
Recursive comparisons found no differences among the three data trees, Lean trees,
or certificate JSON files. The promoted Lean tree also matches canonical output.

The encoding has 259 variables and 20,422 clauses: 8 at-least-one, 4,810
at-most-one, 15,594 cross-separation, and 10 blocked-target clauses. Domain sizes are
`u=13`, `Q1=36`, `Q2=36`, `Pw=34`, `Pu=59`, `s3=20`, `s2=20`, and `s1=41`.

The structural certificate contains 1,796 partial states, 1,786 split nodes, 66,628
separation prunes, and 10 terminal assignments. An independent recursive census of
the certificate JSON reproduced 1,786 split, 66,628 prune, and 10 done nodes.

It emitted 70 Lean modules totaling 2,477,014 bytes. The SHA-256 over sorted relative
filename, NUL, and raw-content records is
`1247a80d946883b121cf66998cc879e72d36017ca6886f5091f5ff60c7996d2e`.

Artifact digests:

- CNF (230,615 bytes):
  `5aa95cd8d92df0cdb4e411dad1cea66b8fe538fff732d5c1a0c9c1b734706515`.
- CNF manifest (5,211 bytes):
  `ec9bed87921f9686f5503299053eee310d57d88537bb4048fcd0ab64c2995756`.
- Uniqueness-oracle JSON (1,441 bytes):
  `22c1b0f834b81005e8329d978eb4276c24cec8e0a89c05456794a2d24568d8d8`.
- Variable map (19,579 bytes):
  `5401ae52df76db5cdbefcfff52a0edf4f5add354ca319e834e80aad9a1c07b76`.
- Structural-certificate JSON (24,291,079 bytes):
  `050dcd464b5011ed5125d1a730bf0fcffdd75817823fa7437215714bc0213d92`.

A case-insensitive whole-word scan of all 70 generated Lean files found zero
`sorry`, `admit`, `unsafe`, `native_decide`, `axiom`, `partial`, `extern`, or
`implemented_by` occurrences and zero `Lean.ofReduceBool`, `Lean.ofReduceNat`, or
`Lean.trustCompiler` occurrences.

## Promotion and trust evidence

Promotion added the canonical generator specification, ten target definitions, all
70 generated modules, the `s1At904` populated-cell constructor, ten stored-row
membership lemmas, and its dispatcher branch. It makes no claim about empty cells.

Ruff passed on the canonical and governed generator sources. Lean LSP reported no
errors in the compatibility checker, generated root, or populated-cell dispatcher.
The generated root retains the established flexible-`simp` linter warnings from this
generator family; the final dispatcher had no diagnostics.

Targeted `lake-build` completed all 1,435 jobs, including the generated root and
ten-cell dispatcher. The full 363,796-byte build log is retained at
`artifacts/s1904-build.log`, has SHA-256
`a2383d5af17825d07cbb044d864176881db97982119ad23387576a55f1539566`, and ends with
`BUILD-EXIT=0`.

Binding record `docs/audits/2026-09-13-s1904-row-set-lean-ingress-binding.json`
passed semantic validation with self-hash
`66f8a05cbc6571416bfab148b6cb9fb7c4896439806dcd4dbcdbbbd9dffce135`.
Each of its three exported declarations depends only on `propext`,
`Classical.choice`, and `Quot.sound`; its post-probe source recapture was stable.
The two temporary probe directories were moved after a fresh reference and writer scan
to recoverable temporary quarantine
`/private/tmp/prove2me-s1904-probes.xchgpN/`; both probe logs remain under `artifacts/`.

A repository scan found no frozen bank `source_manifest` or pinned dependency entry
that names an owned S1904 source path, so no bank refreeze is required. Earlier
Lean-ingress binding records remain historical records of their captured aggregate
bytes.

## Hygiene

The final read-only hygiene report accepted the checkpoint and run-manifest hashes and
reported zero lane-local issues. Its overall `blocking` flag comes from unrelated
shared-worktree state: 13,831 entries, including 4,650 durable untracked paths, 8,946
unregistered generated paths, 127 root spills, and 32 foreign dirty paths.
