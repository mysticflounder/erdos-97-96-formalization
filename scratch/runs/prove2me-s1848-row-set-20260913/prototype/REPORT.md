# S1848 four-row structural-certificate promotion

Status: promoted and exhaustive within the depth-two compatibility abstraction. Two
generations matched byte-for-byte; the canonical modules were source-scanned, built,
wired to the dispatcher, axiom-audited, and bound by a semantic Lean-ingress record.

## Inputs and targets

- Repository base: `851b318873cfa5c5985c934934d928f5a170237a`.
- Cell: `(s1, 848)`.
- Label order in each mask row: `u, v, w, s1, s2, s3, Pw, Pu, Q1, Q2`.
- Search-center order: `u, Q1, Q2, Pw, Pu, s3, s2, s1`.
- `s1_024` / `s1848TargetA`: `[114, 201, 848, 531, 680, 78, 390, 297, 549, 284]`.
- `s1_025` / `s1848TargetB`: `[178, 201, 848, 531, 106, 652, 390, 297, 549, 284]`.
- `s1_026` / `s1848TargetC`: `[178, 201, 848, 531, 106, 652, 297, 326, 549, 284]`.
- `s1_027` / `s1848TargetD`: `[300, 201, 848, 688, 291, 525, 154, 85, 610, 390]`.

The prototype copied the then-current canonical generator to
`tmp/surplus-compg-s1848.py` and added only this `CellSpec`. Promotion added the same
specification to the canonical generator, whose bytes now match that audited driver:

```diff
+        CellSpec(
+            "s1848",
+            "s1",
+            (114, 201, 848, 531, 680, 78, 390, 297, 549, 284),
+            ("u", "Q1", "Q2", "Pw", "Pu", "s3", "s2", "s1"),
+            "s1848",
+            (
+                (178, 201, 848, 531, 106, 652, 390, 297, 549, 284),
+                (178, 201, 848, 531, 106, 652, 297, 326, 549, 284),
+                (300, 201, 848, 688, 291, 525, 154, 85, 610, 390),
+            ),
+            ("s1848TargetA", "s1848TargetB", "s1848TargetC", "s1848TargetD"),
+        ),
```

Source and input digests:

- Promoted canonical generator: `cc82697d4b4d06dea676d4d4aacf6a511bf806da9da447c5347ca6099cda171b`.
- Scratch driver: `cc82697d4b4d06dea676d4d4aacf6a511bf806da9da447c5347ca6099cda171b`.
- Promoted compatibility checker source: `baa53dc2b8c7952db52a08a01c4cd37443851c3fb020d33b885158c4b6d5b246`.
- Stored-row bank input: `197631f1e75ef334fb98a46149b805aafd0d43e7b74b810701947abf8eb4e74e`.

## Generation

Primary command, run from the repository root:

```text
uv run python scratch/runs/prove2me-s1848-row-set-20260913/prototype/tmp/surplus-compg-s1848.py --cell s1848 --output-dir scratch/runs/prove2me-s1848-row-set-20260913/prototype/artifacts/data --tree-proof-dir scratch/runs/prove2me-s1848-row-set-20260913/prototype/artifacts/lean/S1848TreeProof --tree-module-prefix Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1848TreeProof --tree-certificate-json scratch/runs/prove2me-s1848-row-set-20260913/prototype/artifacts/s1848-tree.json
```

The fresh-generation check used the same command with `artifacts/data`,
`artifacts/lean/S1848TreeProof`, and `artifacts/s1848-tree.json` replaced by
`tmp/fresh/data`, `tmp/fresh/lean`, and `tmp/fresh/s1848-tree.json`.
Recursive directory and file comparisons reported no differences.

The generated encoding has 277 variables and 21,305 clauses: 8 at-least-one,
5,448 at-most-one, 15,845 cross-separation, and 4 blocked-target clauses. Domain
sizes are `u=9`, `Q1=27`, `Q2=36`, `Pw=52`, `Pu=51`, `s3=20`, `s2=41`, and
`s1=41`.

The structural tree has 949 partial states, 945 splits, 36,842 explicit separation
prunes, and 4 terminal target assignments. It emitted 30 Lean modules totaling
1,424,940 bytes. The sorted `filename NUL raw-content` SHA-256 over those modules is
`ed809ca7a100d8dc9bc3c7c84306196e43dc7a59f4a9d6fd5dba3f5985db685d`.

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
Shard06Child20.lean
Shard06Child21.lean
Shard06Child23.lean
Shard07.lean
Shard07Child02.lean
Shard07Child07.lean
Shard07Child09.lean
Shard07Child11.lean
Shard07Child13.lean
Shard07Child16.lean
Shard07Child21.lean
Shard07Child22.lean
Shard07Child24.lean
Shard07Child25.lean
Shard08.lean
```

## Artifact digests and checks

- CNF: `a5c157898f688e09eb8840247ddfc98d39260b50bf7c153961e2d54f0f06ed83`.
- CNF manifest: `2a48824c66faee4c7b30d3f043a559b5b655de34e072f92d5766a90ec846ddb4`.
- Uniqueness-oracle JSON: `196009fd627f0049ee0903709868a4e441ed6f2ea0487000fed94dc2395aaf55`.
- Variable map: `590e48b0a36e946427d3e7f85b2e4b6bd7fe1d8d72a80c446d054370735f601f`.
- Structural-certificate JSON: `7e37c8de6a29f5617fa43da0056fe4e7e3cefe3676d08bc21a44aa2cf4b7fd91`.
- Generated-Lean aggregate: `ed809ca7a100d8dc9bc3c7c84306196e43dc7a59f4a9d6fd5dba3f5985db685d`.

An exhaustive case-insensitive word scan of all 30 generated Lean files found zero
`sorry`, `admit`, `unsafe`, or `native_decide` occurrences.

## Promotion and trust evidence

Promotion made these repository source changes:

- `scripts/surplus-compg-singleton-cnf.py`: added the audited S1848 `CellSpec`.
- `lean/Erdos9796Proof/P97/SurplusCOMPGBankCoverage.lean`: added
  `s1848TargetA` through `s1848TargetD`, `s1848Targets`, and `s1848Fixed`.
- `lean/Erdos9796Proof/P97/SurplusCOMPGBankCoverage/S1848TreeProof/`: added the 30
  generated modules listed above, preserving the module aggregate digest.
- `lean/Erdos9796Proof/P97/SurplusCOMPGBankCoverage/SingletonCells.lean`: imported the
  root and extended the structural coverage dispatcher for `(s1, 848)`.

Targeted `lake-build` completed all 1,189 jobs, including the generated root and
five-cell dispatcher. Binding record
`docs/audits/2026-09-13-s1848-row-set-lean-ingress-binding.json` passed semantic
validation with self-hash
`3c1d4aadd46104c2185e9009f1b26cc4d9f40badb4d59388e94c247bf53af539`.
Its three exported declarations depend only on `propext`, `Classical.choice`, and
`Quot.sound`; its post-probe source recapture was stable.

The lane hygiene report accepted both manifest self-hashes and reported zero issues.
Its overall `blocking` flag comes from unrelated shared-worktree state (13,744 entries,
including 32 foreign dirty paths), not from this lane.
