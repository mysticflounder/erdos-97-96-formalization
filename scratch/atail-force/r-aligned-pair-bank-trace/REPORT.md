# Live first-center aligned-pair theorem-bank trace

## Verdict

The exact packet

```lean
LiveFirstCenterAlignment W C
```

does **not** close through an existing imported `False` consumer.

This is not merely a missing adapter.  The packet records data already built
into `LiveDangerousRetainingSystem`:

- its two sources are distinct members of `{q, t1, t2, t3}`;
- both selected blockers are `p`; and
- both selected critical supports are exactly `{q, t1, t2, t3}`.

Consequently, support-uniqueness and fixed-class lemmas only reconstruct the
fields already present in the packet.  Every nearby terminal theorem needs
additional data of a different polarity: a non-`p` center, an off-support
endpoint, separated blocker centers, a third common-row point, a fifth source
in the `p`-fiber, or explicit cap placement.  No scratch Lean adapter was
added because there is no matching terminal signature to adapt to.

## Exact source packet

The source is

```text
scratch/atail-force/r-live-common-deletion-expansion/
  LiveCommonDeletionExpansion.lean
```

For

```lean
W : LiveDangerousRetainingSystem D p q t1 t2 t3
C : CommonDeletionTwoCenterPacket D W.H deleted p center₂
```

the file proves:

```lean
C.B₁ = {q, t1, t2, t3}
deleted ∉ {q, t1, t2, t3}
Nonempty (LiveFirstCenterAlignment W C)
```

An inhabitant `L : LiveFirstCenterAlignment W C` contains

```lean
L.pair : AlignedPrescribedCriticalPair C 0

L.pair.first.point  ∈ {q, t1, t2, t3}
L.pair.second.point ∈ {q, t1, t2, t3}

W.H.centerAt L.pair.first.point  ... = p
W.H.centerAt L.pair.second.point ... = p

support (W.H.selectedAt L.pair.first.point  ...) = {q, t1, t2, t3}
support (W.H.selectedAt L.pair.second.point ...) = {q, t1, t2, t3}.
```

`AlignedPrescribedCriticalPair.installedSystem` and `.installedPacket` merely
install these same sourcewise choices.  No declaration consuming
`AlignedPrescribedCriticalPair` directly to `False` was found.

## Why the support and fixed-class route is circular

The relevant generic declarations are:

- `CriticalShellSystem.source_mem_selectedFourClass`;
- `CriticalShellSystem.selectedFourClass_support_eq_shell`;
- `CriticalShellSystem.selectedAt_support_eq_of_centerAt_eq`; and
- `liveData_dangerous_selectedClass_eq_base`.

Applied to the aligned pair, they prove only:

1. each source lies in the selected shell of the other source because the
   blocker centers agree;
2. selected shells with common blocker center `p` have common support; and
3. the full ambient `p`-radius class through `q` is
   `{q, t1, t2, t3}`.

Those are exactly the packet's source-membership, common-center, and
common-support fields.  They do not produce:

- a q-critical row at a center different from `p`;
- a source outside `{q, t1, t2, t3}`;
- a point outside either selected support;
- distinct blocker centers;
- a third point in an intersection with another critical row; or
- a common cap index for several members of the blocker fiber.

The fixed-class exactness is especially important: it excludes a fifth
`p`-radius point rather than producing one.  Feeding the alignment back
through support uniqueness therefore cannot strengthen the packet.

## Existing consumers and the exact mismatch

### U5 q-critical triple incompatibilities

The closest imported terminal is

```lean
U5QCriticalTripleClass.two_triple_points_incompatibility
```

It closes from a q-critical triple class `K` at a center `center ≠ p` that
contains two distinct dangerous-triple points.  The live alignment instead
has two dangerous-row points as **sources** whose selected rows are
**centered at `p`**.  It provides neither a non-`p` center nor a
`U5QCriticalTripleClass` at that center.

The other U5 terminals have the same role mismatch.  They require rows
centered at dangerous points, cross-incidence between such rows, or an exact
nontriple row.  Equality of two supports centered at `p` does not exchange
the source and center roles.

### Prescribed-deletion edge

```lean
false_of_aligned_h4_or_h5_outside_support
```

