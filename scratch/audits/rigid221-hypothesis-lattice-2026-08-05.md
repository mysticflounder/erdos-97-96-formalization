# Rigid221 / exact-four live-leaf hypothesis lattice (2026-08-05)

## Scope and status

Read-only source audit of the sharded live `Rigid221` path.  The eight leaves
below are all `sorry`-backed and load-bearing: they feed the proved
`false_of_exactFourMutualOmissionRigid221_globalDeletion`, then the direct
exact-four mutual-omission coordinator.  The imports are live through
`ATail.FrontierLiveClosure`.

The common frame is the original unique-four residual `R`, `12 <= |A|`, the
post-card-eleven robust surface, a positive physical-second-apex radius, the
five-point selected class, mutually omitted `u,v`, the source context and
joint deletion.  The rigid branch additionally has the `2+2+1` class cover
and its globally minimal blocking deletion.

## Load-bearing leaves

| Leaf (source) | Surface shared with siblings | Premise(s) that distinguish it |
|---|---|---|
| `...physicalApex_sourceNeU` (`Rigid221Closure.lean:52`, `sorry:101`) | physical global deletion; blocker in the physical five-class | `globalDeletion.center = oppApex2`, `u != source`, and source blocker is one of the distinguished deleted point, `u`, or the `v`-row intersection. |
| `...nonphysicalCollision` (`Rigid221Closure.lean:224`, `sorry:267`) | nonphysical global deletion | `center != oppApex2` and two distinct deleted points are equidistant from that center. |
| `...minimalCore` (`Rigid221Placement.lean:543`, `sorry:584`) | nonphysical global deletion | `center != oppApex2` and a `MinimalDeletionCore A deleted center`; this is the other arm of `globalDeletion.geometry`. |
| `...sourceEqU_blockerDeleted` (`Rigid221Placement.lean:749`, `sorry:759`) | physical `P : ExactFourRigid221PhysicalApexSourceEqUContext` | Actual source blocker equals `jointDeletion.deleted.1`. |
| `...sourceEqU_blockerV_sourceRowHeavy` (`Rigid221Placement.lean:903`, `sorry:914`) | physical source-equals-`u`, blocker is `v` | `sourceRowInteriorCount = 2` and `v` is in the strict second-cap interior. |
| `...sourceEqU_blockerVRow_oppositeRowHeavy` (`Rigid221Placement.lean:926`, `sorry:940`) | physical source-equals-`u`, blocker belongs to the rigid `v` row | source row is not heavy and opposite row has interior count `2`.  This is intentionally shared by blocker-`v` and blocker-other coordinators. |
| `...sourceEqU_blockerVRow_sparseRows` (`Rigid221Placement.lean:951`, `sorry:965`) | same `v`-row surface as preceding row | both source and opposite interior counts are not `2` (the normalized `1+1+1` arm). |
| `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge` (`Rigid221SourceHeavy.lean:716`, `sorry:726`) | source-equals-`u`, blocker-other-in-`v`-row, source row heavy, encoded by `ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket` | `6 <= S.oppCap2.card`.  The packet fixes the two row traces, exact five-class cover, actual blocker `= xv`, and both source-row points in the strict second-cap interior. |

Thus the lattice first separates physical/nonphysical center; nonphysical
separates collision/minimal core; physical separates third source row/source
equals `u`; and the latter separates deleted point / blocker `v` / other
`v`-row point.  The `v`-row branch splits first by source-row count and then
by opposite-row count.  This is a genuine hypothesis lattice, not eight
copies of the same metric statement.

## Proved source-level producers already present

- `exactFourMutualOmissionRigid221_globalDeletion` in
  `Rigid221Placement.lean:91` builds the global-minimal-deletion packet from
  the rigid `2+2+1` witness; `Rigid221Closure.lean:273` has the checked
  center/geometry split and consumes every nonphysical arm.
- `exactFourRigid221_sourceBlockerInClass_placement`
  (`Rigid221Placement.lean:591`) gives the checked `u = source` versus third
  source-row placement split.  `...physicalApex_sourceBlockerInClass`
  (`Rigid221Closure.lean:107`) consumes it.
- `...sourceEqU_blockerV` (`Rigid221Placement.lean:970`) proves the
  source-/opposite-row count case split, calling the three row-shape leaves.
  `...blockerVRowOther` (`Rigid221SourceHeavy.lean:2623`) proves the analogous
  inequality branch and reuses the two membership-based non-heavy leaves.
- For the source-heavy *other* branch,
  `exactFourRigid221_sourceHeavyOtherXv_capProfile` and the exact-five packet
  constructor are proved.  Both exact-five growth consumers
  (`...ExactFiveFirstGrowth`, `...ExactFiveSurplusGrowth`, lines 2513 and
  2544) are proved and reduce to the shared proved placement packet.  The
  only open cap-profile arm is `...secondOppositeLarge`, called at
  `Rigid221SourceHeavy.lean:2601`.
- The independently proved reusable minimal-core producer is
  `MinimalDeletionCore.capByIndex_card_ge_six` (`MinimalDeletionCore.lean:295`):
  a minimal core with `2 <= |deleted|` and *an equality*
  `oppositeVertexByIndex k = center` yields `6 <= |capByIndex k|`.

## Reuse/bank preflight and consequence

I checked the required general-n mining document and the `p97_rvol`, legacy,
and `erdos-general-theorem` registries.  None contains a Rigid221,
minimal-deletion, or `capByIndex`-shape closer.  The live-bank document says
the U5/U1 results are consumers lacking the packet/classifier producer, and
the C5D3B surface is stale/unverified.  Hence neither is a legitimate source
for a new local metric closure here.

One Lean-corpus reuse search for `MinimalDeletionCore capByIndex card ge six
opposite apex` confirmed the two live `MinimalDeletionCore` theorems above.
Their exact earliest missing antecedent in the minimal-core leaf is not a
metric inequality: it is the identification
`S.oppositeVertexByIndex k = globalDeletion.center` (the leaf supplies only
`globalDeletion.center != S.oppApex2`).  Consequently that theorem cannot
currently discharge the minimal-core leaf, much less dominate the collision
or physical leaves.

The closest prospective merger is a physical source-equals-`u`, blocker-in-
`v`-row theorem.  It would cover the blocker-`v` heavy leaf and both shared
non-heavy membership leaves (and the blocker-other coordinator).  It has no
single missing antecedent: its first live gaps are respectively the heavy
blocker-`v` leaf, `...secondOppositeLarge` in the heavy blocker-other path,
and the two independent opposite-heavy/sparse leaves.  Therefore there is no
audited generalized theorem with one proved producer and one missing
antecedent that honestly dominates two current leaves.  Do not add a generic
local metric theorem on the basis of this lattice.

