# Blocker--Moser-apex alignment checkpoint

Date: 2026-07-14

## Verdict

Adaptive blocker--apex alignment is now kernel-checked.  Selector-uniform
alignment for the arbitrary `CriticalShellSystem` quantified by K-A is false
on the currently available surface and is not supplied by any banked theorem.

`BlockerApexAlignment.lean` proves the following exact classification for any
non-surplus indexed cap `i` and any second Moser-apex index `j`.

1. Global K4 and convex cap geometry produce two distinct carrier points
   `x,y` in one exact radius class about `oppositeVertexByIndex i`.
2. Both points lie in `capInteriorByIndex i`, hence outside `surplusCap`.
3. Either deleting both points preserves K4 at
   `oppositeVertexByIndex j`, or an actual adapted
   `CriticalShellSystem` chooses that second Moser apex as the blocker of one
   of the two sources.

The specializations

```text
oppIndex1 radius pair -> oppIndex2 survival/alignment
oppIndex2 radius pair -> oppIndex1 survival/alignment
```

are both proved.  The first arm is the existing prescribed-apex survivor
direction; the other arms are genuine apex-aligned critical systems produced
by `CriticalShellSystem.overrideAt` after a deletion is shown to block K4.

## Import-cycle result

The existing theorem
`SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_two` is stored in
`RemovableVertexAxiom/PinnedSurplusGeneralM.lean`.  That top-level module is
downstream of `U1LargeCapRouteBTail`, so importing it into the K-A production
module would be circular.

The mathematical ingredient itself is cycle-free.  The scratch file imports
only

```text
U1LargeCapRouteBTail
CapSelectedRowCounting
```

and locally replays the lower-bound proof from the upstream cap cover and the
two adjacent one-hit bounds.  This version kernel-checks.  A production move
would place the lower-bound theorem in an upstream cap-counting module, not
import `PinnedSurplusGeneralM`.

## Why this does not yet close K-A

K-A receives only `Nonempty (CriticalShellSystem D.A)`.  The adaptive theorem
may replace that witness at one source.  Nothing proves that the arbitrary
system already supplied by the live wrapper made the same choice.

This distinction is real:

- card-five branches prove the active chosen blockers differ from both
  relevant apices;
- card-four endpoint geometry permits a legal override choosing the first
  apex even under the conditional `hNoM44` surface; and
- `hNoM44` constrains cap geometry, not which certified deletion blocker an
  existential critical selector chooses.

Therefore the first failed hypothesis for a direct K-A application is
**fixed-system alignment**, not cap-interior multiplicity.  After adaptive
alignment, the next independent field is dangerous-row localization of the
interior pair (or a consumer for the two-deletion-survival arm).

## Bank verdict

Required registry and indexed searches found no reusable producer.

- Legacy `U4MoserBlockerLabel` only says a point has positive distance from
  one of two apices; it does not mention `CriticalShellSystem.centerAt`.
- `U4MoserBlockerCore` is an assumed conditional core.  Its exports consume
  that assumption and positive `IsM44`; they do not prove blocker alignment.
- `exists_pinnedRightCriticalShellSystem` and its mirror construct overridden
  systems only from positive `IsM44` plus a pinned residual.  Both hypotheses
  are absent from K-A, and positive `IsM44` has the wrong polarity against
  `hNoM44`.
- `actual_blocker_ne_of_deletion_survives` confirms the survival arms have the
  opposite polarity: their fixed chosen blocker is not the prescribed apex.

## Validation

From `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/blocker-apex-alignment/BlockerApexAlignment.lean
```

The direct check exits zero.  All three printed public endpoints depend only
on:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorry`, `admit`, named axiom, or `native_decide` in the Lean
file.
