# Exact-five profile 0034 NEW-mirror reduced-cell confirmation postrun

Date: 2026-09-05

Status: authenticated diagnostic complete; target inconclusive.

## Scope and custody

This run independently checked the recovered GT and LT reduced unguarded
cells. It makes no source-realization, source-completeness, theorem, Lean
ingress, promotion, or closure claim. All terminal claim fields are false.

- Run root:
  `scratch/runs/exactfive-profile0034-new-mirror-reduced-cell-confirmation-piqd-20260905/run-0001`
- Execution commit: `bffaf8c50100dcd7637f761a3baf6e9c397268e5`
- Wall/user/sys: `4m11.546s / 20.227s / 2.077s`
- Run manifest SHA-256: `d1de7b82470b2d7eed2265fc4b20ba254aab675319094475ac3a50df11a457f2`
- Launch SHA-256: `e8a84f9e314d9e912863b2a2a8ef09a720d259e51336ce2068cafc04ac39531f`
- Terminal SHA-256: `74c28c3ff5dfc63b42a71134501126c23fa26f58193ff36f08105f737471cbc0`
- Parent-custody SHA-256: `bbaafb1f39e161ff7387fc6d489643152f9d0e14cd9a5570e2d8c08371930487`

Strict offline verification passed. The audit found 673 safe entries: 664
regular files and 9 directories. Six unique sessions closed; no session was
resumed, no request was replayed, and no response loss occurred.

## Reduced cells

The GT cell retains:

```text
edge-index-00, edge-index-01, edge-index-03, edge-index-04,
source-row-equality-00, source-row-equality-01,
source-row-equality-03, source-row-equality-05
```

Retained-group-list SHA-256:
`b87f28e24a17ce52e7f9b45b761730befa82807937b49152b04247f0306130e9`.
Its journal has 48 assertions, 69 commands, and 5,365 bytes, with SHA-256
`b890625b9b39c1452de181d776e89addd76deb9b26321b93cb344713e35ba611`.

The LT cell retains:

```text
edge-index-00, edge-index-01, edge-index-03, edge-index-04,
edge-index-06, source-row-equality-01, source-row-equality-02,
source-row-equality-03, source-row-equality-05
```

Retained-group-list SHA-256:
`c38f1b732a8fc0b8043ca1b4181af97e828c273600273ba98e5b0282aef0a92c`.
Its journal has 59 assertions, 80 commands, and 6,340 bytes, with SHA-256
`4eed0894343ae34a60d1b8b5c3328c4a584cdb7e344dad3dddcb3136e441be22`.

## Results

| Cell | Engine | Raw result | Time | Terminal disposition |
|---|---|---:|---:|---|
| GT | Z3 | UNSAT | 57 ms | `UNSAT_CUSTODY_VALID` (raw discovery) |
| GT | cvc5 | UNKNOWN | 90,006 ms | `UNKNOWN` |
| LT | Z3 | UNSAT | 33,416 ms | `UNSAT_CUSTODY_VALID` |
| LT | cvc5 | UNKNOWN | 90,008 ms | `UNKNOWN` |

The fresh cvc5 positive and negative controls passed (`SAT_REPLAYED` and
`UNSAT_CUSTODY_VALID`). Cross-engine agreement is false for both GT and LT,
so the terminal status is `TARGET_INCONCLUSIVE`. No target result is promoted
as a solver proof or mathematical conclusion.

## Completed-wave mine and next action

The completed-wave mine found no theorem candidate and triggered no Lean-corpus
search. Next run exhaustive singleton/group deletion on the reduced cells,
then obtain an independent certificate in a later lane. Do not run another
cvc5 confirmation at this stage.

For provenance and replay instructions, see the [physical block-deletion
recovery postrun](2026-09-05-exactfive-profile0034-new-mirror-physical-block-deletion-recovery-postrun.md),
the [confirmation specification](../specs/p97-exactfive-profile0034-new-mirror-reduced-cell-confirmation-piqd-v1.md),
the [producer](../../census/card_head/exactfive_profile0034_new_mirror_reduced_cell_confirmation_piqd.py),
and the [runner](../../scripts/run_exactfive_profile0034_new_mirror_reduced_cell_confirmation_piqd.py).
