# Period-four/five shared-order extension audit

Date: 2026-07-17

Status: **BOUNDED EXACT ORDER-CELL AUDIT.  THE PERIOD-THREE POINTWISE
KALMANSON CONSUMER HAS A UNIFORM LOCAL-EXTREMUM FORM FOR EVERY PERIOD AT
LEAST THREE, BUT ITS PERIOD-THREE GLOBAL CONSEQUENCE DOES NOT EXTEND
UNCHANGED TO PERIOD FOUR OR FIVE.  AFTER THE UNIFORM GEOMETRY, 2 OF 6
NORMALIZED PERIOD-FOUR SOURCE ORDERS AND 6 OF 24 NORMALIZED PERIOD-FIVE
SOURCE ORDERS RETAIN ONLY TWO NONADJACENT DISJOINTNESS CONSTRAINTS.  NO
PRODUCTION THEOREM OR `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/period45-shared-order-extension/REPORT.md`.  It did not
edit Lean, production files, shared plan documents, blueprint state,
`ShellCurvature`, `SurplusM44`, protected census files, or git state.  No Lean
or Lake command was run.

## Required preflight

The audit checked the theorem-bank registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches covered period-four/five omission cycles, shared cap
orders, local extrema, reverse-row straddles, and outside-pair overlaps.  No
banked theorem supplies a period-four/five shared-order closer.  The nearest
current source surface is still the exact-five all-reverse packet in
`exact-five-reverse-outside-pair-producer/ReverseOutsidePairProducer.lean`:

- `reverseOutsidePair_card_eq_two`;
- `reverseOutsidePair_subset_complement`;
- `reverseRowCenter_injective`;
- `reverseOutsidePair_injective`; and
- `nonempty_reverseRowCapStraddle`.

Production `PhysicalActualCriticalOmissionCycle.period_le_five` and the
checked all-reverse lower bound leave precisely periods 3, 4, and 5.

## Verdict: one uniform local theorem, different global combinatorics

Write

```text
q_i = K.source i
c_i = reverseRowCenter K i
P_i = reverseOutsidePair K i.
```

The row `i` has center `c_i`, its two cap-shell points are `q_i` and
`q_(i+1)`, and its exact outside-cap residual is the two-set `P_i`.  In one
shared strict cap order, the proved row straddle says

```text
q_i < c_i < q_(i+1)   or   q_(i+1) < c_i < q_i.      (S_i)
```

For one source `q_i`, the two incident rows are `i-1` and `i`.  If `q_i` is a
strict local minimum or maximum among its two cycle neighbours in the shared
cap order, `(S_(i-1))` and `(S_i)` put `c_(i-1)` and `c_i` on the same side of
`q_i`.  The pointwise theorem from
`shared-order-pointwise-consumer/REPORT.md` then applies to any hypothetical
`x in P_(i-1) inter P_i`: both rows make `{q_i,x}` co-radial at two distinct
same-side cap centers.  Therefore

```text
LocalExtremum(q_i)  ->  Disjoint P_(i-1) P_i.        (E_i)
```

This is the correct uniform metric theorem.  It works without change for
periods 3, 4, and 5 (indeed for any period at least 3).  It does not require
enumerating the relative positions of the other blockers.

What is special about period three is the global consequence.  The global
minimum and maximum source are necessarily adjacent in a 3-cycle.  Thus the
two applications of `(E_i)` share one outside pair, giving the two
disjointness facts used by the period-three union-at-least-five argument.
For periods 4 and 5, the minimum and maximum can be nonadjacent and no third
local extremum need exist.  Then the two forced disjointness facts concern
four different `P_i` and do not force five outside vertices.

## Source-faithful generic packet

The shared-order producer should be period-parametric rather than duplicating
the period-three six-role record.  Schematically, the smallest honest packet
is:

```lean
structure ReverseCycleSharedCapOrder
    (K : PhysicalActualCriticalOmissionCycle H profile) : Type where
  block : CGN.StrictCapBlockData D.A
    (S.capByIndex S.oppIndex2)
  sourceIndex : Fin K.period -> Fin block.m
  blockerIndex : Fin K.period -> Fin block.m
  source_point : forall i,
    block.L.points (sourceIndex i) = (K.source i).1
  blocker_point : forall i,
    block.L.points (blockerIndex i) = reverseRowCenter K i
  source_injective : Function.Injective sourceIndex
  blocker_injective : Function.Injective blockerIndex
  straddle : forall i,
    (sourceIndex i < blockerIndex i /\
      blockerIndex i < sourceIndex (K.successorIndex i)) \/
    (sourceIndex (K.successorIndex i) < blockerIndex i /\
      blockerIndex i < sourceIndex i)
```

The theorem should then use a predecessor index (obtained from the finite
permutation `K.successorIndex`) and state:

```lean
theorem reverseOutsidePair_disjoint_incident_of_localExtremum
    (P : ReverseCycleSharedCapOrder K)
    (hreverse : AllReverseMembership K)
    (i : Fin K.period)
    (hi : the sourceIndex of i is a strict local minimum or maximum
      relative to its predecessor and successor) :
    Disjoint (reverseOutsidePair K (predecessor i))
      (reverseOutsidePair K i)
```

The record deliberately does **not** assert that a blocker differs from every
cycle source.  Current source proves only that `c_i` differs from the two
incident sources and that distinct rows have distinct blocker centers.  A
blocker may still equal a nonincident source.  Any generic packet which makes
all `q_i,c_i` distinct would be overstrong.

