# Agent Instructions

## Existing P97 Theorem Banks

Before deriving a new finite-pattern, row-slot, incidence, or local metric
contradiction for Problem 97, check the already-mined theorem-bank registry:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially
  "Sibling `p97-rvol` banks";
- `certificates/p97_rvol_general_n_mining.md` for the concise census; and
- `certificates/p97_rvol_general_n_mining.json` for every declaration,
  normalized statement shape, source path, and import-reachability result;
- `certificates/erdos97_legacy_general_n_mining.md` for the concise census of
  the legacy `~/projects/math-projects/erdos/97` archive; and
- `certificates/erdos97_legacy_general_n_mining.json` for that archive's
  exhaustive local-source candidate inventory;
- `certificates/erdos_general_theorem_p97_mining.md` for the concise census of
  the older `~/erdos-general-theorem/97` worktree; and
- `certificates/erdos_general_theorem_p97_mining.json` for that worktree's
  exhaustive local-source candidate inventory.

Also search the indexed Lean corpora before reproving a candidate:

```bash
nthdegree docs search --lean "<mathematical statement or theorem name>"
```

The sibling census has already identified:

- 96 general-n U5 class-level incidence incompatibility families, supported by
  88 metric-point and 112 scalar-algebra kernels;
- 18 unimported U1 source-unit contradiction consumers for ordinals
  `2, 12, 40, 47, 88, 136, 169, 206`; and
- `Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`.

## Proof obligations and promotion

Represent every active in-project proof obligation loudly in Lean. An active
obligation must be a theorem with an explicit mathematical statement and
`sorry`, transitively consumed by a publish target. Do not hide active
obligations solely as proposition-valued `def`s, structure fields,
higher-order contradiction arguments, or prose-only steps.

It is permitted to replace one load-bearing `sorry` by several load-bearing
leaf `sorry`s when all of the following hold:

1. a kernel-checked producer or case split proves that the new leaves
   collectively cover the parent;
2. the change records an auditable narrowing measure for each leaf, such as
   strictly stronger hypotheses, a smaller cardinality range, or a decrease in
   another stated well-founded complexity measure; stronger hypotheses count
   only when the parent proves them for that branch;
3. every leaf is wired to the parent and a publish target in the same change;
4. the split is acyclic and does not call the parent after erasing data;
5. the leaf statements are stable enough to be the next direct proof targets;
6. superseded outcome, adapter, or closer interfaces are removed, made private,
   or explicitly classified as compatibility-only; and
7. the change records the coordinator-interface frontier before and after,
   including the chosen granularity and immediate constructor fan-out, not only
   the raw `sorry` count.

Do not introduce orphan or off-spine `sorry`s. Exploratory specifications that
are not ready for promotion must be marked `PARKED-SPEC` and must not be called
current obligations or proof progress.

A conditional theorem that assumes the missing contradiction, a
`...Closers` package, or an outcome enumerator is bookkeeping until it either
eliminates a case or feeds a proved terminal. A source-clean wrapper does not by
itself count as closure. Such assumptions and fields must still be listed in the
coordinator-interface frontier even though they do not satisfy the loud
Lean-obligation gate.
