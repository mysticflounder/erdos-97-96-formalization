# P97 prose synthesis coverage audit

## Result

The 2026-08-22 source archive was integrated by synthesis into the live project documentation. No parallel archive document tree was retained.

- Archive SHA-256: `e0a2df74165ed4ed13925273bc2e064eaafc51696139f02307cf861a551fc357`
- Archive files: `117`
- Integration-ledger rows: `117`
- Missing sources: `0`
- Extra sources: `0`
- Duplicate ledger rows: `0`
- Empty integration notes: `0`
- Coverage verifier: `true`

## Destination reconciliation

| Project destination | Source files synthesized |
|---|---:|
| `docs/audits/2026-08-22-f1-triapex-checkpoint4-review.md` | 16 |
| `docs/audits/2026-08-22-f2-twosource-checkpoint36-synthesis.md` | 41 |
| `docs/audits/2026-08-22-f3-twodeletion-third-pass-synthesis.md` | 11 |
| `docs/closure-evidence-status-ledger-2026-08-05.md` | 9 |
| `docs/dead-ends.md` | 5 |
| `docs/erdos-97-descent-prose-proof-atomic.md` | 19 |
| `docs/notes/2026-08-22-p97-literature-bridge.md` | 3 |
| `docs/p97-prose-material-integration-ledger-2026-08-22.md` | 4 |
| `docs/plans/2026-08-18-b-family-closure-plan.md` | 8 |
| `docs/rigid221-three-shell-classification-2026-08-06.md` | 1 |
| **Total** | **117** |

The main manuscript was rebased from the 4,006-line live atomic manuscript onto the 13,127-line canonical v8 baseline and then reconciled with later material: F1 checkpoint 4/D1 v23/D8, F2 checkpoint 36 and F8, F3 third-pass rejection of the recursive interface, B-family revision 4, Rigid221 cap-nine exact cover, A5 metric cells, and LB0--LB10.

## Proof-status boundary

This integration does not close Erdős Problem 97. The general non-`IsM44` contradiction remains open. The source audit records nine F1 `sorry`s, eight bare F2 `sorry`s, and three F3 `sorry`s; the last built publication-spine measurement must be regenerated before its reachability counts change. No fresh integrated Lean build or axiom audit was run for this prose-only merge.

## Durable evidence

- `scratch/runs/p97-prose-synthesis-20260822/integration-v1/source-inventory.json`
- `scratch/runs/p97-prose-synthesis-20260822/integration-v1/coverage-matrix.json`
- `scratch/runs/p97-prose-synthesis-20260822/integration-v1/run_manifest.json`

The verifier is `scratch/p97-prose-synthesis-20260822/build_coverage.py`; it authenticates the tar inventory and requires exactly one parser-compatible integration-ledger row for every archive file.
