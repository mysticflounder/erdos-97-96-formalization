# Three-row reverse-pair pruning adapter audit

Date: 2026-07-17

Status: **ROUTE CORRECTION AND CONDITIONAL API DESIGN.  THE 1,224 FINITE
REJECTIONS COMPRESS TO TWO SOURCE-INDEXED PAIR-DISJOINTNESS LEMMAS; NO
GENERATED 1,224-CASE LEAN TABLE IS NEEDED.  HOWEVER, THE COMMON ANCHORED
BOUNDARY ORDER USED BY THE FINITE AUDIT IS NOT CURRENTLY PRODUCED BY
`K + period = 3 + all-reverse`.  NO PRODUCTION THEOREM OR `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/cycle-three-rows-pruning-adapter/`.  It did not edit
production Lean, plan documents, blueprint state, `ShellCurvature`,
`surplusM44`, the card-five lane, or protected 555/654 files.  No Lean or Lake
build was run while the user-owned `ShellCurvature` lane is active.

## Required theorem-bank preflight

Before proposing a new finite or order lemma, this audit checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed searches were run for three two-point set unions, pairwise-distinct
two-point supports, strict Kalmanson overlap, and convex cyclic-order distance
inequalities.  The nearest current facts are the generic Kalmanson inequalities
and their two-row shared-pair consumer in
`ATail/CapCrossingKalmanson.lean`.  No theorem-bank entry proves the three-pair
normal form or supplies the missing common boundary order.

The unrelated sibling `C5D3B.shortCap_union_card_eq_six_of_pair_inter` and
`shortCap_inter_singleton_or_pair_union_card_of_mem_minimal_u3` hits concern a
different short-cap/U3 surface and do not instantiate these reverse rows.

## Exact current inputs

The current source-clean scratch chain already provides the following facts.

### Per-row exact support data

In
`scratch/atail-force/exact-five-reverse-membership-closure/ReverseMembershipClosure.lean`:

- `successor_actualBlocker_mem_physicalCapInterior` (line 133);
- `successor_actualCriticalSupport_inter_physicalCap_eq_pair` (line 182); and
- `successor_actualCriticalSupport_outside_physicalCap_card_eq_two` (line 236).

Thus the row indexed by `i` has center `reverseRowCenter K i`, contains the
adjacent cycle sources, and has exactly two remaining support points outside
the physical cap.

In
`scratch/atail-force/exact-five-reverse-outside-pair-producer/ReverseOutsidePairProducer.lean`:

- `reverseOutsidePair` (line 51);
- `reverseOutsidePair_card_eq_two` (line 82);
- `reverseOutsidePair_subset_complement` (line 99); and
- `reverseOutsidePair_injective` (line 202).

Write these three period-three pairs as

```text
P0 = reverseOutsidePair K i0
P1 = reverseOutsidePair K i1
P2 = reverseOutsidePair K i2.
```

They have cardinality two and are pairwise unequal.

### Per-row order data

In
`scratch/atail-force/reverse-shell-curvature-adapter/ReverseShellCurvatureAdapter.lean`:

- `ReverseRowGlobalBlockStraddle` (line 72) and
  `nonempty_reverseRowGlobalBlockStraddle` (line 98); and
- `ReverseRowCyclicRoles` (line 221) and
  `nonempty_reverseRowCyclicRoles` (line 295).

For each individual row, these put its two same-cap sources on opposite sides
of its blocker and its two outside points in the complementary middle arc.

These theorems are **per-row**.  Each construction obtains a
`CGN.StrictCapBlockData` existentially and re-cuts the boundary at that row's
blocker.  They do not return one shared boundary enumeration with the six
period-three source/blocker roles in a fixed common order.

### Current geometric consumers

In `lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean`:

- `dist_add_dist_lt_diagonal_sum_of_ccw` (line 240);
- `complementary_dist_add_dist_lt_diagonal_sum_of_ccw` (line 273); and
- `false_of_two_selected_rows_shared_late_pair` (line 427).

The first two are sufficient for the proposed direct pointwise exclusions.
The last one is the same geometry after choosing a cut with both centers
before the two shared support points.

## Route-correction finding

The finite audit fixed the chiral cap word

```text
o, left, q0, c0, c2, q1, c1, q2, right
```

