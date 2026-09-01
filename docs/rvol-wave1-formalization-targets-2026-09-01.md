# RVOL Wave 1 — Audited Formalization Targets

**Date:** 2026-09-01
**Status:** repaired implementation checkpoint after mathematical, Lean-reuse,
and evidence-custody audits

## Executive verdict

Wave 1 did not establish a source-level contradiction or a new positive
geometric lemma. It produced three different kinds of follow-up work:

1. a source-interface extension over existing carrier infrastructure;
2. a self-contained cyclic incidence obstruction that is proved on paper but
   not yet kernel checked; and
3. a finite 14-point witness that has been independently enumerated but is not
   yet represented by a governed proof artifact.

These targets are off the current publish spine. Formalizing them must not add
new sorry-bearing declarations or rewire the live target until an immediate
consumer has been identified.

## Shared combinatorial core

Introduce a deliberately weak `AbstractRowSystem` describing only data shared
by the source projection, the cyclic construction, and finite regression
witnesses. Its core should contain a finite center type, a row map, and an
optional or separately supplied blocker map.

Do **not** require any of the following as structure fields:

- blocker-map bijectivity;
- the seven-source mutual-omission condition;
- metric, cap, or order data; or
- source-faithful realizability.

Those are separate predicates or instance theorems. In particular, the cyclic
model's blocker map is bijective, while the 14-point witness's displayed map
has repeated values and the source critical-shell map is not known to be
bijective.

## P0 — extend the source-faithful carrier bridge

Do not introduce parallel `ARowView` and `CriticalSectionView` wrappers.
`GeneralCarrierBridge` already exports the central source-backed data:

- `rowPattern`, `mem_rowPattern_iff`, and `image_rowPattern_eq_support`;
- `rowPattern_card`;
- `blockerLabel` and `blocker_row_support_eq_shell`;
- `source_mem_blocker_row`; and
- `exactAt_blocker`.

Extend that interface only where a concrete consumer requires a missing fact:

1. a generic pair-codegree theorem over `rowPattern`;
2. a support-digraph predicate and strong-connectivity export; and
3. a genuine `MetricCapView` supplied only from metric/cap/order hypotheses.

If import cost becomes material, extract the small row/blocker core from
`GeneralCarrierBridge` into a lighter module. Do not duplicate its definitions.
Fold the former P3 support-graph work into this extension.

## P1 — uniform cyclic incidence obstruction

For `9 ≤ n`, take the carrier to be `ZMod n` and define

```text
D = {1, 2, 4, 8}
U(c) = c + D
beta(q) = q - 1
```

Formalize, as separate theorems rather than mandatory structure fields:

```text
|U(c)| = 4
c ∉ U(c)
beta(q) ≠ q
q ∈ U(beta(q))
|U(c) ∩ U(d)| ≤ 2                    when c ≠ d
#{c | a ∈ U(c) and b ∈ U(c)} ≤ 2     when a ≠ b
every nonempty U-closed set is univ
Function.Bijective beta
```

For `15 ≤ n`, strengthen both incidence bounds to at most one.

The paper proof uses the twelve nonzero ordered differences between
`{1,2,4,8}`. They are the distinct integers `±1, ±2, ±3, ±4, ±6, ±7`.
A residue modulo `n` has at most two representatives in `[-7,7]` for `9 ≤ n`
and at most one for `15 ≤ n`. Closure follows from `c + 1 ∈ U(c)` and the fact
that `+1` generates `ZMod n`.

This is a mathematical obstruction to deriving a contradiction from the cheap
row axioms alone. It is not a source model and does not satisfy the missing
critical-shell or Euclidean hypotheses.

## P2 — 14-point finite regression witness

Define `U : Fin 14 → Finset (Fin 14)` by

```text
0:  {6,9,11,12}       7:  {0,1,2,4}
1:  {3,7,10,11}       8:  {1,2,3,5}
2:  {0,8,10,13}       9:  {2,3,4,6}
3:  {7,8,9,10}       10:  {0,3,4,5}
4:  {2,8,9,11}       11:  {1,4,5,6}
5:  {9,10,12,13}     12:  {0,2,5,6}
6:  {8,11,12,13}     13:  {0,1,3,6}
```

and

```text
beta = [7,8,9,10,11,12,13,1,6,5,5,1,6,6].
```

The correct designated-source statement is about blocker rows:

```text
for distinct i,j < 7, not (j ∉ U(beta(i)) and i ∉ U(beta(j))).
```

It is false with raw rows `U(i)`: those rows have 17 mutually omitted pairs
among `0,...,6`. The blocker-row formulation has none.

Independent enumeration confirms row size, center exclusion, blocker-section
membership, row-intersection and pair-codegree bounds, and strong connectivity.
The historical “18-to-14 exact solve” has no retained witness-specific receipt,
so treat that phrase as provenance context rather than governed evidence.
Once `AbstractRowSystem` exists, formalize the literal witness with explicit
proofs or `decide`; do not use `native_decide` without a separate trust review.

## Evidence boundaries

The retained Wave-1 run reports 16 candidates and 16
`PARTIAL_SURVIVOR_CAP` outcomes. It is a generic A-row diagnostic, not a Card18,
metric, source-bridge, or UNSAT result. Replay checks exact row readback and
selected runner invariants but does not supply the missing source/metric bridge.
Repair runner custody and verifier fail-open behavior before treating a future
solver result as proof-carrying evidence.

The existing lane checkpoint also needs its `durable_paths` sorted before its
hygiene report can pass.

## Implementation order and acceptance gates

1. Define the weak shared `AbstractRowSystem` interface.
2. Formalize P1 as the fastest durable, arbitrary-`n` obstruction.
3. Extend `GeneralCarrierBridge` with the P0/P3 exports only when their immediate
   encoder consumer is ready.
4. Add P2 as a compact finite regression.

For every checkpoint: run the targeted Lean build, reject any new sorry-bearing
declaration, audit `#print axioms`, and keep the result off-spine unless a real
publish-spine consumer is established.

## Initial formalization checkpoint

The first checkpoint implements `AbstractRowSystem` and the cyclic row,
blocker, and system definitions. For every `9 ≤ n` it proves row cardinality
four, center exclusion, and the blocker-section property. It also proves the
blocker map bijective and, for every nonzero modulus, proves that every
nonempty support-closed set is the whole carrier.

The row-intersection and pair-codegree bounds are not part of this checkpoint;
they remain the next proof block and will be derived from the ordered-difference
fibers rather than asserted as fields of the shared interface.
