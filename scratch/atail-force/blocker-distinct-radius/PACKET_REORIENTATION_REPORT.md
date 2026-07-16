# CP-built fixed-surplus reorientation audit

Date: 2026-07-15

Status: **KERNEL-CHECKED PHYSICAL CAP/APEX NORMALIZATION AND FRESH FRONTIER
RECONSTRUCTION; SAME-PAIR FRONTIER TRANSPORT IS IMPOSSIBLE, AND NO COUPLING TO
THE OLD PAIR OR CAP CARDINALITY IS CREATED BY THE SYMMETRY.**

## Scope and preflight

This audit owns only
`scratch/atail-force/blocker-distinct-radius/`.  It does not edit production
Lean, `SurplusM44`, the unique-row lane, or shared closure documentation.

The required current, sibling, and legacy theorem-bank registries and JSON
inventories were searched for packet reindexing, non-surplus swaps, opposite
cap/apex transport, and second-large-cap assignment.  Focused
`nthdegree docs search --lean` queries found the decisive current declarations
in `U2NonSurplusOneHit.lean`:

```text
U2NonSurplusSqueeze.NonSurplusSwap
U2NonSurplusSqueeze.exists_nonSurplusSwap
U2NonSurplusSqueeze.NonSurplusSwap.isM44_iff
U2NonSurplusSqueeze.NonSurplusSwap.minimal_iff
U2NonSurplusSqueeze.NonSurplusSwap.surplusCap_card_eq
```

No second, independent reorientation implementation was found.  The banked
implementation is already the right geometric construction: case-by-case on
the surplus index, it transposes the two non-surplus Moser vertices and the
corresponding two cap labels while retaining the physical surplus cap.

## Public-interface gap and its recovery

The existing `NonSurplusSwap D Dsw` record exposes:

```text
Dsw.A = D.A
Dsw.packet.oppApex1 = D.packet.oppApex2
Dsw.packet.oppCap1 = D.packet.oppCap2
Dsw.packet.oppCap2 = D.packet.oppCap1
Dsw.packet.surplusCap = D.packet.surplusCap
```

It does not store either

```text
Dsw.packet.oppApex2 = D.packet.oppApex1
Dsw.packet.surplusApex = D.packet.surplusApex.
```

Both omitted equalities follow from the stored cap equalities.  Each pair of
closed caps meets only at its shared Moser endpoint, so the swapped
cap-intersection incidences uniquely recover the missing physical apex.
`PacketReorientationAudit.lean` kernel-checks:

```text
nonSurplusSwap_oppApex2_eq
nonSurplusSwap_surplusApex_eq
exists_completeNonSurplusSwap
```

Thus the omission is an interface gap, not a geometric obstruction.

## Exact CP-built normalization

For an arbitrary packet and any `j != surplusIdx`, the checked theorem

```text
exists_rightOrientedNonSurplusIndex
```

returns a `CounterexampleData` whose packet has the physical cap selected by
the original `j` in its `oppCap2` role and the physical Moser vertex opposite
that cap in its `oppApex2` role.

The specialization to the parent packet is:

```text
exists_rightOriented_leaf_secondLargeCap
```

For

```text
S = leafSurplusPacket MT hCirc CP i hM hsurplus
j != i
5 <= (CP.capAt j).card,
```

it produces `Dright` with:

```text
Dright.A = D.A
Dright.packet.surplusCap = S.surplusCap
Dright.packet.surplusApex = S.surplusApex
Dright.packet.oppCap2 = CP.capAt j
Dright.packet.oppApex2 = S.oppositeVertexByIndex j
5 <= Dright.packet.oppCap2.card.
```

This is the exact assignment requested by the symmetry audit.

## Important index distinction

The construction normalizes a **physical cap/apex role**, not the original
numeric `Fin 3` label.  If the original witness is `j = S.oppIndex1`, the
transposed packet retains the same numerical surplus label and permutes the
underlying triangle/cap triple.  Its numeric `oppIndex2` selects the original
physical `CP.capAt j`, but one should not assert

```text
j = Dright.packet.oppIndex2.
```

The correct bridge is the kernel-checked set equality

```text
Dright.packet.oppCap2 = CP.capAt j,
```

together with the corresponding opposite-vertex equality.  Any refactor that
keeps `partition := CP` definitionally while claiming the physical
`oppIndex1`/`oppIndex2` roles have swapped is false: those selectors are fixed
functions of `surplusIdx`.

## Parent dependency direction

The following frontier data survive or transport cleanly:

- the carrier, convexity, global K4 property, and carrier cardinality;
- the physical surplus cap and surplus apex;
- off-surplus membership;
- both physical non-surplus caps and both opposite apices, with their roles
  exchanged;
- the second-large-cap cardinality lower bound;
- carrier-only data such as `CriticalShellSystem D.A`, removability, and the
  global statement `not exists S : SurplusCapPacket D.A, S.IsM44`; and
- the packet-specific `IsM44` predicate, by the existing `isM44_iff`.

The following do **not** survive definitionally and require a relabelled or
symmetric consumer:

