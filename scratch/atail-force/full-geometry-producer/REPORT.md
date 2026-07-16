# Full-geometry K-A-PAIR producer audit

Date: 2026-07-14

Status: **KERNEL-PROVED TWO-CENTER CAPACITY NORMAL FORM; NO FRONTIER ARM
CLOSED.**

This lane is scratch-only.  It does not edit `SurplusM44`, production Lean,
the closure documents, or the live K-A-PAIR declaration.

## Verdict

The full MEC cap cover gives a sharp new radius-capacity theorem:

```text
two distinct positive K4 radii at a Moser apex
  -> opposite closed cap has at least six points.
```

Consequently a four- or five-point opposite cap admits only one positive K4
radius.  Its complete ambient selected class has cardinality exactly four in
the cap-four case and cardinality four or five in the cap-five case.

At the two-center level, if both non-surplus apices carry two distinct K4
radii then the carrier has at least fourteen points.  Hence every live packet
of cardinality at most thirteen has at least one non-surplus apex with a
unique four/five-point full filter.

This is a real full-geometry normalization, but it does **not** close any arm
of `CriticalPairFrontier`.  It does not force two first-apex class members to
have the same second-apex radius, and it does not align either actual
`CriticalShellSystem` blocker with a Moser apex, a usable surplus-cap point,
or a named live row.  Thus it produces neither K-A-PAIR's forbidden pair nor
one of the current unique-row consumer packets.

## Kernel-proved scratch declarations

`CapFiveApexRigidity.lean` proves, among other helpers:

```text
capInteriorByIndex_card_add_two

oppositeVertex_K4_radius_unique_of_capInterior_card_le_three

oppositeVertex_distinct_K4_radii_force_cap_card_ge_six

oppositeVertex_K4_unique_four_full_filter_of_cap_card_eq_four

oppositeVertex_K4_unique_four_or_five_full_filter_of_cap_card_eq_five

oppositeVertex_K4_unique_four_or_five_full_filter_of_cap_card_four_or_five

both_opposite_apices_distinct_K4_radii_force_card_ge_fourteen

card_le_thirteen_has_opposite_cap_card_four_or_five

card_le_thirteen_has_unique_small_opposite_apex_full_filter

card_twelve_has_unique_small_opposite_apex_full_filter
```

Every printed declaration closes under exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, custom axiom, `native_decide`, or trusted solver step.

## Proof mechanism

For a positive radius class `T` at the Moser vertex opposite cap `i`, the
arbitrary-packet cap cover and convex adjacent-cap one-hit bounds give:

```text
|T \ strictInterior(i)| <= 2.
```

Every K4 radius class has at least two points in that strict interior.  Two
distinct radii have disjoint selected classes, hence disjoint interior
contributions.  They therefore need at least four strict-interior points.
The closed cap contains exactly two more points than its strict interior, so
two distinct K4 radii force closed-cap cardinality at least six.

For cap four, the strict interior has cardinality two and every K4 class has
cardinality exactly four.  For cap five, the strict interior has cardinality
three and every K4 class has cardinality at most five.  In either case a
second K4 radius is impossible.

For two non-surplus apices, two distinct radii at both would force cap sizes
at least six and six.  Together with the at-least-five surplus cap and the
closed-cap sum identity this gives:

```text
5 + 6 + 6 <= |A| + 3,
```

hence `14 <= |A|`.

## What this gives on the live leaf

The result uses the actual `SurplusCapPacket`, `D.convex`, `D.K4`, and the
MEC-derived lower bounds.  It does not need `hNoM44` for the card-at-most-13
corollary.

At card 12 or 13, one can orient to a non-surplus apex whose complete K4
filter is unique and has cardinality four or five.  This matches the
full-filter shape of the terminal arm in the current ATAIL reductions.  It is
stronger than a selected-four witness because uniqueness is over every
positive ambient radius.

The missing coupling remains source-indexed.  For an actual frontier pair
`P.q,P.w`, the first atomic absent fact is one of the prescribed cross
deletion failures, for example:

```text
not HasNEquidistantPointsAt 4
  (D.A.erase P.w) (H.centerAt P.q P.q_mem_A).
```

That fact is equivalent, through the proved critical-row normal form, to the
directed cross incidence

```text
P.w in (H.selectedAt P.q P.q_mem_A).support.
```

