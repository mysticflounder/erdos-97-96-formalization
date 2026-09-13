# S1864 eight-row structural-certificate promotion

Status: promoted and exhaustive within the generator's depth-two compatibility
abstraction. Two generations matched byte-for-byte; the canonical Lean modules were
built, wired to the dispatcher, axiom-audited, and bound by a semantic Lean-ingress
record.

## Governed inputs

- Lane: `prove2me-s1864-row-set-20260913`.
- Repository base: `8dd554593479b0d53f3d61899d7983e764f8b140`.
- Cell: `(s1, 864)`, with fixed masks `v = 201` and `w = 864`.
- Row label order: `u, v, w, s1, s2, s3, Pw, Pu, Q1, Q2`.
- Search-center order: `u, Q1, Q2, Pw, Pu, s3, s2, s1`.

The supplied name-to-row mapping is:

- `s1864TargetA`: `[114, 201, 864, 531, 680, 78, 390, 281, 660, 300]`.
- `s1864TargetB`: `[178, 201, 864, 531, 106, 652, 390, 281, 596, 300]`.
- `s1864TargetC`: `[284, 201, 864, 688, 291, 525, 170, 101, 531, 390]`.
- `s1864TargetD`: `[284, 201, 864, 688, 102, 525, 170, 323, 531, 390]`.
- `s1864TargetE`: `[284, 201, 864, 294, 553, 660, 170, 113, 582, 275]`.
- `s1864TargetF`: `[284, 201, 864, 294, 553, 660, 170, 113, 582, 402]`.
- `s1864TargetG`: `[284, 201, 864, 402, 680, 86, 43, 593, 646, 293]`.
- `s1864TargetH`: `[284, 201, 864, 688, 291, 525, 170, 101, 594, 390]`.

The separation oracle enumerates those rows in the deterministic target-list order
`A, B, D, C, E, F, H, G`. The first invocation with supplied order `A` through `H`
stopped before writing outputs because the generator requires exact list order. The
scratch `CellSpec` therefore stores both rows and their definition names in oracle
order, preserving every supplied name-to-row association.

The then-current canonical generator was copied to `tmp/surplus-compg-s1864.py`; the
governed copy received only the S1864 `CellSpec` during the prototype. Promotion added
the same specification to the canonical generator, whose bytes now match the audited
scratch driver.

Source and input SHA-256 digests:

- Promoted canonical generator, `scripts/surplus-compg-singleton-cnf.py`:
  `c75948d41e913cb2d309154ec92c65894e131a06d94cd257e85054b1a2988275`.
- Governed scratch driver, `tmp/surplus-compg-s1864.py`:
  `c75948d41e913cb2d309154ec92c65894e131a06d94cd257e85054b1a2988275`.
- Promoted compatibility checker source,
  `lean/Erdos9796Proof/P97/SurplusCOMPGBankCoverage.lean`:
  `8768e794b2b52da151ab3b52030c1dbc39ad983ff116ab52afc60a7a33255698`.
- Stored-row bank input, `lean/Erdos9796Proof/P97/SurplusCOMPGBank.lean`:
  `197631f1e75ef334fb98a46149b805aafd0d43e7b74b810701947abf8eb4e74e`.

## Generation and deterministic replay

Primary command, run from the repository root:

```text
uv run python scratch/runs/prove2me-s1864-row-set-20260913/prototype/tmp/surplus-compg-s1864.py --cell s1864 --output-dir scratch/runs/prove2me-s1864-row-set-20260913/prototype/artifacts/data --tree-proof-dir scratch/runs/prove2me-s1864-row-set-20260913/prototype/artifacts/lean/S1864TreeProof --tree-module-prefix Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof --tree-certificate-json scratch/runs/prove2me-s1864-row-set-20260913/prototype/artifacts/s1864-tree.json
```

The second generation used the same command with outputs under `tmp/fresh/`.
Recursive comparisons of both data and Lean trees and a direct comparison of the
structural-certificate JSON found no byte differences.