The outside-pair cardinality, complement membership, pair injectivity, and
row-radius equalities should remain theorems derived from `K + hreverse`, not
duplicated record fields.

## Exact finite order/map cell counts

The following is an exact exhaustive combinatorial enumeration, not a
kernel-checked theorem.  A cell records the linear cap order of the labeled
cycle sources and blocker centers subject only to:

1. the `q_i` are distinct;
2. the `c_i` are distinct;
3. `c_i` lies strictly between `q_i` and `q_(i+1)`; and
4. `c_i` may equal a nonincident `q_j`, because current source does not
   exclude that identification.

For each source permutation, every blocker was assigned either to an open
gap between consecutive source positions or to an interior nonincident
source.  Assignments to source positions were required to be injective; if
`k` blockers occupied the same open gap, their `k!` linear orders were
counted.  This gives:

| period | labeled source orders | all roles distinct | source-faithful cells allowing `c_i = q_j` |
|---:|---:|---:|---:|
| 3 | 6 | 24 | 30 |
| 4 | 24 | 656 | 1,224 |
| 5 | 120 | 17,120 | 45,650 |

These are raw anchored labeled counts.  No reflection quotient is used, and
no rotation quotient should be silently applied to the retained `K.start`
interface.

For theorem discovery one may instead choose the leftmost cycle source as a
temporary index `i0`.  That normalization divides the raw count by the
period, without asserting that the production anchor moved:

| period | normalized source-order maps | all roles distinct | source-faithful cells |
|---:|---:|---:|---:|
| 3 | 2 | 8 | 10 |
| 4 | 6 | 164 | 306 |
| 5 | 24 | 3,424 | 9,130 |

The rapid growth is not a reason to generate a 9,130-case proof.  The local
extremum theorem quotients away every blocker placement not used by the
pointwise consumer.

## Immediate geometry/counting reduction

Every cyclic ordering of distinct source ranks has at least two local
extrema: its global minimum and maximum.  The normalized source-order census
is:

| period | local extrema | min/max adjacent? | source-order maps |
|---:|---:|:---:|---:|
| 4 | 2 | no | 2 |
| 4 | 2 | yes | 2 |
| 4 | 4 | yes | 2 |
| 5 | 2 | no | 6 |
| 5 | 2 | yes | 2 |
| 5 | 4 | no | 6 |
| 5 | 4 | yes | 10 |

Two consecutive local extrema give

```text
Disjoint P_(i-1) P_i
Disjoint P_i P_(i+1).
```

All three pairs have cardinality two and are distinct.  If their union had
only four points, there would be a unique two-set in that four-set disjoint
from `P_i`, forcing `P_(i-1) = P_(i+1)` and contradicting
`reverseOutsidePair_injective`.  Hence consecutive extrema force at least
five outside targets.

Consequently:

- period 4: 4 of the 6 normalized source-order maps force outside-pair union
  cardinality at least 5;
- period 5: 18 of the 24 normalized source-order maps force outside-pair
  union cardinality at least 5;
- the only residual source-order type has exactly two nonadjacent extrema.

Counting the full source-faithful blocker cells rather than only source maps,
the residual has:

| period | normalized source-faithful cells | two-extrema/nonadjacent residual |
|---:|---:|---:|
| 4 | 306 | 34 |
| 5 | 9,130 | 228 |

In the all-distinct-role submodel the corresponding residual counts are 20
of 164 and 112 of 3,424.

This reduction is **not a contradiction**.  Four distinct outside points can
support four or five distinct two-sets while satisfying two nonadjacent
disjointness requirements.  For example, on `{a,b,c,d}`, the pairs
`{a,b}`, `{c,d}`, `{a,c}`, and `{b,d}` already realize two independent
disjoint pairs.  Current source supplies no upper bound of four on the cap
complement, so even the union-at-least-five cells do not close the branch by
themselves.

## Bounded next target

The period-three theorem should therefore be refactored into the uniform
local-extremum disjointness lemma, but the period-three global union theorem
should remain period-specific.  For periods 4 and 5, the next finite audit
need only inspect the residual order type:

```text
exactly two local extrema, nonadjacent in the transition cycle,
with two independent disjoint adjacent-row outside-pair constraints.
```

Any further consumer must use more than the existing pair-cardinality,
pair-injectivity, and pointwise same-side Kalmanson facts: for example the
full strict-Kalmanson linear system, a return incidence to the retained
frontier pair, or additional exact-shell/MEC information.  Broad enumeration
of all 306 or 9,130 shared-order cells would redo cases already removed by
the uniform local theorem.

## Epistemic ledger

| Claim | Status |
|---|---|
| Existing all-reverse rows have exact two-point outside residuals and injective row-center/pair maps | **CHECKED SCRATCH SOURCE** |
| Every row blocker straddles its adjacent source pair | **CHECKED SCRATCH SOURCE** |
| Shared fixed-block producer for periods 3--5 | **SOURCE-FAITHFUL STATEMENT; NOT YET PROVED IN LEAN** |
| Local-extremum incident-pair disjointness | **PAPER REDUCTION TO THE EXISTING POINTWISE CONSUMER** |
| Raw and normalized order/map counts in this report | **EXACT EXHAUSTIVE FINITE ENUMERATION; NOT KERNEL-CHECKED** |
| Period 4/5 full closure from these facts | **NOT PROVED; RESIDUAL CELLS REMAIN** |
