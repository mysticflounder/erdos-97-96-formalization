# S2864 six-row structural-certificate promotion

Status: promoted and exhaustive within the generator's depth-two compatibility
abstraction. Two generations matched byte-for-byte; the canonical Lean modules were
built, wired to the dispatcher, axiom-audited, and bound by a semantic Lean-ingress
record.

## Inputs and targets

- Repository base: `64a87171fc69e17b34021fc1876df52118bc6409`.
- Cell: `(s2, 864)`, with fixed masks `v = 209` and `w = 864`.
- Label order in each row: `u, v, w, s1, s2, s3, Pw, Pu, Q1, Q2`.
- Search-center order: `u, Q1, Q2, Pw, Pu, s1, s3, s2`.
- `s2864TargetA`: `[284, 209, 864, 291, 172, 533, 178, 105, 582, 394]`.
- `s2864TargetB`: `[284, 209, 864, 291, 680, 533, 178, 105, 582, 394]`.
- `s2864TargetC`: `[284, 209, 864, 102, 680, 533, 178, 75, 646, 297]`.
- `s2864TargetD`: `[284, 209, 864, 294, 680, 533, 178, 105, 582, 267]`.
- `s2864TargetE`: `[284, 209, 864, 294, 680, 533, 178, 105, 582, 394]`.
- `s2864TargetF`: `[284, 209, 864, 294, 680, 533, 178, 105, 646, 267]`.

The then-current canonical generator was copied to `tmp/surplus-compg-s2864.py`; only
that governed scratch copy received the S2864 `CellSpec` during the prototype. Promotion
added the same specification to the canonical generator. Its separation oracle
enumerates the supplied rows in C, A, B, D, E, F order. The scratch specification
stores the rows and their Lean definition names in that order, preserving the requested
name-to-row mapping while satisfying the generator's strict deterministic-order check.

Source and input SHA-256 digests:

- Promoted canonical generator: `234e89171b923253db605592ed37f7d426013c6c312990ae36390ec5f0dd7b7c`.
- S2864 scratch driver: `234e89171b923253db605592ed37f7d426013c6c312990ae36390ec5f0dd7b7c`.
- Promoted compatibility checker source: `16d8b9bfadfca0b91063f1e93e244d362c44715136c408f313fdcf7a9ed18f31`.
- Stored-row bank input: `197631f1e75ef334fb98a46149b805aafd0d43e7b74b810701947abf8eb4e74e`.

## Generation

Primary command, run from the repository root:

```text
uv run python scratch/runs/prove2me-s2864-row-set-20260913/prototype/tmp/surplus-compg-s2864.py --cell s2864 --output-dir scratch/runs/prove2me-s2864-row-set-20260913/prototype/artifacts/data --tree-proof-dir scratch/runs/prove2me-s2864-row-set-20260913/prototype/artifacts/lean/S2864TreeProof --tree-module-prefix Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof --tree-certificate-json scratch/runs/prove2me-s2864-row-set-20260913/prototype/artifacts/s2864-tree.json
```

The second generation used the same command with all three output paths under
`tmp/fresh/`. Recursive byte comparison of the data and Lean trees, plus direct
comparison of the certificate JSON, found no differences.

The encoding has 278 variables and 21,704 clauses: 8 at-least-one, 5,468
at-most-one, 16,222 cross-separation, and 6 blocked-target clauses. Domain sizes are
`u=9`, `Q1=27`, `Q2=36`, `Pw=52`, `Pu=51`, `s1=21`, `s3=41`, and `s2=41`.

The structural certificate contains 941 partial states, 935 split nodes, 36,683
separation prunes, and 6 terminal assignments. An independent recursive node census
of the certificate JSON reproduced 935 split, 36,683 prune, and 6 done nodes.

It emitted 30 Lean modules totaling 1,418,656 bytes. The SHA-256 over sorted relative
filename, NUL, and raw-content records is
`109b276983c9e59b52e7134fb79d486eb36bfe7ed867b0a4cd5eef5f46026d12` for both runs.

Generated modules:

```text
Root.lean
Shard00.lean
Shard01.lean
Shard02.lean
Shard03.lean
Shard04.lean
Shard05.lean
Shard05Child16.lean
Shard05Child18.lean
Shard05Child20.lean
Shard05Child24.lean
Shard05Child26.lean
Shard06.lean
Shard06Child16.lean
Shard06Child18.lean
Shard06Child20.lean
Shard06Child21.lean
Shard06Child23.lean
Shard07.lean
Shard07Child01.lean
Shard07Child08.lean
Shard07Child09.lean
Shard07Child12.lean
Shard07Child13.lean
Shard07Child15.lean
Shard07Child21.lean
Shard07Child22.lean
Shard07Child24.lean
Shard07Child25.lean
Shard08.lean
```

## Artifact digests and source scan

- CNF (245,470 bytes): `968f7528546cc8c89341305a0a96a3a48b0f7af3e85ec0b8caf6c68881e48c5f`.
- CNF manifest (4,945 bytes): `90bbc80303517f817eb9d91bcb9e5e1ebabfd704b6d114a7a43221172b9c7cc4`.
- Uniqueness-oracle JSON (964 bytes): `a88d434ee97cdea0c3f1b48193ef18751a80147b5bcd9acbd88233b00cce3f73`.
- Variable map (21,030 bytes): `929a42cb81546175dd4d98fa3979b751483958b94b01eabc2bbe28fd497a2b16`.
- Structural-certificate JSON (13,790,827 bytes): `394cd21b3eb54efb3a216bb969341be59e788219eb2a428e683eb4ebdfaec22e`.
- Generated-Lean aggregate (1,418,656 bytes): `109b276983c9e59b52e7134fb79d486eb36bfe7ed867b0a4cd5eef5f46026d12`.

A case-insensitive whole-word scan of all 30 generated Lean files found zero
`sorry`, `admit`, `unsafe`, `native_decide`, `axiom`, `partial`, `extern`, or
`implemented_by` occurrences and zero `Lean.ofReduceBool`, `Lean.ofReduceNat`, or
`Lean.trustCompiler` occurrences.

## Promotion and trust evidence

The six-row cell does not cause a generator explosion. Generation completes in about
three seconds per run and produces 30 modules / 1.42 MB of Lean. The certificate JSON
is 13.79 MB, but remains ordinary reproducible scratch output under the governed run
root. The only integration constraint discovered is
the generator's strict enumeration-order invariant described above; the emitted root
keeps the requested A-F theorem names attached to their supplied rows.

Promotion added the audited generator specification, six target definitions, all 30
modules, and the eighth dispatcher branch. Fresh canonical generation matches the
promoted modules and all seven earlier certificate families remain byte-for-byte
unchanged.

Targeted `lake-build` completed all 1,326 jobs, including the generated root and
eight-cell dispatcher. Binding record
`docs/audits/2026-09-13-s2864-row-set-lean-ingress-binding.json` passed semantic
validation with self-hash
`b9a8f5d956a642b54753eb7a29d180becb6d9cfafb3af3d11292fbadb77934c6`.
Its three exported declarations depend only on `propext`, `Classical.choice`, and
`Quot.sound`; its post-probe source recapture was stable.

## Hygiene

The read-only lane hygiene report accepted the checkpoint and run-manifest self-hashes
and reported zero lane-local issues. Its overall `blocking` flag comes from unrelated
shared-worktree state: 13,752 entries, including 4,650 durable untracked paths, 8,942
unregistered generated paths, 127 root spills, and 32 foreign dirty paths. No
lane-local blocker was reported.