The encoding has 298 variables and 24,184 clauses: 8 at-least-one, 6,078
at-most-one, 18,090 cross-separation, and 8 blocked-target clauses. Domain sizes are
`u=9`, `Q1=27`, `Q2=36`, `Pw=52`, `Pu=51`, `s3=41`, `s2=41`, and `s1=41`.

The structural tree has 1,094 partial states, 1,086 split nodes, 47,581 explicit
separation prunes, and 8 terminal target assignments. It emitted 39 Lean modules
totaling 1,858,080 bytes. The sorted `relative filename, NUL, raw content` aggregate
SHA-256 is
`43f67a31611e0caf0dece7be95bdd0c1fc2b5414027f3328d73232525e53f047`
for each generation.

Generated modules:

```text
Root.lean
Shard00.lean
Shard01.lean
Shard02.lean
Shard03.lean
Shard04.lean
Shard05.lean
Shard05Child15.lean
Shard05Child17.lean
Shard05Child20.lean
Shard05Child24.lean
Shard05Child26.lean
Shard06.lean
Shard06Child15.lean
Shard06Child17.lean
Shard06Child17Child15.lean
Shard06Child17Child25.lean
Shard06Child17Child25Child22.lean
Shard06Child17Child25Child28.lean
Shard06Child17Child25Child31.lean
Shard06Child17Child25Child32.lean
Shard06Child17Child25Child36.lean
Shard06Child17Child25Child37.lean
Shard06Child17Child25Child47.lean
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

## Artifact digests

Primary and fresh-generation files have the same SHA-256 digests:

- CNF, 274,786 bytes:
  `7a400e5291653afc8333069f52da794887fcff1f78684bea956f82d67834327b`.
- CNF manifest, 5,404 bytes:
  `27ed880f24dba50dbd277e03168ff4c7d10c1af2d671d85454ecff49e7b5c1a3`.
- Uniqueness-oracle JSON, 1,206 bytes:
  `e47bfcc0170bb75f284bddc7dc97b130251235b38e58661e6c404d30ff69a2b2`.
- Variable map, 22,547 bytes:
  `248da5295dda8ea9aa606015c24be6fbdc8c5ef9b4960b20c9d7012c5843f0b7`.
- Structural-certificate JSON, 18,650,573 bytes:
  `07b0081ae480de39bd755edcb023560848e3af2e0c05af028954dc06096f4334`.
- Generated-Lean aggregate, 1,858,080 bytes across 39 modules:
  `43f67a31611e0caf0dece7be95bdd0c1fc2b5414027f3328d73232525e53f047`.

An exhaustive case-insensitive whole-word scan of all 39 generated Lean files found
zero occurrences of `sorry`, `admit`, `axiom`, `unsafe`, `native_decide`, `partial`,
`extern`, or `implemented_by`, and zero occurrences of `Lean.ofReduceBool`.

## Promotion and trust evidence

No generation explosion occurred. The prototype completed in about five seconds per
run and produced 39 modules totaling 1.86 MB. The 18.65 MB structural JSON is the
largest artifact, while the Lean tree remains in the same broad scale as the nearby
row-set prototypes.

Promotion added the audited generator specification, eight target definitions, all 39
modules, and the ninth dispatcher branch. Fresh canonical generation matches the
promoted modules and all eight earlier certificate families remain byte-for-byte
unchanged.

Targeted `lake-build` completed all 1,365 jobs, including the generated root and
nine-cell dispatcher. Binding record
`docs/audits/2026-09-13-s1864-row-set-lean-ingress-binding.json` passed semantic
validation with self-hash
`f5b1d4f212677373582545002c1549187acbf987279aaf492e8a5ce8f1a88972`.
Its three exported declarations depend only on `propext`, `Classical.choice`, and
`Quot.sound`; its post-probe source recapture was stable.

## Hygiene

The read-only lane hygiene report accepted the checkpoint and run-manifest self-hashes
and reported zero lane-local issues. Its overall `blocking` flag comes from unrelated
shared-worktree state: 13,754 entries, including 4,650 durable untracked paths, 8,944
unregistered generated paths, 127 root spills, 32 foreign dirty paths, and this lane's
checkpoint control entry. No lane-local blocker was reported.
