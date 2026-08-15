# Shared-fourth crossed-three-row census with cross non-equalities

Date: 2026-08-08.  Namespace: `freshthird_crossed_shared_fourth_v2_cross_inequalities`.
This directory is scratch-only theorem discovery; it is not Lean closure or a
Euclidean realization.

## Source admission

The source packet is `FirstFiberCrossedThreeRowExactSupports` in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFirstFiberCollision.lean`.
The role mapping is:

* `commonCenter` = `H.centerAt source.1 source.2`;
* `oppositeCenter` = `H.centerAt Pρ.source₁ Pρ.source₁_mem_A`;
* `commonOutside`, `oppositeOutside`, and `sharedFourth` have the names of the
  corresponding outside/support roles (the shared fourth is the common fourth
  after the shared-arm identification).

The model retains exactly the three v1 licensed equalities:

* `d(firstCenter,commonOutside) = d(firstCenter,oppositeOutside)`;
* `d(commonCenter,commonOutside) = d(commonCenter,sharedFourth)`;
* `d(oppositeCenter,oppositeOutside) = d(oppositeCenter,sharedFourth)`.

It adds exactly these two source-proved disequalities:

* `FirstFiberCrossedThreeRowExactSupports.commonRow_cross_dist_ne` (source
  lines 898–930):
  `d(commonCenter,oppositeOutside) ≠ d(commonCenter,commonOutside)`;
* `FirstFiberCrossedThreeRowExactSupports.oppositeRow_cross_dist_ne` (source
  lines 932–961):
  `d(oppositeCenter,commonOutside) ≠ d(oppositeCenter,oppositeOutside)`.

Each disequality is encoded by its exact strict `<`/`>` split.  Thus each of
the 60 strict six-point cyclic orders has four sign arms `00`, `01`, `10`,
and `11`.  The metric assumptions are unchanged from v1: positive symmetric
pair distances, strict triangle inequalities on distinct triples, and both
strict Kalmanson inequalities for every increasing quadruple.

The three optional cross aliases remain an explicit admission issue:
`commonCenter = oppositeOutside`, `oppositeCenter = commonOutside`, and
`firstCenter = sharedFourth`.  Any nonzero alias bit pattern is recorded as
`blocked_missing_distinctness_for_strict_six_boundary`; no sign arm is run for
it.  Consequently the 240 replayed arms are all-distinct diagnostic orders,
not source-admitted boundary arms.  No boundary-order or injective/CCW lift is
assumed.

There is also a separate contextual admission tier from the enclosing
residual, which is not silently attributed to the standalone `E` structure.
In the orientation used by the crossed constructors, lines 1275–1276 require
`H.centerAt source.1 source.2 ∈ S.capInteriorByIndex S.oppIndex1`; lines
1162–1170 pass the corresponding `Q.source_not_mem_firstCap` and
`Q.otherOutsidePoint_not_mem_firstCap` facts into the crossed-row constructor.
Since `capInteriorByIndex ⊆ capByIndex`, this excludes the contextual alias
`commonCenter = oppositeOutside`.  The other two optional aliases remain
unresolved.  The baseline census deliberately keeps all three optional bits
and reports this contextual tier separately in `results/summary.json`.

## Reproducibility and fail-closed replay

Run from the repository root:

```text
uv run scratch/p97-consumer-first/freshthird_crossed_shared_fourth_v2_cross_inequalities/census.py
```

The producer writes portable SMT-LIB2 files and independently replays every
file with Z3 and cvc5.  Any UNKNOWN, timeout, process failure, or status
disagreement aborts the census.  The controls run first and are expected to
be SAT (metric equalities without Kalmanson) and UNSAT (the v1 full first-order
strict-Kalmanson control); both controls matched in both solvers.

## Results

The full run has 60 orders × 4 signs = 240 all-distinct arms, plus 420
blocked alias/order admissions.  All 240 replays matched exactly, with no
UNKNOWN:

* 190 UNSAT;
* 50 SAT survivors;
* sign counts among survivors: `00`: 10, `01`: 14, `10`: 14, `11`: 12;
* exact Z3/cvc5 replays: 240/240.

The survivor classification is by order index and the two-bit cross-sign
motif in `results/summary.json` and per-row in `results/census.json`.  The
smallest recurring survivor motif is sign `00` (10 survivors); all four strict
sign motifs recur, so the two source non-equalities plus strict metric/
Kalmanson arithmetic do not close the arm.  The most frequent simple
positional feature is that `firstCenter` is adjacent to at least one of the
other two centers in the cyclic order (30 of 50 survivors); this is an
empirical order statistic, not a source boundary theorem.

Files:

* `census.py` — reproducible producer and independent fail-closed replay;
* `artifacts/*.smt2` — 240 sign arms and two control inputs;
* `results/census.json` — complete admissions, orders, signs, models, and statuses;
* `results/summary.json` — compact counts and survivor motifs.