and then enumerated only placements and identifications of the outside roles.
That word occurs in the exact directed-cycle regression, but no current theorem
derives it from

```text
K : PhysicalActualCriticalOmissionCycle H profile
hperiod : K.period = 3
hreverse : all reverse memberships.
```

In particular, the schematic signatures in
`cycle-three-rows-kalmanson/REPORT.md` that take only `K`, `hperiod`, and
`hreverse` are too strong as currently written.  Promoting either signature
unchanged would silently assume a common anchored order not present in its
hypotheses.

This is not repaired by `ReverseRowCyclicRoles`: three independent row cuts do
not determine their simultaneous common order.

## The finite certificate collapses to two overlap exclusions

`analyze_certificate_surface.py` reads the independently verified
`cycle-three-rows-kalmanson/results.json` and classifies all 1,224 ordinal
UNSAT cores.  The exact split is:

| canceled row-radius classes | cores |
|---|---:|
| row 0 and row 2 | 696 |
| row 1 and row 2 | 528 |

The inequality split is 588 `K1` and 636 `K2`.  There are no other
cancellation types.  Every rejected case is one of four placements of a
single common target relative to the same two row centers and their already
common cap source.

Mathematically, the 1,224 cases say only:

```text
Disjoint P0 P2
Disjoint P1 P2.
```

For example, a hypothetical `x in P0 inter P2` makes both blocker rows
centered at `c0` and `c2` contain the pair `{q0,x}`.  In the audited cap order,
`q0` lies before both centers and `x` lies outside the cap block.  Depending on
which side of the block contains `x`, one of the two current strict Kalmanson
inequalities has equal left and right sums after the two row-radius rewrites.
The row-1/row-2 case is identical with common cap source `q2`, which lies after
both centers.

Therefore a generated 1,224-row Lean table would obscure the mathematics and
create a larger trust/replay surface than necessary.  The exact computation is
useful discovery evidence for these two lemmas, not the intended final proof.

## Narrowest source-faithful conditional packet

The common-order hypothesis should be explicit until it has a producer.  The
smallest useful packet is schematically:

```lean
abbrev AllReverseMembership
    (K : PhysicalActualCriticalOmissionCycle H profile) : Prop :=
  ∀ i : Fin K.period,
    (K.source i).1 ∈
      (H.selectedAt (K.source (K.successorIndex i)).1
        (PhysicalVertex.mem_A
          (K.source (K.successorIndex i)))).toCriticalFourShell.support

structure AnchoredPeriodThreeReverseBoundaryOrder
    (K : PhysicalActualCriticalOmissionCycle H profile) : Type where
  i0 i1 i2 : Fin K.period
  successor_i0 : K.successorIndex i0 = i1
  successor_i1 : K.successorIndex i1 = i2
  successor_i2 : K.successorIndex i2 = i0

  block : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2)
  q0 c0 c1 c2 q2 : Fin block.m

  q0_point : block.L.points q0 = (K.source i0).1
  q2_point : block.L.points q2 = (K.source i2).1
  c0_point : block.L.points c0 = reverseRowCenter K i0
  c1_point : block.L.points c1 = reverseRowCenter K i1
  c2_point : block.L.points c2 = reverseRowCenter K i2

  q0_lt_c0 : q0 < c0
  q0_lt_c2 : q0 < c2
  c1_lt_q2 : c1 < q2
  c2_lt_q2 : c2 < q2
```

This is strictly weaker than storing the whole fixed word: it records only the
four inequalities used by the two overlap exclusions.  It is also honest
about the missing input.  A future construction may instead return the
orientation-reversed packet and transport it through a proved reflection
adapter; reflection must not be silently quotiented.

The conditional geometric API is then:

```lean
theorem reverseOutsidePair_disjoint_zero_two
    (P : AnchoredPeriodThreeReverseBoundaryOrder K)
    (hreverse : AllReverseMembership K) :
    Disjoint (reverseOutsidePair K P.i0)
      (reverseOutsidePair K P.i2)

theorem reverseOutsidePair_disjoint_one_two
    (P : AnchoredPeriodThreeReverseBoundaryOrder K)
    (hreverse : AllReverseMembership K) :
    Disjoint (reverseOutsidePair K P.i1)
      (reverseOutsidePair K P.i2)
```

