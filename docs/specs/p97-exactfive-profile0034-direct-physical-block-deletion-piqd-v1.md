# Exact-five profile0034 direct physical-block deletion — PIQD v1

This lane is an immutable discovery search over the authenticated
`parent-cvc5-direct` order from the supporting-edge profile0034 run. Both
radius branches are submitted to Z3 through PIQD HTTP, because Z3 is the
stronger discovery engine for these cells. No solver is run while scaffolding
this producer.

The first launch, `run-0001`, stopped before producing a scientific result
because the standalone SAT verifier omitted the source parser's bound order
identifier. Its partial root is preserved under
`scratch/quarantine/exactfive-profile0034-direct-physical-block-deletion-piqd-20260905/failed-run-0001-parser-order-id/`.
An unlaunched `run-0002` initialization was likewise quarantined when the
pre-commit hygiene gate exposed its stale relationship to `run-0001`. The
corrected producer supplies the identifier, covers the target-SAT path with a
focused regression, and launches only into the fresh immutable `run-0003`
root.

The lane checkpoint was created before the producer, test, runner, and spec
paths at observed base HEAD `ed08027473e9741b2a34fac7d7597d2fe6756085`.
The active `run-0003` generated root is declared in the lane checkpoint and is
initialized only by its separate launch action.

Each branch starts with exactly 26 retained physical groups: 13 supporting-edge
blocks, 11 source-row equalities, `radius-branch`, and `source-strict`. The
search tests stable partitions at granularities 2, 4, 8, 16, and 26. Including
the full-formula anchor, a branch with no accepted reduction executes exactly
57 target probes. Every one of the five partition rounds runs even when the
anchor is UNKNOWN, replayed SAT, or has a rejected SAT replay. An accepted
UNSAT reduction changes the current set used to deterministically reconstruct
later partitions, so an adaptively reduced branch may schedule fewer than 57
probes; every branch remains below the hard cap of 128. The third-source slot
choice adds no assertion and does not duplicate cells: both slots are already
points of the blocker-row support.

A current set changes only when a probe is custody-valid UNSAT. SAT is usable
only after exact rational replay of every submitted retained group. UNKNOWN,
transport loss, and rejected SAT replay remain unresolved and do not change
the current set, but they never suppress later granularities. If no target
probe is custody-valid UNSAT, the branch reports
`INCONCLUSIVE_NO_SMALLER_UNSAT_SUBSET_DISCOVERED` after the complete schedule,
with all 26 groups retained. Fresh positive SAT and negative UNSAT controls are
run in separate Z3 sessions before targets.

The producer pins the parent run manifest, launch, and terminal; each direct
branch's result, journal, descriptor, and source manifest; and the exact bytes
of the supporting-edge producer, its equilateral-frame predecessor, the
`bo_source` exact parser, and the PIQD source adapter. Every child descriptor
snapshots those records and modules, so offline verification can reconstruct
the submitted journal and semantic replay boundary without consulting PIQD.

This is formula-scoped discovery only. It does not establish live-source
realization or completeness, all-order coverage, core minimality, a theorem,
Lean ingress, closure, or promotion.