requires an aligned endpoint to lie outside the corresponding selected
support.  Here both endpoints lie in `{q, t1, t2, t3}` and both selected
supports equal that same set.  Its terminal premise is contradicted by the
packet.

`h4_or_h5_of_actual_blocker_alignment` only recovers a radius equality
already implied by membership in the common selected support.

### Three-common-row consumer

```lean
AnchoredSourceCriticalTransition.false_of_threeCommonCriticalRowPoints
```

requires an intersection of two critical rows to have cardinality at least
three.  The common-deletion construction supplies fresh-source omissions
from `deletedCriticalSupport`; it does not produce a third point in the
needed intersection.  The banked bound is in the opposite direction,
cardinality at most two.

### Mutual critical-source and bisector consumers

```lean
LowHitResidual.false_of_distinctMutualCriticalFreshPair
false_of_separatedPair_mutualCriticalSourceBisectors
```

require separated blocker centers (or equivalent three-center separation
data).  The live alignment explicitly sets both blocker centers equal to
`p`.  Mutual source membership is compatible with that collision and is not
a contradiction.

### Blocker-fiber bounds

```lean
CriticalShellSystem.centerFiber_card_le_four
```

does not close: the live `p`-fiber is saturated by exactly the four points
`{q, t1, t2, t3}`.  A contradiction would require a fifth distinct source
mapped to `p`, while `W.centerAt_eq_p_iff` rules out every off-base source.

```lean
CriticalShellSystem.centerFiberIn_capByIndex_card_le_two
```

could close only after producing a cap index containing `p` and at least
three distinct members of its live blocker fiber.  The aligned-pair packet
contains no cap index or cap-membership fields and names only two arbitrary
sources.

### Fixed metric and sibling-bank consumers

The sibling theorem

```lean
Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction
```

requires seven named distance equalities.  The common `p`-centered support
supplies only the forward equal-radius part; it does not supply the reverse
equalities at the other named centers.  The theorem is also recorded by the
registry as sibling-source and not import-reachable here.

The M44/C5D3B theorem families require `D.IsM44`, `U2Statement`, `U5ModeA`, or
specialized terminal packets.  The live parent carries the no-M44 branch and
does not expose those interfaces.  The legacy banks contain fixed finite
metric packets, not a generic aligned-pair consumer.

## Smallest missing hypotheses

There are two distinct questions.

### Smallest local continuation hypothesis

The first hypothesis that escapes the tautological index-`0` alignment is
already isolated in `LiveCommonDeletionExpansion.lean`:

```lean
2 ≤ ((((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C) \
  ({q, t1, t2, t3} : Finset ℝ²))).card
```

Under it,

```lean
successor_or_secondCenterAlignment_of_two_off_live_sources
```

produces either:

1. an off-live recursive `CommonDeletionTwoCenterPacket`, or
2. `Nonempty (AlignedPrescribedCriticalPair C 1)`, now aligned at the second
   center.

This is the smallest honest local producer target for making progress from
the current packet.  It is not itself a `False` theorem; the resulting
successor must have strict provenance progress, or the second-center pair
must be consumed using cap/MEC placement.

### Smallest direct imported terminal packet

The shortest route into an already imported `False` consumer is to produce
an independent non-`p` q-critical row with two dangerous-triple hits:

```lean
∃ center B t₁ t₂,
  center ≠ p ∧
  t₁ ∈ T ∧ t₂ ∈ T ∧ t₁ ≠ t₂ ∧
  Nonempty (U5QCriticalTripleClass D q center B) ∧
  t₁ ∈ B ∧ t₂ ∈ B
```

Together with the existing dangerous-triple packet, this feeds directly to
`U5QCriticalTripleClass.two_triple_points_incompatibility`.

The live first-center alignment provides none of the new fields in this
packet.  In particular, support/fixed-class reasoning cannot manufacture
the required `center ≠ p`.

## Bank preflight performed

The trace inspected:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` searches covered:

- aligned prescribed critical pairs;
- same-center critical supports;
- support/fixed-class and residual-hit statements;
- mutual critical sources and perpendicular bisectors;
- prescribed-deletion edges;
- blocker fibers and cap-restricted fibers; and
- U5 q-critical triple consumers.

The result is negative at the exact packet boundary: no existing imported
terminal consumes only `LiveFirstCenterAlignment W C`.