Each proof is pointwise.  Extract `x` from both outside pairs, use
`reverseOutsidePair_subset_complement` to locate it outside `P.block`, split on
the two sides of the block, invoke one current Kalmanson inequality, and rewrite
with the two exact critical-shell radius equalities.  There is no generated
certificate and no new geometric conjecture beyond the explicit order packet.

## Pure finite-set consumer

The remaining cardinality theorem should be generic and independent of P97:

```lean
theorem five_le_card_union_three_pairs
    {α : Type*} [DecidableEq α]
    (P0 P1 P2 : Finset α)
    (h0 : P0.card = 2) (h1 : P1.card = 2) (h2 : P2.card = 2)
    (h01 : P0 ≠ P1)
    (h02 : Disjoint P0 P2) (h12 : Disjoint P1 P2) :
    5 ≤ ((P0 ∪ P1) ∪ P2).card

theorem card_inter_zero_one_eq_one_of_union_three_pairs_card_eq_five
    ...
    (hcard : ((P0 ∪ P1) ∪ P2).card = 5) :
    (P0 ∩ P1).card = 1
```

The proof uses only `Finset.card_union_add_card_inter` and
`Finset.card_union_of_disjoint`:

1. two unequal two-point sets have union cardinality at least three;
2. their union is disjoint from `P2`;
3. adding the two points of `P2` gives at least five; and
4. equality at five forces `card (P0 inter P1) = 1`.

Specializing with `reverseOutsidePair_card_eq_two`,
`reverseOutsidePair_injective`, and the two geometric disjointness lemmas gives
the audited normal form:

```text
card (P0 union P1 union P2) >= 5;
at card 5, only the P0/P1 one-point overlap remains.
```

## Dependency and consumer map

```text
K + hreverse + period-three cycle indices
  -> existing per-row exact support/cap split
  -> existing pair card-two + pair injectivity

MISSING common shared-boundary order producer
  -> AnchoredPeriodThreeReverseBoundaryOrder
  -> two current Kalmanson applications per disjointness lemma
  -> Disjoint P0 P2 and Disjoint P1 P2
  -> generic Finset arithmetic
  -> union card >= 5 / card-five P0-P1 overlap normal form
  -> future Euclidean/MEC or global critical-map parent closer
```

There is no existing production theorem that consumes this union-cardinality
normal form to close the all-reverse parent.  Its immediate honest consumer is
the next Euclidean/MEC or retained-critical-map branch split, which has not yet
been formalized.  Consequently this adapter should not be promoted merely to
add a source-clean theorem.  Promotion becomes load-bearing when either:

1. the common-order producer and the next parent consumer land together; or
2. the direct all-reverse proof uses the two disjointness lemmas inline.

## Exact remaining proof work

1. **Shared boundary extraction.** Construct one
   `CGN.StrictCapBlockData` and locate all three sources and blockers in it.
   This is routine membership/index extraction from existing facts.
2. **Orientation/order classification.** Prove which transition orientation
   the period-three cycle has relative to the physical-cap boundary.  Produce
   the four inequalities in the conditional packet, or split into the proved
   reflected alternative.  This is the real missing adapter; the current
   per-row straddle lemmas do not prove it.
3. **Two pointwise Kalmanson exclusions.** Prove the two disjointness lemmas.
   Their geometry is already in production; only block-side and shell-rewrite
   plumbing remains.
4. **Generic Finset lemma.** Prove the two small cardinality statements.
5. **Wire an immediate parent consumer.** Use the result to split the remaining
   Euclidean/MEC/global-critical surface into the five-target exceptional
   overlap and six-distinct cases.  This pruning does not itself yield
   `False`.

No solver certificate, `native_decide`, or generated Lean payload is required
for steps 3--4.  If step 2 is later handled by finite classification, its
checker must cover the source/blocker common order itself; replaying only the
outside-role table from the existing audit would repeat the current gap.

## Validation status

The report helper can be replayed with:

```text
uv run scratch/atail-force/cycle-three-rows-pruning-adapter/analyze_certificate_surface.py
```

It is an exact parser of the already independently verified finite results,
not a Lean proof.  No Lean/Lake command was run in this lane.
