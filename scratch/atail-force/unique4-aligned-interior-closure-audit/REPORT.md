# Unique-four aligned-interior closure audit

Date: 2026-07-22

Status: **KERNEL-CHECKED SOURCE ADAPTERS; NO DIRECT TERMINAL. THE RETAINED
SECOND-APEX ROW IS AN OMISSION ROW, AND THE FIRST MISSING STEP IS A POSITIVE
CROSS-ROW OR TURN-DISJOINT OCCURRENCE.**

Scope: only

```text
scratch/atail-force/unique4-aligned-interior-closure-audit/
```

is modified. No exact-two distribution, carrier-cardinality-11 assumption,
production theorem, or closure-plan claim is used.

## Source-level contract correction

`AlignedInteriorFrontier R` now stores both the reselected strict pair and the
premise

```lean
3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
  S.capInteriorByIndex S.oppIndex1).card.
```

The field is populated in the three-hit arm of
`exactFour_twoStrict_or_alignedInteriorFrontier`. This corrects the contract at
its source; no compatibility wrapper remains.

## Required theorem-bank preflight

The audit searched the registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered exact-four three-hit cap
distributions, selected rows after double deletion, shared-pair Kalmanson
consumers, shell-curvature terminals, and alternative M44 packets. The search
found the existing consumers discussed below, but no producer for the missing
positive occurrence.

## Strongest unconditional checked producer

The theorem

```lean
nonempty_alignedApexRowSurface
```

constructs, from `P : AlignedInteriorFrontier R`, an

```lean
AlignedApexRowSurface P
```

with the following source-proved data.

1. `P.firstApexRow` is the complete exact-four first-apex class.
2. Its strict first-opposite-cap intersection has cardinality at least three.
3. A selected four-point row at `S.oppApex2` exists after deleting the aligned
   pair and is lifted back to `D.A`.
4. That second row omits both aligned points.
5. The second row meets the strict part of the first row in at most one point.
6. The two selected rows meet in at most two points, by the distinct-center
   two-circle bound.

This is the strongest direct two-apex row surface currently derivable from the
aligned packet. Its polarity is important: it gives omission and intersection
upper bounds, not a shared-support occurrence.

The same file also proves:

- `alignedFirstOppositeCap_card_ge_five`: three strict hits force the physical first
  opposite closed cap to have at least five vertices;
- `alignedFixedPacket_not_isM44`: the displayed packet is already not M44, without
  using the global `noM44` field;
- `AlignedApexRowSurface.exists_commonBoundary_curvature`: both retained rows
  carry their two transported strict quarter-turn arcs in one global boundary
  chart; and
- `strictPairMinimalDeletion_center_ne_secondApex`: the aligned
  double-deletion witness rules out the second apex as the fresh center chosen
  by strict-pair minimality.

Warnings-as-errors re-elaboration passes. Every printed axiom closure is
exactly:

```text
propext, Classical.choice, Quot.sound
```

The affected scratch import chain was re-elaborated after changing the source
structure:

```text
UniqueFourClassCapDistribution.lean
UniqueFourTurnDisjointSourceOccurrence.lean
AlignedInteriorClosureAudit.lean
```

## Consumer audit

### Exact-row and equal-radius routes

The first row is exact and the second row is an actual selected class, but the
second row was chosen specifically to avoid the aligned pair. Existing local
exact-row terminals require positive incidences not present here.

Applying the checked strict-pair minimality split to `P.residual` remains
useful:

- a singleton gives a named exact critical shell;
- an equal-radius whole-pair deletion gives a third strict-cap center, a
  radius class of cardinality at least five, and full deletion robustness; and
- a distinct-radius whole-pair deletion gives two support-disjoint concentric
  exact shells.

The new consequence `center ≠ S.oppApex2` sharpens all three arms. It does not
produce a second center through a named pair, a shared row pair, or an existing
terminal packet.

### Kalmanson

`false_of_two_selected_rows_shared_late_pair` would close immediately from two
distinct common support points in the required cyclic position. The checked
surface proves only

```text
|first row ∩ second row| ≤ 2,
```

and gives no lower bound. The smaller missing Kalmanson occurrence is therefore
source-positive:

> find distinct `a,b` in both selected rows and prove that the two row centers
> and `a,b` occur in the cyclic order required by
> `false_of_two_selected_rows_shared_late_pair`.

Alternatively, one needs a selected row centered at a first-class member which
contains two later first-class members, as identified by the earlier class-cap
terminal audit. Neither occurrence follows from the aligned fields.

### Shell curvature

The generic curvature packet permits repeated row centers. In particular, two
rows would suffice if their four transported outer arcs had pairwise disjoint
open turn supports. The source adapter now supplies all four arcs for the two
retained apex rows, but it supplies no separation between them.

[`check_retained_apex_rows.py`](check_retained_apex_rows.py) exhaustively checks
the normalized `n = 11` aligned cap profile. It enumerates:

- every exact first-apex row containing the three strict cap points;
- every choice of aligned strict pair; and
- every second-apex four-row omitting that pair and satisfying both checked
  intersection upper bounds.

The exact result in this cyclic abstraction is:

```text
candidate retained-row pairs: 1470
four pairwise turn-disjoint outer arcs: 0
```

This is **EXACT FINITE CYCLIC-ABSTRACTION EVIDENCE**, not a Euclidean
realization, not arbitrary-cardinality coverage, and not a proof of the Lean
residual. It does show that the favorable two-row pattern seen in earlier
models cannot be obtained merely by pairing the retained first-apex row with
this retained second-apex omission row. A curvature closure needs another
source-selected row or a stronger global occurrence theorem.

Replay:

```bash
uv run python \
  scratch/atail-force/unique4-aligned-interior-closure-audit/\
    check_retained_apex_rows.py
```

### `noM44`

Three strict hits imply the first opposite cap has cardinality at least five,
so the current displayed packet is already not M44. The residual's global
`noM44` hypothesis can close only after constructing a genuinely different
`SurplusCapPacket T` and proving `T.IsM44`; it does not force a support
incidence in the current packet.

## First missing source occurrence

No audited terminal is currently unconditional. The closest direct consumer
interfaces are:

1. a cyclically ordered two-point overlap of actual selected rows, feeding the
   shared-late-pair Kalmanson terminal; or
2. four actual transported outer arcs with pairwise disjoint turn supports,
   necessarily using at least one row beyond the two retained apex rows on the
   checked `n = 11` aligned profile.

The aligned branch should therefore be routed into the existing global
minimal-deletion / full critical-system occurrence analysis. It should not be
treated as closed by the second-apex double-deletion row, and it should not be
reduced to exact-two or card 11.
