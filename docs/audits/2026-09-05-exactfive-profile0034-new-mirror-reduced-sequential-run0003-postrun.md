# Exact-five profile 0034 sequential run-0003 postrun

Date: 2026-09-05

Status: internally verified diagnostic; direct source-manifest completeness
gap requires a fresh recovery run.

## Recorded run

- Original run root:
  `scratch/runs/exactfive-profile0034-new-mirror-reduced-sequential-confirmation-piqd-20260905/run-0003`
- Preserved quarantine destination:
  `scratch/quarantine/exactfive-profile0034-new-mirror-reduced-sequential-confirmation-piqd-20260905-source-manifest-gap/run-0003`
- Execution commit: `a1e9a46d312dadaff95f157ad8bbb592773380f4`
- Wall/user/system time: `65.59s / 13.24s / 1.06s`
- Run-manifest file/self SHA-256:
  `0aafc3e9911b01a5956239b0505151c288b7c2f9f10896df9894c9002754dcd4` /
  `22411ffca323f2d7548187fd1b4145dbe49b7dba36b1408b35d7c166b9f2c027`
- Launch file/self SHA-256:
  `d51b7ea8e07ef567612341329efd12fa5d641962071aa48a5a2852580ed5394c` /
  `bf68c7e0bdc3fb5d947afd79c142e8a2b61f42254c5bd5cacdcf822cfeef2b5f`
- Terminal file/self SHA-256:
  `b4b31dcd1882df15d62f67598bcdafbe8ab4329c0e6a674804716441de5d74bb` /
  `558b1867899d03049c8043ecccf1c88643f400bb0c4658ac20c0fb04487a74e3`
- Parent custody:
  `6f70dbf7d81353bfd815df50e43f3e048331aa365178bd8872c9c1f922899a9d`

The strict offline verifier exits zero against the producer's declared source
set. Independent audit found 208 regular files, four unique fresh sessions,
one solve per session, no retry, resume, reconciliation, or transport loss,
and an empty runtime temporary directory.

The GT7 and LT8 target results are both `UNSAT_CUSTODY_VALID`; their solve
times are 32,305 ms and 18,261 ms. The positive control is `SAT_REPLAYED` and
the negative control is `UNSAT_CUSTODY_VALID`. Every theorem,
source-realization, completeness, minimality, simultaneous-removability,
Lean-ingress, promotion, and closure claim remains false.

## Direct source-manifest gap

The exact replay path calls code in:

- `census/card_head/exactfive_profile0034_new_mirror_supporting_edge_qfnra_piqd.py`;
- `census/card_head/exactfive_hard_source_swap_bo_source_qfnra_piqd.py`.

Those modules are reached through the physical-recovery module but are not
listed directly in run-0003's child source manifest. The parent chain provides
additional historical custody, and the stored formulas and transport artifacts
are internally consistent, but the child execution-commit record does not
directly bind these two runtime files. Therefore run-0003 is retained only as a
qualified diagnostic and must not be used as a promoted result or as the
unqualified parent of the next deletion wave.

## Repair

Preserve run-0003 by move-only quarantine. Amend the same four-cell producer
to pin the supporting-edge and `bo_source` modules explicitly, advance to a
fresh immutable run identifier, and repeat both targets and both controls.
Only after that source-complete run passes independent offline audit should the
project launch the 15-target GT7/LT8 leave-one grid.

No Lean-corpus search was triggered by this wave because it produced no
concrete general theorem candidate. These unguarded fixed cells do not supply
the missing B1 source-realization argument.
