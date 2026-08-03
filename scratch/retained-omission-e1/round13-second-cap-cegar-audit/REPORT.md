# Round 13: second-cap two-step CEGAR audit

## Scope and verification limit

Read-only source/artifact audit for the live, open Lean target
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`.
No Lean/Lake build, solver run, generator run, or production-source edit was
performed.  All UNSAT statements below are therefore **external evidence about
the recorded finite relaxation**, never closure of the Lean target.

The live producer is source-proved in
`ATail/RetainedMatchingCommonDeletionNormalization.lean:73-147`:
from the reverse-shell/first-cap equality and a large second cap it selects
`f` in the strict second cap, outside the deleted source's exact critical row,
and supplies `CommonDeletionTwoCenterPacket ... f ... blocker(d)`.
`RetainedMatchingCommonDeletionCycle.lean:360-438` packages this as the walk
`k -> d -> f`; its exact endpoint partition is `sourceReturn`,
`endpointCriticalFiber`, or `threeDistinctBlockers` (`:243-285`).

## 1. Existing exact-15 constraints: included versus missing

The frozen schema-v3 exact-15 matrix is the 288-case run in
`round5-general-cegar/artifacts/20260801T215344.210768Z-matrix-pid66759/`.
It fixes `(6,6,6)` caps and strict interiors
`I1={0,1,2,3}`, `I2={4,5,6,7}`, `I3={8,9,10,11}`.  It includes the global
metric relaxation, exact S6/D44 apex profiles, full critical rows, pair-centre
multiplicity, no-all-apex shell, overlap, and cyclic-alternation constraints.

Its normal-form packet construction does encode two source-tagged deletion
packets:

* `oriented`: deletes `d` with retained source `k`, hence uses the critical
  blocker of `k` as its second centre;
* `fresh`: deletes `f` with retained source `d`, hence uses the critical
  blocker of `d` as its second centre.

For each packet, `B2` is explicitly identified with the retained source's
full critical row, its deleted source is absent, both rows have four points,
and the centres are distinct.  The fresh normal form also requires
`k` in the reverse row, `f` outside it, and pins the reverse-row intersection
with the first closed cap to `{k,d}`.  These are sound portions of the
second-cap source theorem.

The decisive omission is domain-level: `Case.validate` and `all_cases` in
`round5-general-cegar/round5_cegar.py:78-105,820-827` require the fresh label
to lie in `INTERIORS[0] = I1`.  The Lean producer requires `f in I2`.
Consequently the exact-n15 matrix has no second-cap fresh case at all.

It also has no variables/cases for the walk endpoint relation.  In particular
it does not state either `block(f)=block(k)` (the critical-fiber branch) or
`block(f) != block(k)` (the three-distinct branch), and it has no explicit
endpoint outcome tag.  The paired arm does semantically instantiate the
two-source return `k -> d -> k`, but only under the different paired
common-deletion constructor; it is not evidence for the second-cap producer.

## 2. Smallest sound encoding delta

Keep all frozen schema-v3 constraints and add a separate `second_cap` arm;
do not reinterpret the present `fresh` arm.

1. Enumerate `k != d` in `I1` and `f in I2`.  Cap disjointness then proves
   `f != k,d`, so the second-cap branch cannot be `sourceReturn`.
2. Reuse the existing two packet slots exactly as
   `P0=(deleted=d, retained=k)` and `P1=(deleted=f, retained=d)`.  Retain the
   already encoded exact reverse-row/first-cap intersection `{k,d}`, `k` in
   that row, and `f` outside it; `P1.B2 = row(block(d))` then matches the
   producer's blocker-survival data.
3. Reify the selected critical blocker of each source (the present one-hot
   `block[q,c]` variables suffice) and branch only on the missing endpoint
   equality:
   * `endpointCriticalFiber`: assert `block[f,c] <-> block[k,c]` for every
     non-apex `c`.  To encode the Lean payload rather than only its equality,
     also name the required `RowHit` predicate and add its positive row-member
     literal; its exact source-level definition must be extracted before a
     solver claim is made.
   * `threeDistinctBlockers`: assert `block[f] != block[k]`; the two adjacent
     inequalities are already supplied by the two packet constructions
     (`block[k] != block[d]` and `block[d] != block[f]`).
   * `sourceReturn`: use the existing paired two-packet case with `f=k` and
     no new blocker clause.  It is incompatible with the new second-cap arm,
     but is needed if one wants one CEGAR family representing all three
     endpoint constructors.

No coordinate/EDM/rank strengthening is required for this faithful walk
encoding.  The only new mathematical input for the second-cap arm is exactly
the source theorem's cap placement and reverse-shell exclusion; endpoint
classification itself is a finite equality split on already selected
blockers.  The `RowHit` literal is necessary only when claiming coverage of
the full `endpointCriticalFiber` payload, not when modelling its equality
subcase.

## 3. The recorded 223 UNSAT results

The authenticated matrix summary reports 223 UNSAT and 65 UNKNOWN of 288
schema-v3 cases (600 s/case); its invocation and hash record are adjacent in
the same artifact directory.  Of the 223, 165 are `fresh_*` and 58 are
`paired_*`.

None of the 165 fresh UNSATs covers the Lean second-cap walk, because every
one fixes its third source in `I1`, not `I2`.  The 58 paired UNSATs cover only
the existing source-return-shaped paired constructor.  No recorded result
separates `endpointCriticalFiber` from `threeDistinctBlockers`, and no result
contains the required second-cap selector.  Thus the 223 results do **not**
cover all three endpoint cases, nor do they cover the new second-cap two-step
common-deletion branch.  They remain useful regression evidence for the
shared two-packet relaxation only.
