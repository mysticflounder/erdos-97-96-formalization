# S2785 sixteen-row structural-certificate promotion

Status: promoted and exhaustive within the generator's depth-two compatibility
abstraction. Two prototype generations and one canonical regeneration matched
byte-for-byte. The promoted Lean modules build through the populated-cell dispatcher,
and the semantic Lean-ingress record binds the generated root to that aggregate.

## Inputs and targets

- Repository lane base: `58d776581750ed768d076a0e42f1c2e7947b729f`.
- Cell: `(s2, 785)`, with fixed masks `v = 209` and `w = 785`.
- Pinned source bank: `a7c93a9c69a26271a8e75447d3b66c8f116fdde86c70c219380c5407d0f2457a`.
- Label order: `u, v, w, s1, s2, s3, Pw, Pu, Q1, Q2`.
- Search-center order: `u, Q1, Q2, Pu, Pw, s1, s3, s2`.
- `s2785TargetA` (`s2_007`): `[424, 209, 785, 306, 556, 86, 156, 75, 547, 390]`.
- `s2785TargetB` (`s2_008`): `[424, 209, 785, 306, 616, 86, 156, 75, 547, 390]`.
- `s2785TargetC` (`s2_009`): `[424, 209, 785, 306, 616, 86, 156, 75, 549, 390]`.
- `s2785TargetD` (`s2_006`): `[424, 209, 785, 306, 45, 86, 156, 99, 523, 390]`.
- `s2785TargetE` (`s2_000`): `[424, 209, 785, 534, 354, 92, 178, 75, 525, 390]`.
- `s2785TargetF` (`s2_002`): `[424, 209, 785, 534, 354, 92, 178, 75, 549, 390]`.
- `s2785TargetG` (`s2_004`): `[424, 209, 785, 534, 616, 156, 390, 75, 549, 306]`.
- `s2785TargetH` (`s2_003`): `[424, 209, 785, 534, 106, 156, 390, 77, 549, 306]`.
- `s2785TargetI` (`s2_005`): `[424, 209, 785, 534, 616, 156, 390, 77, 549, 306]`.
- `s2785TargetJ` (`s2_001`): `[424, 209, 785, 534, 43, 156, 390, 101, 525, 306]`.
- `s2785TargetK` (`s2_011`): `[424, 209, 785, 562, 652, 86, 390, 75, 549, 284]`.
- `s2785TargetL` (`s2_012`): `[424, 209, 785, 562, 652, 86, 390, 99, 549, 284]`.
- `s2785TargetM` (`s2_010`): `[424, 209, 785, 562, 652, 90, 390, 77, 549, 354]`.
- `s2785TargetN` (`s2_013`): `[424, 209, 785, 562, 652, 90, 390, 99, 549, 332]`.
- `s2785TargetO` (`s2_015`): `[424, 209, 785, 564, 354, 92, 674, 75, 525, 390]`.
- `s2785TargetP` (`s2_014`): `[424, 209, 785, 564, 354, 92, 652, 75, 547, 390]`.

The independent separation oracle enumerated exactly these sixteen rows in A-P order.

Source and input SHA-256 digests:

- Canonical generator and governed prototype driver:
  `0e1658c65c7cc7d5c2874cd7c4881b436e6ed12a95c04c6ec8347192c07bf68a`.
- Compatibility checker used by generation:
  `0ba35a420c017854f2bb4e6d2e03aefd12db33c3c543d4324abe30e7bfd95242`.
- Promoted compatibility checker:
  `3c63519be04d159dd56a937c536b36549d0186b293610d8e6755716a9e343cce`.
- Stored-row Lean bank input:
  `197631f1e75ef334fb98a46149b805aafd0d43e7b74b810701947abf8eb4e74e`.

## Generation and byte parity

The primary generation command was:

```text
uv run python scratch/runs/prove2me-s2785-row-set-20260913/prototype/tmp/surplus-compg-s2785.py --cell s2785 --output-dir scratch/runs/prove2me-s2785-row-set-20260913/prototype/artifacts/data --tree-proof-dir scratch/runs/prove2me-s2785-row-set-20260913/prototype/artifacts/lean/S2785TreeProof --tree-module-prefix Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof --tree-certificate-json scratch/runs/prove2me-s2785-row-set-20260913/prototype/artifacts/s2785-tree.json
```

The fresh run used the same driver and paths beneath `tmp/fresh/`. The canonical run
used `scripts/surplus-compg-singleton-cnf.py` and paths beneath `tmp/canonical-run/`.
Recursive comparisons found no differences among the three data trees, Lean trees,
or certificate JSON files. The promoted Lean tree also matches canonical output.

