# Generic marginal-pair count audit

Date: 2026-07-15

Status: **KERNEL-CHECKED FINITE NEGATIVE FOR THE PAIR-COUNT/INCIDENCE
PROJECTION.  NOT A EUCLIDEAN OR K-A-PAIR COUNTERMODEL.**

## Question tested

Let `C` be the ordered surplus cap, let `O` be its first endpoint, and let
`T` be the off-cap marginal of an ambient exact class of cardinality four or
five at `O`.  Does global K4 plus the existing ordered-cap pair count force a
strict cap center `z` whose selected four-row contains two points of `T`?

The answer is **no at the finite interface used by the count**.  The file
`GenericMarginalPairCountCountermodel.lean` gives exact card-12 shadows for
both the card-four and card-five first-class arms.

This does not challenge the generic contradiction consumer.  In genuine
Euclidean data, two marginal points in a row at a second cap center trigger
`CapSelectedRowCounting.outsidePair_unique_capCenter`.  The model shows only
that the existing cardinality and pair-ledger facts do not force that
contradictory incidence.

## Bank and indexed-corpus preflight

The required sibling, legacy, and older-general theorem-bank registries were
searched before constructing the model.  The relevant current declarations
were:

- `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`;
- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `CapSelectedRowCounting.orderedCap_outsidePairCount_sum_le`;
- `CapSelectedRowCounting.orderedCap_card_add_four_le_choose_outside`;
- `CapSelectedRowCounting.orderedCap_selected_support_inter_card_eq_of_six_five`;
- `ATailCriticalPairFrontier.firstApex_marginal_inter_secondClass_card_le_one`;
  and
- `SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_two`.

The last theorem concerns a class centered at the Moser vertex opposite an
indexed cap.  It is not a selected row centered at a strict point of the
surplus cap and does not give marginal incidence.  The sibling
`p97-rvol` short-cap two-off-carrier declarations require the minimal M44/U2/U3
surface and concern points outside a short cap, not two points in this fixed
first-apex marginal.  None supplies the producer under the live hypotheses.

## Exact card-12 models

Both shadows use twelve labels, a six-point ordered cap

```text
C = {0,1,2,3,4,5},   B = A ∖ C = {6,7,8,9,10,11},
```

and strict centers `{1,2,3,4}`.  At all twelve abstract carrier centers the
model supplies one row of cardinality four, omitting its center; distinct rows
intersect in at most two points.  The six cap-center rows have exact cap-hit
counts

```text
1, 2, 2, 2, 2, 1.
```

Their outside-pair ledgers are pairwise disjoint.  They spend exactly ten
outside pairs, the lower count `m + 4` for `m = 6`, from the fifteen available
pairs in the six-point complement.

### Card-four arm

The abstract ambient first class and marginal are

```text
firstClass = {5,6,7,8},   T = {6,7,8}.
```

The first cap row is the whole four-class.  The cap-center outside hits are:

| center | outside hits | marginal hits |
|---:|---|---:|
| 0 | `{6,7,8}` | 3 |
| 1 | `{7,9}` | 1 |
| 2 | `{7,10}` | 1 |
| 3 | `{8,9}` | 1 |
| 4 | `{8,10}` | 1 |
| 5 | `{6,9,10}` | 1 |

Thus every strict row has exactly one marginal point.

### Card-five arm

The abstract ambient first class and marginal are

```text
firstClass = {5,6,7,8,9},   T = {6,7,8,9}.
```

The selected first row is `{5,6,7,8}`, a four-point subset of the five-point
ambient class.  The cap-center outside hits are:

| center | outside hits | marginal hits |
|---:|---|---:|
| 0 | `{6,7,8}` | 3 |
| 1 | `{6,10}` | 1 |
| 2 | `{7,10}` | 1 |
| 3 | `{8,11}` | 1 |
| 4 | `{6,11}` | 1 |
| 5 | `{9,10,11}` | 1 |

Again every strict row has exactly one marginal point.

## What “global K4” and “exact class” mean here

The shadows do satisfy the **all-center incidence projection** of global K4:
there is a four-point row at every one of the twelve centers, every row omits
its center, and all distinct row intersections have cardinality at most two.
The six rows used by the cap count are the restrictions of those all-center
row systems.

They also satisfy the **ambient exact-class cardinal projection** at the first
endpoint: cardinality four or five, center exclusion, one cap point, the stated
off-cap marginal, and containment of the chosen first four-row.

They do **not** assign Euclidean coordinates, positive radii, or actual
distance equalities.  Consequently they are not models of
`HasNEquidistantProperty 4`, `SelectedFourClass`, or ambient radius uniqueness
as metric predicates.  “Global K4” and “exact class” in this report always mean
the explicitly listed finite projections, not the full Lean structures.

## Exact omitted-field ledger

The countermodels omit the full-parent information that could couple a fixed
first-apex marginal to rows at other cap centers:

1. Euclidean equidistance and positive-radius realization of every abstract
   row;
2. convex/MEC and strict-cap-order geometry beyond the checked cap-hit and
   outside-pair consequences;
3. a `CriticalShellSystem`, source membership in blocker shells, and the
   deletion/cross-survival provenance of the live frontier; and
4. the second-apex/second-cap constraints and any theorem transferring them to
   marginal incidence at strict surplus centers.

In particular, this is not a countermodel to the K-A parent, robust packet, or
generic Euclidean sink.

The weakest purely combinatorial field that would eliminate these avoidance
rows is an aggregate marginal-incidence lower bound.  If `I` is the set of
strict cap centers, then

```text
|I| < Σ z ∈ I, |K_z ∩ T|
```

forces some `K_z` to contain at least two points of `T`.  The Lean theorem
`exists_row_with_two_target_points_of_aggregate_incidence` checks this exact
pigeonhole reduction.  Both card-12 shadows instead satisfy equality:

```text
|I| = 4 = Σ z ∈ I, |K_z ∩ T|.
```

Therefore the live lane needs a metric/critical/second-cap theorem that
produces **one extra strict-center marginal incidence**, or another field that
implies the same aggregate inequality.  Re-running the raw ordered-cap pair
count cannot distinguish these avoidance rows.

## Validation

The file was checked from `lean/` with Lean 4.27 using a 16 GB memory cap:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/generic-marginal-pair-count/GenericMarginalPairCountCountermodel.lean
```

All printed axiom sets are subsets of:

```text
[propext, Classical.choice, Quot.sound]
```

There is no `sorry`, `sorryAx`, production edit, `SurplusM44` edit, or full
project build in this result.