To reach an existing immediate consumer, the producer must additionally
force the reverse cross incidence/common blocker or a usable blocker-cap
placement.  A closure-ready statement is therefore a choice-invariant
disjunction producing one of:

```text
* ExistsSurplusPairCriticalBlocker;
* CardFiveCapOrMutualFields; or
* a prescribed h4/h5 deletion failure that extends to one of the banked
  EdgeClosure/core sinks.
```

No current MEC, cap-count, full-filter, criticality, or live-row theorem
produces that source-to-blocker incidence.  Alternatively, forcing a second
positive K4 radius at the small apex would close immediately by the new
capacity theorem, but no live field produces such a radius either.

At cardinality fourteen and above, even the cap-capacity shortcut disappears:
both non-surplus caps may have size six.  The general K-A-PAIR declaration is
unbounded above, so the card-12/13 normal form cannot be promoted as a uniform
producer without a new global critical-row or iterative capacity argument.

## Countermodel adjudication

The proved statements were checked against the two sharp exact local models
already banked for this frontier.

### Card 13, cap profile `(6,5,5)`

`blocker-cap-geometry/exact_blocker_cap_countermodel.py --check` replays an
exact real-algebraic, strictly convex MEC configuration.  Each of the two
non-surplus apices has exactly one K4 radius and its class has cardinality
five, exactly as the new theorem predicts.  The chosen pair is co-radial at
the first apex but not at the second; its actual blocker is in an opposite
cap and the cross deletion survives.

This model omits global all-center K4 and a total `CriticalShellSystem`, so it
does not refute K-A-PAIR.  It does show that the new cap/full-filter conclusion
is compatible with the robust target-negating local packet.

### Card 12, cap profile `(6,4,5)`

`endpoint-blocker-geometry/analyze.py --check` replays an exact
real-algebraic, strictly convex MEC configuration.  The four-point-cap apex
has exactly one cardinality-four K4 class.  Deleting either chosen source
kills K4 there while preserving K4 at the other apex.  The first apex itself
is a legal common critical blocker for both sources.

Again the model omits global all-center K4 and the total critical map.  It
shows sharply why unique full-filter data does not eliminate the card-four
common-apex blocker arm.

The saved card-12 incidence shadows are also consistent with the theorem:
they store one exact selected row per center and do not assert a second K4
radius at a four/five-point cap.

## Textbook/MEC route

The locally ingested computational-geometry material does not supply the
missing bridge.  A `CriticalShellSystem.centerAt` is an arbitrary carrier
deletion blocker, not the center of a minimum enclosing disc of the carrier
or of the deleted carrier.  Its selected circle need be neither empty nor
enclosing; the exact card-13 model has carrier points strictly inside and
strictly outside the blocker circle.

Farthest-Voronoi, constrained minimum-disc, and deletion-boundary theorems
therefore require a new optimizer/enclosure hypothesis that is absent from
the live structures.  The closest convex cyclic-order lemma would only prove
a cross-deletion **survival** after an additional blocker arc-placement
producer, so it does not close the present arm.

## Search and validation

Before deriving the theorem, this lane checked the required P97 registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed `nthdegree docs search --lean` queries covered two-large-cap
obstructions, cap-interior multiplicity, apex K4 classes, deletion/MEC
bridges, and critical blockers.  No banked declaration produces the missing
source-indexed cross failure or optimizer bridge.

Direct Lean validation:

```text
cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/full-geometry-producer/CapFiveApexRigidity.lean
```

Result: exit 0, all printed axiom sets core-only.

Exact model validation:

```text
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/blocker-cap-geometry/exact_blocker_cap_countermodel.py \
  --check

UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/endpoint-blocker-geometry/analyze.py --check
```

Both checks pass.

## Rigor labels

- **PROVEN IN LEAN:** the one-apex radius-capacity theorem, cap-four/cap-five
  unique full filters, the two-apex cardinality-fourteen barrier, and the
  card-at-most-13 small-apex corollary.
- **EXACTLY REPLAYED LOCAL MODELS:** the `(6,5,5)` and `(6,4,5)` sharpness
  boundaries.
- **NOT PROVEN:** any prescribed cross-deletion failure, cross incidence,
  blocker-cap alignment, h4/h5 extension, or shared-radius pair from the live
  K-A-PAIR binders.
- **NOT CLAIMED:** closure of `CriticalPairFrontier`, K-A-PAIR, or any
  production-ready theorem placement.
