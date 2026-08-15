# Child35 assembly/export/provision map

Audit is read-only; no solver or PIQD command was run.  Observed repository
HEAD is `094a49c3`.  The working tree contains three untracked Lean files for
the proposed successor, but no Child35 publication or custody layer.

## New Lean assembly actually present

* `lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenThirtyFourthPerpendicularBisectorRefinement.lean`
  (observed SHA-256
  `dfc440da5753ecb0051cc4a9245ae27366a1dce55577c9e8171d692cd0966052`).
  It imports `BlockerVExactSeventeenThirtySecondModelRefinements` and
  `FrontierLiveClosure.GenericPerpBisectorNogoodCertificate`, records the
  eight child-34 hits `(1,3),(1,13),(3,4),(3,12),(3,13),(13,3),(13,4),(13,12)`,
  checks forward/reverse data, and defines four clauses over
  `namedOrders × directions` (`...:7-8,109-215`).
* `.../BlockerVExactSeventeenThirtyFourthModelRefinements.lean`
  (SHA-256 `461a58e852d49849b3c4e8c1616e07307b95bb1b294dec5776ea85d8e5094ca5`).
  Imports `ThirtyThirdModelRefinements` plus the new perpendicular-bisector
  module, appends `thirtyFourthModelRefinementClauses`, proves suffix length 4,
  and proves total length **5,847,260** (`...:7-8,28-50`).  This is a checked
  Lean count only; no DIMACS child35 bytes exist.
* `.../BlockerVExactSeventeenThirtyFourthModelRefinementsExport.lean`
  (SHA-256 `ef97f6190632b2f90113da403e0a6971d8d14be894f5c33eafa3d0d7228b69db`).
  Imports that model and emits canonical DIMACS directly from the checked list;
  its usage name is `exact17_source_thirty_fourth_model_refinements_cnf_export`
  (`...:7-37`).  The module comment calls this the thirty-fifth child root.

The new model's lineage is therefore:
`ThirtySecondModelRefinements` -> `ThirtyThirdModelRefinements` (existing
Child34 source) -> `ThirtyFourthModelRefinements` (new four-clause suffix).
The exporter is not referenced by a production import chain; the current
`docs/live-blueprint.md` listing marks it among unimported files.

## Existing Child34 custody chain (still the only provisioned chain)

`scripts/export_exact17_thirty_fourth_root.py` remains hard-coded to
`validate_exact17_thirty_third_model_refinements_export`, the old
`ThirtyThird...` Lean sources, parent
`exact17-thirty-third-root-thirty-second-model-refinements.cnf`, child
`exact17-thirty-fourth-root-thirty-third-model-refinements.cnf`, and
`child34-export-receipt.json`.  Its validator/ingress/runner/test are likewise
the Child34 files:

* `validate_exact17_thirty_third_model_refinements_export.py` (308 vars,
  parent 5,847,248, suffix 8, child 5,847,256);
* `validate_exact17_thirty_third_model_refinements_ingress.py`;
* `run_piqd_exact17_thirty_fourth_root.py` (namespace `child34`, manifest SHA
  `01a53c3772486002cbb7a54fb1db24a21027c38bd9670ab2814eb26fe3ef62a2`, root
  SHA `ea8311540af709cf991c932c38e52f9767227cf55781508f2791b1dc42c4a819`);
* `test_child34_publication.py`.

The authenticated Child34 receipt is
`scratch/exact17-lean-to-sat/child34-export-receipt.json` (SHA
`dfd27a4fcdaabba87270259988b4b39a5debcf8f0d1d56802a35b40a035c59fc`), and its
published root is the required Child35 parent.  Thus the only currently
known Child35 parent pin is Child34 root SHA
`ea8311540af709cf991c932c38e52f9767227cf55781508f2791b1dc42c4a819`.

## Missing delta / promotion status

No files named `*child35*`, `validate_exact17_thirty_fourth_*`,
`export_exact17_thirty_fifth_root.py`, `run_piqd_exact17_thirty_fifth_root.py`,
`test_child35_publication.py`, Child35 CNF, receipt, ingress manifest, or
custody state exist on disk.  Consequently there is no Child35 export SHA,
byte count, ordered-suffix digest, manifest SHA, daemon/solver binding, or
PIQD job.  The expected dimensions are 308 variables and 5,847,260 clauses,
but the successor is **not exported, validated, provisioned, or promotable**.
No SAT/UNSAT or counterexample claim follows from these source modules.

## Required validation sequence (not run here)

After implementing the missing layer, the established commands should be
instantiated with Child35 paths/pins:

1. From `lean/`, `lake env lean --run
   Erdos9796Proof/P97/ATail/BlockerVExactSeventeenThirtyFourthModelRefinementsExport.lean
   ../scratch/exact17-lean-to-sat/exact17-thirty-fifth-root-thirty-fourth-model-refinements.cnf`.
2. Run the new export validator against the Child34 parent and the new child
   with its explicit four-clause suffix, then emit and validate a new
   `...thirty-fourth-model-refinements-core1.json` ingress manifest.
3. Run the new publication test (the Child34 regression is
   `uv run pytest scripts/test_child34_publication.py`) and ruff/static checks.
4. Only after independent identity/custody checks should a new core-1 runner
   be provisioned; no runner or PIQD operation is authorized by this map.