- `partition = CP`, the original structural-triangle labelling, and the
  original numeric `j`;
- directional left/right residual fields, unless their explicit reflected
  transport theorem is invoked; and
- any frontier packet whose type is already pinned to the old physical
  `S.oppApex2`.

The last item is the exact dependent-field boundary.  In the active A-tail
scratch frontier, types such as

```text
EquilateralRows D.A x y S.oppApex2
CriticalSelectedFourClass D.A S.oppApex2 center
```

and the `CriticalPairFrontier` survival/relocation fields are statements about
that particular physical point.  When the large cap was originally
`S.oppIndex1`, the reoriented packet calls the old `S.oppApex1` its new
`oppApex2`; the existing old-`oppApex2` data become first-apex data, not
second-apex data.  Reorientation therefore cannot manufacture the symmetric
packet by transporting that existing witness.  The follow-up below shows
that `CriticalPairFrontier` can instead be reconstructed with a fresh pair;
no analogous reconstruction was found for the displayed equilateral-row or
chosen critical-class fields.

At the top `DoubleApexOffSurplusSharedRadiusPair` residual, the requested pair
is already symmetric in the two physical apex centers, so relabelling alone
does not strengthen the conclusion.  The symmetry removes only the nuisance
case split over which opposite cap the existential `j` denotes.

## CriticalPairFrontier follow-up

The same theorem-bank registries were searched again, followed by focused
`nthdegree docs search --lean` queries for critical-pair transport,
survivor-pair symmetry, role-free prescribed-apex frontiers, and
`NonSurplusSwap` consumers.  No dedicated frontier swap theorem was found.
The relevant current declarations are all in `ATail/CriticalPairFrontier`:

```text
SurvivorPairRelocationPacket.oppApex2_dist_ne
exists_criticalPairFrontier
exists_criticalPairFrontier_of_K4
```

The follow-up in `CriticalPairFrontierSwapAudit.lean` establishes two
different facts that must not be conflated.

### Same-pair transport is PROVEN impossible

An old survivor pair lies on one common-radius class about the old
`oppApex1`.  The existing theorem
`SurvivorPairRelocationPacket.oppApex2_dist_ne` proves that those same two
points have different distances from the old `oppApex2`.  Under the swap, the
old second apex becomes the new first apex.  Therefore the old pair cannot
satisfy the new packet's first-apex marginal field at any radius.

The kernel-checked negative interfaces are:

```text
survivorPair_dist_ne_at_swapped_firstApex
survivorPair_not_common_radius_at_swapped_firstApex
no_same_pair_survivorPacket_after_completeSwap
no_same_pair_criticalPairFrontier_after_completeSwap
```

This is stronger than a missing transport lemma.  A theorem claiming to reuse
both old sources in a swapped `CriticalPairFrontier` would contradict an
existing kernel theorem.

### Fresh reconstruction is already available

The current constructor `exists_criticalPairFrontier_of_K4` is quantified
over an arbitrary `SurplusCapPacket`.  After transporting the
carrier-indexed `CriticalShellSystem` across `Dright.A = D.A`, it can be
applied directly to the reoriented packet.  No new apex-symmetric existence
theorem is needed.

The checked adapters are:

```text
exists_freshCriticalPairFrontier_after_completeSwap
exists_freshCriticalPairFrontier_at_rightOrientedIndex
criticalPairFrontier_after_swap_physical_projection
```

For a chosen original cap index `j`, the fresh frontier has its second apex at
the physical point `S.oppositeVertexByIndex j`.  In the nontrivial swap
branch, and expressed in the pre-swap physical labels, its new pair:

- lies off the unchanged surplus cap;
- has one common radius about the old second apex; and
- survives simultaneous deletion at the old first apex, which is the chosen
  second role after swapping.

Thus an apex-symmetric/role-free frontier theorem is **not genuinely new at
the existential level**.  What is genuinely new is any theorem coupling the
fresh reconstructed pair to the old frontier pair, its blockers, its radius,
or the second-large-cap cardinality witness.  The existing constructor is
free to choose different points and a different radius, and the same-pair
choice is ruled out.

## Closure consequence

This audit validates a useful refactor: downstream cap-specific arguments may
assume the second-large-cap witness occupies the physical `oppCap2` role after
passing through the transport record, and may reconstruct a fresh
`CriticalPairFrontier` there.  It does **not** close a producer:

- `5 <= cap.card` is not refined to `cap.card = 5`;
- no deletion-survival, omission-row, or distinct-radius datum is produced;
  and
- no relation is obtained between the fresh frontier and the old pair or the
  large-cap witness beyond the physical apex label.

The remaining ingredient is therefore a cross-frontier or cap-to-frontier
coupling theorem, not apex-symmetric frontier existence and not more index
adjudication.

## Validation

`PacketReorientationAudit.lean` and `CriticalPairFrontierSwapAudit.lean`
elaborated successfully in the isolated scratch environment.  Every printed
theorem has axiom closure exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, declared axiom, `admit`, or `native_decide` dependency.
No production target build, full `lake-build`, or publication gate was run.