The encoding has 248 variables and 18,552 clauses: 8 at-least-one, 4,079
at-most-one, 14,449 cross-separation, and 16 blocked-target clauses. Domain sizes are
`u=13`, `Q1=36`, `Q2=37`, `Pu=36`, `Pw=37`, `s1=23`, `s3=23`, and `s2=43`.
Pair-count constraints are not used for this populated-cell certificate.

The structural certificate contains 1,310 partial states, 1,294 split nodes, 40,604
separation prunes, and 16 terminal assignments. An independent recursive census of
the certificate JSON reproduced 1,294 split, 40,604 prune, and 16 done nodes.

It emitted 54 Lean modules totaling 1,561,631 bytes. The SHA-256 over sorted relative
filename, NUL, and raw-content records is
`15ea29b0be9c436aa30ec36ab084f1bfcd41b9ba87c8467faad782ae72e2c365`.

Artifact digests:

- CNF (208,630 bytes): `052a9a6ec338ba9d45c97e1664b34e8333e622e7a57bfa7bb0b32f16783616b0`.
- CNF manifest (5,821 bytes): `12d595c01a9c2441430fd87df83c438718e93a42d60aabec1928334f95906bc6`.
- Uniqueness-oracle JSON (2,157 bytes): `bc611cec76fdf52e640fae603cd4cef07bb36f1c4b8ba1fdb43dc87c5631394d`.
- Variable map (18,758 bytes): `85d8a1e8c799afc7bb67a5efa53d17b352deaa8c4336676e0056324c4e2b832a`.
- Structural-certificate JSON (15,295,436 bytes): `4b8134c31e463b7420864cd9f1931955f3b40ff30836005a9b06c1f9bca4de80`.

A case-insensitive whole-word scan of all 54 generated Lean files found zero
`sorry`, `admit`, `unsafe`, `native_decide`, `axiom`, `partial`, `extern`, or
`implemented_by` occurrences and zero `Lean.ofReduceBool`, `Lean.ofReduceNat`, or
`Lean.trustCompiler` occurrences.

## Promotion and trust evidence

Promotion added the canonical generator specification, sixteen target definitions,
all 54 generated modules, the `s2At785` populated-cell constructor, sixteen stored-row
membership lemmas, and its dispatcher branch. Structural coverage now contains thirteen
populated cells. This promotion makes no claim about empty cells.

Ruff passed on the canonical and governed generator sources. Lean LSP completed the
compatibility checker, generated root, and populated-cell dispatcher with no errors.
The checker and generated root retain established linter warnings from this source family;
the dispatcher reported no diagnostics.

Targeted `lake-build` completed all 1,805 jobs, including the generated root and
thirteen-cell dispatcher. The 408,541-byte build log is retained at
`artifacts/s2785-build.log`, has SHA-256
`903c02c3183d6e61b0f23b9a1cbfa35bb443d57902770bfa301821f639c2e057`, and ends with
`BUILD-EXIT=0`. Its warnings include pre-existing `native_decide` linter reports from
the stored-row bank; the generated-tree forbidden scan is clean.

Binding record `docs/audits/2026-09-13-s2785-row-set-lean-ingress-binding.json`
passed semantic validation with self-hash
`83b27ccda7b1ef1e315eb5f0a98389d65662419bc287d7a57433613079897393`.
Each of its three exported declarations depends only on `propext`,
`Classical.choice`, and `Quot.sound`; its post-probe source recapture was stable. The
ingress root is 11,001 bytes with digest
`b6e442c5074d285702fb05725c52bfebbaf4333c1a7a3c706d5241cd711e3838`.
The aggregate is 30,906 bytes with digest
`b5cfdc8d689a1607561275d6fcf7dab80f169bc536f3d211ebc3eeb5adb978df`.
The repository-local closure contains 57 modules, with modules digest
`da75bca82b41290b75607d44d167c927e3c36dbe7e4d59746f3d8260e9d6abfa`.

After fresh reference and writer scans, the two exact temporary probe directories were
moved to recoverable temporary quarantine
`/private/tmp/prove2me-s2785-probes.6KYj3q/`; both probe logs remain under `artifacts/`.

A repository scan found no frozen bank `source_manifest` or pinned dependency entry
that names an owned S2785 source path, so no bank refreeze is required. Earlier
Lean-ingress binding records remain historical records of their captured aggregate bytes.

## Hygiene

The final read-only hygiene report accepted the checkpoint and run-manifest hashes and
reported zero lane-local issues. Its overall `blocking` flag comes from unrelated
shared-worktree state: 13,821 entries, including 4,650 durable untracked paths, 8,952
unregistered generated paths, 127 root spills, and 32 foreign dirty paths.
