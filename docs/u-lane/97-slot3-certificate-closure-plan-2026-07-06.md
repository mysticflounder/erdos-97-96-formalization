<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Slot-3 U-lane certificate closure plan (2026-07-06)

This records the current formalization-repo plan for closing the imported
p97-rvol U1 route-B tail work.  The goal is not to extend the imported local
case split.  The goal is to consume the certificate/metric closure surfaces that
actually sit on the `Problem97.erdos97_rhs` spine.

Audit correction, 2026-07-06:

- This plan is not, by itself, a full closure route until the large-cardinality
  double-apex obstruction produces a uniform theorem and the live-data branch
  gets a real producer surface or a strictly narrower on-spine residual.
- Workstream C is the sibling slot-2 certificate track.  Its live frontier is
  owned by `docs/four-point-subpacket-live-frontier.md`; the detailed logs in
  this file are historical checkpoints and must not be treated as the source of
  truth when they disagree with the live frontier or the proof-blueprint spine.
- The pinned-surplus route is split by regime.  Exact ten-mask bank consumers
  are sound without extra faithfulness only in the label-complete `m = 5` case.
  The general-`m` route must use a relaxed/sub-mask bridge, a confinement
  theorem, or leave an explicit on-spine general-`m` residual.

## Current state

The p97-rvol route-B tail import has already landed in this repo.  The two
copies of `U1LargeCapRouteBTail.lean` are semantically identical apart from
module/import names:

- this repo: `lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean`
- source repo: `../p97-rvol/lean/RVOL/P97/U1LargeCapRouteBTail.lean`

The July 5 CP-side rewire is already present here:

- `U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket`
- `U1LargeCapRouteBTailMetricResidualTarget.U2NonSurplusSqueeze.oppCap2_escape_gen`
- `U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`

`lake-build Erdos9796Proof.P97.RemovableVertexAxiom` succeeds as of this note.
The expected warnings are the live `sorry` declarations.

`proof-blueprint spine Problem97.u1_largeCap_routeB_tail_liveData_false
--max-depth 4` reports the current anchor as open with exactly two U1
obligations:

1. `Problem97.u1_largeCap_routeB_tail_liveData_false`
2. `Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`

`proof-blueprint spine Problem97.erdos97_rhs --max-depth 6` now reports the
publish spine open through those two slot-3 obligations plus three slot-2
certificate/census obligations in `RemovableVertexAxiom.lean`:

1. `Problem97.isM44EndpointResidualsExcluded`
2. `Problem97.isM44PinnedSurplusResidualsExcluded`
3. `Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`

`Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` is
open as a publish-spine theorem.  Its broad erased-pin triple surface is being
reduced inside the theorem to the local route-grouped finite-residual seed-row
surface
`IsM44NonSurplusContainmentErasedPinTripleRoutedSeedFiniteResidualRowsFactsStatement`.
Closed adapters first recover the pruned and routed seed-row surfaces, then the
raw count-row statement,
`IsM44NonSurplusContainmentErasedPinTripleCountFamilyFactsStatement`, and the
existing erased-pin triple exclusions.  The older finite/named/candidate
adapters remain compiled support, but the two-hit probe makes the
`AdjacentChainOneHitData` route non-operative for this branch.  The
proof-facing local obligation now asks for the finite scaffold and the two
pure surplus-side four-hit residual rows.  The left-right finite-residual
bucket is empty, and the finite ten-label same-side-heavy rows are closed from
the finite scaffold.  The erased one-sided terminal payload exclusions are now
closed from the finite scaffold by the
`false_of_*OneSidedErasedPayload_of_seedCandidateInputs` consumers.
There is no
separate top-level
`Problem97.isM44NonSurplusContainmentErasedPinTripleReductionInputs` theorem.
The row/route census has now been generated, but it is only a row-spec work
queue, not a metric exclusion certificate:

```text
scripts/erased-pin-row-census.py
certificates/surplus/erased_pin_count_rows.json
certificates/surplus/reports/erased_pin_count_rows.md
lean/Erdos9796Proof/P97/ErasedPinCountRows.lean
```

`Erdos9796Proof.P97.ErasedPinCountRows` builds and checks 15 right rows, 15
left rows, and the route split `18 left-right-subpacket / 10 same-side-heavy /
2 one-sided-terminal`.  The next generator step is to attach these row ids to
the seeded-shadow consumers or to a new adjacent-heavy bridge.
The two `U2OppCap2Escape.lean` sorries remain off the current publish spine and
must not be treated as live slot-3 closure work unless they are explicitly
wired back into the spine.

## Exact closure path — erased-pin triple residuals (2026-07-08)

Audit of the live `sorry` sites inside
`isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`
(`RemovableVertexAxiom.lean` 9339, 9367, 9406, 9411, 9420, 9424), classified
by what is known to block each, with the ordered path to closure.  Line
numbers are as of commit 596428d.

2026-07-08 checkpoint update: the two P1 CCW sites have since been removed
from the live local hole set by the ordered/reflected producer refactor.  The
current local `sorry` sites in this theorem are the two direct P4 erased-pin
branches (`RemovableVertexAxiom.lean:10015`, `:10043`) and the two P2
candidate-remainder helpers (`:10144`, `:10169`).  The live proof-blueprint
spine remains one open leaf, because all four local holes sit inside the same
headline theorem.

### Sorry-site inventory

| Site | Obligation | Classification |
|---|---|---|
| 9339 | direct surplus-opposite `ErasedPinTriple` exclusion | BLOCKED — no producer (Mode-A probe, frontier doc 2026-07-08) |
| 9367 | direct surplus-interior `ErasedPinTriple` exclusion | BLOCKED — same hole as 9339 |
| 9406 | right ten-label hull `IsCcwConvexPolygon` | CLOSED in current source by the ordered/reflected producer refactor (P1) |
| 9411 | right own-kind `OneSidedSeedCandidateRemainder` pair | mechanical-shaped {{NEEDS_PROOF}} (P2) |
| 9420 | left mirror hull CCW | CLOSED in current source by the ordered/reflected producer refactor (P1) |
| 9424 | left mirror candidate remainders | same as 9411 (P2) |

Grounding facts, each independently checked 2026-07-08:

- The row-truth probe holds verified exact-rational witnesses for the two
  surviving residual rows (e.g.
  `scratch/erased-pin-row-truth/results/witness_ep_right_m0_s0_l0_r4.json`)
  and for the direct surplus-side configurations
  (`witness_surplus_opposite_SO_t2_PuQ1.json`, verified PASS).  All remaining
  exclusions are therefore NOT local geometric impossibilities: closure
  content must be cross-separation/global.
- The Mode-A probe (frontier doc, 2026-07-08 entry) confirms `U5ModeA D` is
  not synthesizable from the ambient context, and
  `u5AuditedSupportOrSameCircle` is not a shortcut (its descriptor payload is
  exactly the missing data).
- The multi-center joint census L2 GLOBAL PROVEN sweep is now loaded through
  `n = 32`: `977,975/977,975` checks are SAT with 0 UNSAT and 0
  INDETERMINATE, and the exact stable window of width four is `n = 29..32`.
  This still supplies none of the erased-pin producer facts below.
- The multi-center general-`n` formalization scaffold now lives in
  `Erdos9796Proof.P97.MultiCenter.GeneralN`: finite `LocalJointClassCode`
  alphabet, semantic `JointClass` projection, and abstract persistence-to-
  stabilization lemmas are kernel-checked. The initial realization-facing
  bridge now lives in `Erdos9796Proof.P97.MultiCenter.Realization`: it defines
  `CodeInventory` and proves the code and semantic stabilization consequences
  of one-step persistence, plus the predicate-level GLOBAL⊆LOCAL and
  LOCAL⇒GLOBAL completion interfaces, in both threshold and all-parameter
  forms. The bridge also has the `max(local-stability-threshold,
  completion-threshold)` variant, so later imports do not need to align those
  thresholds artificially; threshold completion is enough for eventual GLOBAL
  stability once LOCAL persistence is supplied. The profile-facing surface now
  also provides `profileOccursAtN`,
  `realizesJointClass`, `localInventory`, and `globalInventory`, and proves
  `localInventory_stepPersistent` from a profile-extension principle.
  `Erdos9796Proof.P97.MultiCenter.CapProfile` also formalizes the concrete
  U1 card-11 cap-profile handoff: the two-large-cap hypotheses give
  `profile554`, with closed-cap sizes `(5,5,4)` and interior capacities
  `(3,3,2)`. This still does not close any erased-pin producer obligation; the
  next relevant U4 step is instantiating that bridge by proving local
  extraction, occurrence closure under cap extension, and the actual GLOBAL
  soundness/completion hypotheses.
- Bounded CONJECTURED-tier smoke for P3 has been run on `n = 12..15`:
  `11,223/11,223` checks are SAT with 0 UNSAT and 0 INDETERMINATE.  This is
  not the full P3 appendix, but it gives no cut signal at the smallest
  profiles.
- `exists_isCcwConvexPolygon_of_convexIndep`
  (`ConvexCyclicOrder/Construct.lean:1935`) and the `ArcBlockContiguity.lean`
  cap-contiguity layer already exist — the CCW gap has known ingredients.
- `ErasedPinOrderedProducer.lean` (uncommitted WIP, 2,406 lines, sorry-free)
  is ordered seed-census machinery; it contains no CCW content and is not yet
  imported by any module.

### Path

**P1 — CCW producers (sites 9406/9420).**  The goals as written are false
for the given unordered points: the seven interior points arrive with
membership hypotheses only, and a fixed label template cannot be CCW for every
assignment.  The false statement surface is the current
`ErasedPinFiniteCandidateSepScaffoldFacts S x`, which universally quantifies
over arbitrary names `p₁ p₂ q₁ q₂ s1 s2 s3` and then asks the fixed
right/left ten-label templates to be CCW.  `ErasedPinOrderedProducer.lean`
only supplies ordered finite seed-bank data; it does not yet supply a CCW
producer or permutation transport.

Current implementation choices:
1. **Transport route.**  Prove ordered CCW/facts for a within-group
   permutation of each row-chosen packet, then transport the resulting finite
   facts back to the caller's arbitrary labels.  This preserves the current
   universal scaffold statement, but needs concrete permutation-invariance
   lemmas for `rightPinnedLabelPoint`/`leftPinnedLabelPoint`, masks, center
   classes, and candidate remainders.
2. **Ordered-consumer route.**  Refactor the row consumers so each row chooses
   ordered labels before calling the finite producers.  This avoids transport
   back to arbitrary names, but changes the scaffold/consumer boundary across
   the generated row consumers.
3. **CCW-free sep route.**  Replace the CCW-dependent finite producer with a
   direct separation producer.  This is new proof content and is not the
   current plan.

Available ingredients are weaker than the previous note stated:
`exists_isCcwConvexPolygon_of_convexIndep` and `ArcBlockContiguity.lean`
provide the global convex ordering and cap block contiguity, but
`ConvexCyclicOrder/Basic.lean` explicitly leaves general rotate/reindex
transport as deferred work.  P1 is therefore not just local assembly; it must
either add the missing transport layer or change the generated consumers to
work with ordered labels from the start.

2026-07-08 checkpoint: because `ErasedPinFiniteCandidateSepOrderedScaffoldFacts`
chooses the labels existentially for each three-point surplus set `T`, the
right P1 theorem target is not "prove the old arbitrary labels are CCW."  It is
an ordered selector theorem: given the two non-surplus two-point interiors and a
three-point surplus-interior `T`, choose the orientations of the two pairs and
the order of the three surplus labels so that the right and left
`labelOfHullFin` ten-point templates are CCW.  `ArcBlockContiguity` supplies the
cap-as-index-block ingredient, but the missing formal bridge is still the
packet-level block-order/export theorem from an `IsM44` packet and the chosen
`T` to those two concrete ten-label CCW templates.  That bridge is the next
grounded P1 producer; proving either old site in place remains out of scope.

2026-07-08 implementation checkpoint: the Lean route has started down the
ordered-consumer option.  `RemovableVertexAxiom.lean` now has
`ErasedPinFiniteCandidateOrderedScaffoldFacts` and the reduced
`ErasedPinFiniteCandidateSepOrderedScaffoldFacts`, plus a proved reduced-to-full
adapter.  The right `(0,0,0,4)` finite row now consumes the ordered scaffold
for the exact three-point surplus set it constructs; commit `f255a8f` records
that first verified step.  The mirror left `(0,0,4,0)` row has since been
migrated the same way.  The representative subset-extension row
`right (0,0,1,3)` is also migrated: it transports the row subset proof across
the ordered scaffold's equality between the old three-point set and the
ordered labels.  The right same-side triple rows `right (0,1,0,3)` and
`right (1,0,0,3)` now use the same ordered-set transport pattern, so the
right side of the heavy same-side triple block no longer needs arbitrary
three-point labels.  The mirror left same-side triple rows `left (0,1,3,0)`
and `left (1,0,3,0)` are migrated the same way.  The remaining same-side
heavy pair rows
`right (1,1,0,2)`, `right (2,0,0,2)`, `left (1,1,2,0)`, and
`left (2,0,2,0)` are now also ordered consumers, so the same-side heavy
block no longer directly consumes the false arbitrary-label scaffold surface.
The right left/right subpacket pruned rows are also migrated to the ordered
scaffold boundary: `right (0,0,2,2)`, `right (0,0,1,3)`,
`right (0,1,2,1)`, `right (0,1,1,2)`, `right (1,0,2,1)`,
`right (1,0,1,2)`, `right (1,1,1,1)`, and `right (2,0,1,1)`.
The mirror left left/right subpacket pruned rows now use the same boundary:
`left (0,0,2,2)`, `left (0,0,3,1)`, `left (0,1,1,2)`,
`left (0,1,2,1)`, `left (1,0,1,2)`, `left (1,0,2,1)`,
`left (1,1,1,1)`, and `left (2,0,1,1)`.
The right and left one-sided terminal seed-input producers now also consume
the ordered scaffold directly: each chooses a preserving surplus triple,
asks the ordered scaffold for the concrete label bank on that set, and feeds
those labels into the terminal seed constructor.
The finite-residual statement itself now asks for
`ErasedPinFiniteCandidateSepOrderedScaffoldFacts`, and the routed/group
signatures consume `ErasedPinFiniteCandidateOrderedScaffoldFacts` directly.
Thus the active finite-residual-to-row path no longer depends on the false
arbitrary-label scaffold surface.  Current verified spine after this migration
is `1 open / 797 total`; the remaining on-spine work is the direct
surplus-opposite/surplus-interior erased-pin branches plus the ordered
placement and candidate-remainder producers inside the ordered scaffold
obligation.

2026-07-08 checkpoint: the first reusable P1 transport facts are now in the
verified Lean tree.  `ConvexCyclicOrder/Basic.lean` has
`Problem97.isCcwConvexPolygon_subsequence`, proving that a strictly increasing
finite subsequence of a CCW convex polygon is CCW.  `SurplusM44Packet.lean` now
imports `CGN.CGN4g` and exposes
`SurplusCapPacket.capByIndex_cgn4g_capData`, a packet-level export theorem
showing every indexed cap has the ordered-cap data produced by
`CGN4g_capData_of_supportCap`.
`lake-build Erdos9796Proof.P97.SurplusM44Packet` succeeds and proof-blueprint
resynced the call graph.  The active leaf remains `1 open / 797 total`; this
checkpoint supplies ordered-cap data for the forthcoming selector bridge, but it
does not yet prove the concrete ten-label right/left CCW templates.  The still
missing P1 bridge is the order export from the three indexed cap blocks and the
chosen surplus triple `T` to the `labelOfHullFin` ten-label sequence.

2026-07-08 checkpoint: the retained cap-block data is now available in the
verified Lean tree.  `CGN.CGN4g` defines `Problem97.CGN.StrictCapBlockData`,
retains the `BoundaryCapBlock` inside
`CGN4g_strictCapBlockData_of_supportCap_oriented`, and keeps the previous
`CGN4g_capData_of_supportCap_oriented` signature as a compatibility wrapper.
`SurplusM44Packet.lean` exposes
`SurplusCapPacket.capByIndex_cgn4g_strictCapBlockData`, so every indexed cap can
now export the local ordered cap together with its ambient boundary interval
block.  `lake-build Erdos9796Proof.P97.SurplusM44Packet` succeeds and
proof-blueprint resynced.  The active leaf remains `1 open / 797 total`.  This
still does not close P1 by itself; the next producer must combine the retained
blocks for the opposite caps and the chosen surplus triple into the concrete
right/left `labelOfHullFin` ten-label CCW certificates.

2026-07-08 follow-up correction: the current reduced ordered scaffold is still
too strong if read as one common naming for both sides.  The right hull template
orders the surplus triple along the surplus cap from `.v` to `.w`; the left
mirror template orders the same surplus cap from `.w` to `.v`.  A single
`s1,s2,s3` order cannot generally satisfy both CCW templates.  The next P1
refactor should therefore split the scaffold boundary into right-ordered and
left-ordered producer packets over the same three-point set `T`, allowing the
left packet to use the reversed surplus order and the mirror pair orientations.
The row consumers mostly use only the side they are proving, so this should be a
consumer-boundary refactor rather than a new geometric exclusion.  A second
independent issue remains: the per-cap retained block export is not itself a
shared ten-point boundary certificate; the eventual CCW producer must use one
common ambient boundary enumeration, or prove an equivalent cyclic-order
transport theorem, before applying `isCcwConvexPolygon_subsequence`.

2026-07-08 split-scaffold checkpoint: the consumer-boundary refactor is now in
the verified Lean tree.  `RemovableVertexAxiom.lean` defines side-specific
ordered scaffold surfaces
`ErasedPinRightFiniteCandidateOrderedScaffoldFacts` and
`ErasedPinLeftFiniteCandidateOrderedScaffoldFacts`, their reduced `Sep`
variants, and the split pair
`ErasedPinFiniteCandidateSepSplitOrderedScaffoldFacts`.  The finite residual
statement now asks for the split reduced scaffold; the pruned-row bridge
projects the right component for right rows and the left component for left
rows.  The row producers and terminal seed-input producers now consume only
their side's scaffold, so the active spine no longer requires one shared
`s1,s2,s3` ordering to satisfy both mirror CCW templates.  Verification:
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.RemovableVertexAxiom`
succeeded and proof-blueprint resynced; the active spine is `1 open / 803
total`.  The remaining on-spine producer content is unchanged in kind: prove
the right/left placement CCW certificates and the right/left candidate
remainder producers, plus the direct surplus-opposite and surplus-interior
erased-pin branches.

2026-07-08 P1 certificate-shape checkpoint: the raw right/left CCW holes now
factor through a verified ambient-boundary subsequence consumer.  The new
`HullOrderSubsequenceCertificate A pointOf` requires one injective global CCW
enumeration of `A`, an exact image proof for `A`, and strictly increasing
indices for the ten `labelOfHullFin` packet points.  The proved
`isCcwConvexPolygon_of_hullOrderSubsequenceCertificate` turns such a
certificate into the exact `IsCcwConvexPolygon` argument expected by the finite
candidate producers via `isCcwConvexPolygon_subsequence`.  The remaining P1
producer gaps are therefore no longer unrestricted CCW assertions: they are
specifically the right and left ambient-index export certificates.  Verification:
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.RemovableVertexAxiom`
succeeded and proof-blueprint resynced; the active spine is `1 open / 806
total`.

2026-07-08 shared-boundary interval checkpoint: `SurplusM44Packet.lean` now
exposes `SurplusCapPacket.capByIndex_interval_of_global_indices`.  Given one
shared ambient CCW boundary enumeration `φ`, endpoint indices `ia < ib`, and an
opposite-apex index outside that interval, it proves `S.capByIndex i` is
exactly the closed global index interval `[ia, ib]`.  This is the packet-level
bridge from `ArcBlockContiguity.onArcOpposite_iff_index_block` needed by the
P1 hull-order producer: the next selector can work in one surplus-apex-rotated
global boundary order instead of separately choosing per-cap block data.
Verification: `LEAN_ROOT=.../lean lake-build
Erdos9796Proof.P97.SurplusM44Packet` and then `LEAN_ROOT=.../lean lake-build
Erdos9796Proof.P97.RemovableVertexAxiom` both succeeded and proof-blueprint
resynced; the active spine remains `1 open / 806 total`.

2026-07-08 wrap-interval checkpoint: `SurplusM44Packet.lean` now also exposes
`SurplusCapPacket.capByIndex_complement_interval_of_global_indices`.  This is
the complementary case to the previous interval bridge: when the opposite apex
lies strictly between the two endpoint indices in one shared ambient CCW
boundary enumeration, the indexed cap is exactly the complement of the open
endpoint interval.  This is the geometric fact needed for the wraparound
opposite cap in the surplus-apex-rotated ten-label packet.  Verification:
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.SurplusM44Packet` and then
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.RemovableVertexAxiom` both
succeeded and proof-blueprint resynced; the active spine remains `1 open / 806
total`.  The remaining P1 selector is now concrete: choose one ambient
enumeration with the surplus apex at the linear cut, use the ordinary interval
bridge for the non-wrapping caps and this complement bridge for the wrapping
cap, then export the strictly increasing ten indices required by
`HullOrderSubsequenceCertificate`.

2026-07-08 cyclic-shift checkpoint: `ConvexCyclicOrder/Basic.lean` now exposes
the generic boundary-enumeration shift theorem
`Problem97.isCcwConvexPolygon_cyclicShift`, with supporting signed-area
bridges `hneg_of_ccw`, `ccw_of_hneg`, and `hneg_cyclicShift`.  This ports the
previously external `rvol` cyclic-shift argument into the formalization tree and
removes the earlier blocker that `IsCcwConvexPolygon` could not be re-cut at a
chosen boundary vertex.  The higher-level wrapper theorem
`ConvexCyclicOrder.rotate` is still not packaged, but P1 no longer needs that
wrapper before building `HullOrderSubsequenceCertificate`: the selector can
take a global CCW enumeration, shift it so the surplus apex is at index `0`,
then use the interval and complement-interval cap bridges to place the ten
labels in increasing order.  Verification:
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.ConvexCyclicOrder.Basic` and
then `LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.RemovableVertexAxiom`
both succeeded and proof-blueprint resynced; the active spine remains `1 open /
806 total`.

2026-07-08 chosen-cut checkpoint: `ConvexCyclicOrder/Basic.lean` now also
exposes the enumeration packaging needed by the selector:
`Problem97.injective_cyclicShift`,
`Problem97.image_univ_cyclicShift`, and
`Problem97.exists_isCcwConvexPolygon_cyclicShift_at_zero`.  Given a global CCW
convex-boundary enumeration of `A` and a point `p ∈ A`, the last theorem
produces a cyclic cut whose shifted enumeration is still injective, still has
image exactly `A`, is still CCW, and sends the explicit zero index to `p`.
This is the precise setup needed to cut the P1 boundary enumeration at the
surplus apex before applying the ordinary and complement cap-interval bridges.
The remaining P1 selector still has to export concrete increasing indices for
the right and left ten-label packets from the shifted enumeration and the three
cap-block membership facts.  Verification:
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.ConvexCyclicOrder.Basic` and
then `LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.RemovableVertexAxiom`
both succeeded and proof-blueprint resynced; the active spine remains `1 open /
806 total`.

2026-07-08 strict-index checkpoint: `SurplusM44Packet.lean` now exposes the
strict cap-interior index exports needed by the ordered selector:
`SurplusCapPacket.capInteriorByIndex_ne_triangleByIndex_v2`,
`SurplusCapPacket.capInteriorByIndex_ne_triangleByIndex_v3`,
`SurplusCapPacket.capInteriorByIndex_open_interval_of_global_indices`, and
`SurplusCapPacket.capInteriorByIndex_open_complement_interval_of_global_indices`.
The two interval lemmas refine the earlier closed-cap ordinary/complement
bridges by removing the support endpoints: a strict interior point in the
non-wrapping case has an index strictly between the two endpoint indices, and a
strict interior point in the wrapping case has an index in the open complement.
This is the exact index-level fact the P1 selector needs before sorting the two
opposite-cap pairs and the three surplus-cap points into a
`HullOrderSubsequenceCertificate`.  Verification:
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.SurplusM44Packet` and then
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.RemovableVertexAxiom` both
succeeded and proof-blueprint resynced; the active spine remains `1 open / 806
total`.

2026-07-08 reverse-complement checkpoint: the wrapping P1 cap uses the reverse
endpoint orientation after the boundary order is cut at the surplus apex.  In
the right packet, the hull order is `u, Q1, Q2, v, s1, s2, s3, w, Pw, Pu`; the
`Pw/Pu` cap is therefore the open complement of the interval from `u` to `w`,
while the cap's own `triangleByIndex` endpoint order is `w` then `u`.
`SurplusM44Packet.lean` now exposes this missing orientation explicitly:
`SurplusCapPacket.capByIndex_reverse_complement_interval_of_global_indices`
and
`SurplusCapPacket.capInteriorByIndex_open_reverse_complement_interval_of_global_indices`.
The selector can now use ordinary open intervals for the `Q1/Q2` and
`s1/s2/s3` blocks, and the reverse open-complement interval for `Pw/Pu`.
Verification:
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.SurplusM44Packet` and then
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.RemovableVertexAxiom` both
succeeded and proof-blueprint resynced; the active spine remains `1 open / 806
total`.

2026-07-08 sorted-selector checkpoint: `SurplusM44Packet.lean` now also
exposes `Problem97.exists_sorted_pair_finset_eq` and
`Problem97.exists_sorted_triple_finset_eq`.  These finite order selectors turn
the unordered two-point cap interiors and unordered three-point surplus
interior into increasing ambient-boundary labels before the producer builds a
`HullOrderSubsequenceCertificate`.  Together with the ordinary interval,
strict-interior, and reverse-complement interval bridges above, the remaining
P1 work is now the actual side-specific selector/producers: choose the ordered
indices for the right and left ten-label packets and prove the finite
`StrictMono` subsequence certificates.  Verification:
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.SurplusM44Packet` and then
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.RemovableVertexAxiom` both
succeeded and proof-blueprint resynced; the active spine remains `1 open / 806
total`.

2026-07-08 finite-certificate constructor checkpoint:
`RemovableVertexAxiom.lean` now exposes
`Problem97.hullOrderSubsequenceCertificate_of_explicit_indices`.  Given one
ambient CCW enumeration, ten strictly increasing indices in generated
`labelOfHullFin` order, and the ten point equalities, it constructs the
`HullOrderSubsequenceCertificate` consumed by the existing CCW bridge.  This
removes the finite `Fin 10`/`StrictMono` bookkeeping from the remaining P1
producer; the next real obligation is upstream geometry/combinatorics, namely
exporting those ordered indices from the ordinary interval, strict-interior,
reverse-complement, and sorted-selector facts.  Verification:
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.RemovableVertexAxiom`
succeeded and proof-blueprint resynced; the active spine remains `1 open / 806
total`.

2026-07-08 endpoint-identity checkpoint: `SurplusM44Packet.lean` now exposes
direct `triangleByIndex` endpoint rewrite lemmas for the three distinguished
packet indices:
`triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1`,
`triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2`,
`triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2`,
`triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx`,
`triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx`, and
`triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1`.  These are
case-split packet identities, not new geometry; they let the P1 selector call
the ordinary interval and reverse-complement interval exports with the generated
right/left apex labels directly.  Verification:
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.SurplusM44Packet` and then
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.RemovableVertexAxiom` both
succeeded and proof-blueprint resynced; the active spine remains `1 open / 806
total`.

2026-07-08 interval-selector checkpoint: `SurplusM44Packet.lean` now exposes
the finite selector lemmas `Problem97.exists_sorted_pair_points_between`,
`Problem97.exists_sorted_pair_points_after`, and
`Problem97.exists_sorted_triple_points_between`.  These turn indexed unordered
cap points into ordered point labels while preserving the ambient index
inequalities and point-set equalities.  The ordinary interval export supplies
the "between" hypotheses for the `Q` pair and the surplus triple; the
reverse-complement export plus the surplus-apex cut supplies the "after"
hypotheses for the wrapping `P` pair.  Together with
`hullOrderSubsequenceCertificate_of_explicit_indices`, the finite side of P1 is
now packaged.  The remaining selector work is the geometric order export:
produce the apex indices in the right/left cut order and feed the interval
exports into these selectors.  Verification:
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.SurplusM44Packet` and then
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.RemovableVertexAxiom` both
succeeded and proof-blueprint resynced; the active spine remains `1 open / 806
total`.

2026-07-08 orientation audit checkpoint: while starting the geometric order
export, the remaining P1 assumption tightened again.  Mathlib's
`EuclideanGeometry.IsCcwConvexPolygon` is orientation-specific (`i < j < k`
implies the oriented angle sign is `1`), so a single surplus-apex cut cannot
simultaneously certify both mirror ten-label orders merely by reordering the
interior points.  The right packet needs the apex order
`u < oppIndex1 < oppIndex2`; the left mirror packet needs
`u < oppIndex2 < oppIndex1`.  The split scaffold fixed the earlier false
"one shared surplus triple order" surface, but the geometric producer still
needs an orientation branch or transport layer for the nonmatching side.  The
next grounded P1 route is therefore:
1. prove the apex-order dichotomy after cutting at the surplus apex;
2. build the direct hull-order selector for the side matching that dichotomy;
3. close the opposite side by a real mirror/permutation transport theorem, or
   refactor the finite producers so both side consumers use the orientation
   that is actually CCW for the chosen packet.
`SurplusM44Packet.lean` also now exposes
`Problem97.open_reverse_complement_after_zero`, the zero-cut helper that
collapses the wrapping cap's open reverse-complement disjunction once the
matching orientation has been selected.

2026-07-08 apex-dichotomy helper checkpoint: `SurplusM44Packet.lean` now
also exposes `Problem97.fin_order_dichotomy_after_zero` and
`Problem97.image_index_order_dichotomy_after_zero`.  These do not choose a
geometric orientation; they prove the finite fact that, after the surplus apex
is cut to index zero, the two remaining distinct apex indices must be in one of
the two linear orders.  This is the input shape for the branch in the previous
checkpoint: one branch feeds the right direct hull-order selector, the other
feeds the left direct hull-order selector, and the nonmatching side still needs
real mirror/permutation transport or a finite-producer refactor.

2026-07-08 zero-cut boundary export checkpoint: `SurplusM44Packet.lean` now
also exposes
`Problem97.SurplusCapPacket.exists_ccw_boundary_order_at_surplus_apex` and
`Problem97.SurplusCapPacket.exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices`.
These package the upstream placement theorem needed by P1: from the current
`A.Nonempty`, `ConvexIndep A`, and `HasNEquidistantProperty 4 A` hypotheses,
the packet has a shared ambient CCW enumeration cut at the surplus apex, plus
indices for the two opposite apexes and the post-cut order dichotomy.  The
remaining P1 work is now the side-specific hull-order selector: in the
`u < oppIndex1 < oppIndex2` branch, use the existing strict interval exports
and finite sorted selectors to build the right ten-label certificate; in the
opposite branch, build the left certificate.  The nonmatching side still needs
transport/permutation or a finite-producer refactor.

2026-07-08 direct-selector checkpoint: the matching-orientation P1 selectors are
now verified.  `SurplusM44Packet.lean` exposes the generic endpoint identity
`SurplusCapPacket.triangleByIndex_v1_eq_oppositeVertexByIndex`, plus the
reverse closed/open interval bridges
`SurplusCapPacket.capByIndex_reverse_interval_of_global_indices` and
`SurplusCapPacket.capInteriorByIndex_open_reverse_interval_of_global_indices`.
`RemovableVertexAxiom.lean` exposes
`exists_rightPinnedHullOrderLabels_of_apex_order` for the
`u < oppIndex1 < oppIndex2` branch and
`exists_leftPinnedHullOrderLabels_of_apex_order` for the
`u < oppIndex2 < oppIndex1` branch.  Both choose ordered labels for the two
non-surplus two-point interiors and the three-point surplus set `T`, and return
the exact `HullOrderSubsequenceCertificate` consumed by the side-specific finite
bank.  Verification:
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.RemovableVertexAxiom`
succeeded and proof-blueprint resynced; the active spine remains `1 open / 806
total`.  The remaining P1 work is to wire the matching selector into the split
ordered scaffold and then resolve the nonmatching side by transport/permutation
or by refactoring the finite producer so it consumes whichever orientation the
zero-cut boundary actually supplies.

2026-07-08 matching-selector wiring checkpoint: the split ordered scaffold inside
`isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` now calls the
zero-cut boundary export and branches on the two apex orders.  In the
`u < oppIndex1 < oppIndex2` branch, the right scaffold calls
`exists_rightPinnedHullOrderLabels_of_apex_order` and feeds its
`HullOrderSubsequenceCertificate` directly to
`rightFiniteCandidateSepFacts_of_erasedPayloadCenterClass`.  In the
`u < oppIndex2 < oppIndex1` branch, the left scaffold similarly calls
`exists_leftPinnedHullOrderLabels_of_apex_order` and feeds the resulting
certificate to `leftFiniteCandidateSepFacts_of_erasedPayloadCenterClass`.  The
right/left P2 candidate-remainder gaps are factored once per side.  Verification:
`LEAN_ROOT=.../lean lake-build Erdos9796Proof.P97.RemovableVertexAxiom`
succeeded and proof-blueprint reports the active spine as `1 open / 901 total`.

2026-07-08 correction: the nonmatching orientation has also been wired in the
current Lean source.  `rightFiniteCandidateSepFacts_of_reflectedErasedPayloadCenterClass`
and `leftFiniteCandidateSepFacts_of_reflectedErasedPayloadCenterClass` feed the
opposite-orientation selector through reversed labels and reflected hull-label
separation.  P1 should no longer be treated as a remaining local closure target;
the remaining local holes are P2 plus the two direct P4 branches.

**P2 — candidate remainders (sites 9411/9424).**  For each own-kind seed:
every non-fixed center's realized point-mask lies in the generated
candidate-mask list (`oneSidedSeedCandidateMaskOK` filter).  This is a
completeness condition on the generated filter, not an exclusion — the same
shape as the closed `*_exists_erasedPinRowSeed_privateMask` chain.
{{NEEDS_PROOF}}.  The local obligations at 9411/9424 do not currently expose
the mask-interface hypotheses that
`oneSidedSeedCandidateRemainder_of_mask_interfaces` expects; those hypotheses
are normally produced inside the finite-facts pipeline.  Treat P2 as part of
the same producer/scaffold refactor as P1, not as an isolated local `simp`
proof.

2026-07-08 code-level correction: the current helper shape is still too broad.
`hrightCandidate`/`hleftCandidate` in `RemovableVertexAxiom.lean` quantify over
arbitrary ordered labels and use `fun _ => dist p x` as the radius for every
non-fixed selected class.  The proof state at the right helper exposes only
`p ∈ S.capInteriorByIndex S.oppIndex1`, `p ∈ A.erase x`, `sstar`, and the
escape label equality; it does not expose the ordered-label membership/equality
facts, nor the exact mask-cardinality/no-self/trigger interfaces consumed by
`oneSidedSeedCandidateRemainder_of_mask_interfaces`.  More importantly,
`HasNEquidistantProperty 4 A` gives some K4 selected radius at each center, not
that every unrelated center has a four-point class at the shared radius
`dist p x`.  So P2 should not be closed by proving those universal helpers in
place.  The next grounded P2 refactor is to move candidate production to a
surface where the finite masks or row-specific selected-class equalities are
already present, or to shrink the finite scaffold so terminal seed production is
derived only at the row/payload site that supplies the exact mask interfaces.

2026-07-08 source-surface review: `nthdegree docs search --lean` finds the
expected reusable candidate producer,
`oneSidedSeedCandidateRemainder_of_mask_interfaces`, plus the older
`RightOneSidedErasedPayloadSeedMaskInputs` /
`LeftOneSidedErasedPayloadSeedMaskInputs` interfaces.  The live aggregate
finite packet `RightOneSidedErasedPayloadFiniteCandidateSepFacts` deliberately
omits the mask-cardinality, no-self, trigger, and final `uPwPuMask` facts and
instead takes `hcandidate` as an input to
`rightFiniteCandidateSepFacts_of_erasedPayloadCenterClass`; the left packet is
the same.  The two surviving pure rows
`false_of_right_row0004_finiteCandidateFacts` and
`false_of_left_row0040_finiteCandidateFacts` also still consume `hcandidate`
only to derive the `.u` candidate-mask membership needed by
`false_of_privateSurplusTriple_u_crossSeparation`.  Therefore the quick P2
route is not a local proof of the current helpers.  The next producer should
either carry the old mask-interface facts through the ordered scaffold, or
derive row-local `.u ∈ candidateMasks` from exact row/common-mask data at the
pure-row payload site.

2026-07-08 P2 obstruction checkpoint: the live proof state at
`hrightCandidate`/`hleftCandidate` was inspected with Lean.  These helpers are
upstream of the finite facts; the context has ambient K4/minimality, the M44
packet, the ordered boundary data, `p ∈ A.erase x`, and the surplus-star label
equality, but no mask-cardinality/no-self/one-hit/trigger/final fields and no
row-local selected-class equalities for the non-fixed centers.  A small Boolean
probe also confirms that the available cross-separation predicate can hold
while `.u` is not in the generated candidate list, so separation cannot imply
candidate membership.  This rules out proving the current universal candidate
helpers as written.

The row scan adds one important correction to the narrow pure-row idea: many
finite row closures consume the terminal candidate-remainder field, not only
the pure rows.  The existing seed-mask-to-seed-candidate adapters are still
useful (`rightOneSidedErasedPayloadSeedCandidateInputs_of_seedMaskInputs`,
`leftOneSidedErasedPayloadSeedCandidateInputs_of_seedMaskInputs`, and
`seedCandidateInputsStatement_of_seedMaskInputsStatement`), but they do not by
themselves produce the missing geometric mask-interface data.  The next code
route must therefore be one of two real producers:

- **Strong exact producer:** prove the ordered scaffold's candidate fields from
  genuine mask-interface data for every non-fixed center.  This is the current
  exact-bank surface, but it needs new geometric production, not wrappers.
- **Relaxed/candidate-free producer:** regenerate or reuse relaxed/sub-mask row
  certificates so finite row closures no longer require exact non-fixed
  `candidateMasks` membership.  This should be checked first, because the
  project already has relaxed singleton split certificate infrastructure.

**P3 — decision gate: run the CONJECTURED-tier joint-census appendix.**
Cheapest experiment that can name the missing exclusion content for the
BLOCKED sites and the two surviving rows (right `(0,0,0,4)`, left
`(0,0,4,0)`).  Sweep the CONJECTURED cut tier over the incidence classes
matching these configurations ({{NEEDS_RESEARCH}} — the class-key mapping
from row spec to census class must be written down first).  Outcomes:
- Some conjectured cut kills the matching classes → that cut names the lemma
  to prove; the exclusion routes through the existing cross-separation
  interfaces.  Proceed to P4a.
- No kill at the CONJECTURED tier either → the exclusion content is outside
  the entire current cut vocabulary.  Proceed to P4b.

2026-07-08 bounded run: `sweep-global --layer L2 --tier conjectured
--summary-only` was run for `n = 12..15`.  The result was all SAT
(`11,223` tested, 0 UNSAT, 0 INDETERMINATE).  Do not claim P3 complete from
this bounded smoke; the row-to-class mapping and any larger targeted sweep
remain open.  The useful current conclusion is only that the stronger cut tier
does not immediately name a kill at the smallest profiles.

**P4a — prove the named cut and thread it.**  Prove the killing cut as a
Lean lemma over the pinned frame, extend the seeded-shadow/cross-separation
consumers, close 9339/9367 and the surviving rows through the existing
finite-scaffold adapters.  Scope known only after P3.

**P4b — new vocabulary decision (Adam).**  Candidates, none currently
concrete: a surplus-index selected-class contradiction bypassing Mode A
(stated alternative at sites 9339/9367, no known shape); real/convex-layer
content beyond equality-Nullstellensatz (the witnesses already satisfy
convexity, so this means new *global* real content, e.g. joint constraints
at richer layers than L2); or minimality-based descent not expressible in
the local pin.  {{NEEDS_ADAM_INPUT}} — route selection is a pivot-level
decision.

2026-07-08 source-surface review: the current direct P4 branches already
construct a `U5DangerousTriple`, a selected candidate from
`exists_selectedCandidateSkeleton_of_card_gt_nine`, the exact erased-pin radius
class via `u5ExactRadiusClassCard_of_erasedPinTriple`, and two off-circle
support points from `U5DangerousTriple.exists_two_off_circle_aux`.  Existing
`SurplusM44Packet` erased-pin triple theorems apply to non-surplus payload
centers in `oppInterior1`/`oppInterior2`; they do not close the direct
surplus-opposite or surplus-interior payload centers.  Existing U5 support
theorems still require a `U5ModeA D` or equivalent global support-confinement
producer.  Treat P4 as a real missing cut/producer, not a search problem over
the current non-surplus row bank.

**Order.**  P1 is no longer live in the current source.  P2 and P3/P4 can run
in parallel.  P2 reduces the theorem to the two direct-branch sorries plus
whatever P3/P4 supply.  Nothing in P2 depends on the P4 outcome.  Closure of
the theorem = P2 + (P4a or P4b succeeding on both direct branches and both
surviving rows).

## Q Closure Gate

The current certificate work is useful infrastructure, but it does not by
itself close Q.  The live gate status on the `Problem97.erdos97_rhs` spine is:

```text
slot-2 endpoint residual                         OPEN
slot-2 pinned surplus residual, m = 5            OPEN as part of the publish
                                                  theorem
slot-2 pinned surplus residual, general m >= 6   OPEN or replaced by a
                                                  named on-spine residual
slot-2 erased-pin triple residual                OPEN
slot-3 double-apex, (5,5,4) finite slice         OPEN
slot-3 double-apex, |A| > 11 / uniform tail      OPEN
slot-3 liveData branch count                     OPEN or replaced by a
                                                  strictly narrower residual
```

Q should be considered closed only when every row above has been promoted to
`CLOSED`, or to the explicitly named replacement residual state shown in the
row.

Consequences:

- A successful generated certificate build counts as infrastructure only until
  a consuming theorem appears on the proof spine.
- The exact pinned bank can close only the label-complete `m = 5` regime unless
  a separate relaxed/sub-mask or confinement theorem justifies general `m`.
- The finite `(5,5,4)` double-apex census cannot be extrapolated to the
  large-cardinality tail without the uniform-rigidity workstream below.
- If the liveData branch remains SAT under the finite core vocabulary, progress
  must come from a new geometric producer, not another wrapper around the same
  equality split.

## What is already closed

The non-`IsM44` descent adapter is in the right shape:

```lean
Problem97.removableVertexOfLarge_of_nonIsM44 :
  NonIsM44DescentStatement
```

It is config-level, not packet-level.  It builds `CounterexampleData` on the
carrier `A`, derives minimality/no-removable/critical-shell data from the
strong-induction hypothesis, discharges the exact-pair cap-triple branch using
`¬ ∃ S : SurplusCapPacket A, S.IsM44`, and calls
`u1_largeCap_routeB_tail_false` on the non-exact surplus branch.

The double-apex downstream kill is also closed once the residual pair exists:
`oppCap2_escape_gen` turns two off-surplus carrier points that are co-radial from
both packet apices into `False`.

The remaining content of `DoubleApexOffSurplusSharedRadiusPair` is therefore the
metric/certificate claim that the two-large-cap leaf hypotheses force such a
pair, or are themselves inconsistent.

## Non-goals

Do not copy more code from `../p97-rvol` for `U1LargeCapRouteBTail.lean`; the
source and imported files are already aligned.

Do not close the direct `sorry`s in `u1_largeCap_routeB_tail_liveData_false` by
adding more local equality-case wrappers.  The p97-rvol notes classify those
branches as SAT under the finite core vocabulary unless real large-cap,
cap-arc, no-collision, or metric certificate content is added.

Do not introduce new theorem families that merely restate
`DoubleApexOffSurplusSharedRadiusPair`.  A new lemma only counts if it is wired
into the spine and either proves a certificate fact, rules out a finite family,
or strictly narrows the residual.

## Closure workstream A: slot-3 double-apex residual

Target:

```lean
Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair
```

Current proof-facing shape:

1. `leafSurplusPacket` constructs the packet used by the residual from the live
   cap-triple binders, so the `CP.capAt i` large-cap leverage and the
   reflection kill now talk about the same packet.
2. `DoubleApexOffSurplusSharedRadiusPair` asks for two distinct carrier points
   outside that packet's surplus cap, co-radial from both opposite apices.
3. `exists_removableVertex_of_twoLargeCaps` obtains that pair and immediately
   applies `oppCap2_escape_gen`, so a proof of the residual closes the
   `false_of_center_p_t2_t20` subtree.

Concrete plan:

1. Port the p97-rvol metric-census tooling into this repo only when it produces
   a proof artifact or a spine-consuming theorem.  The relevant source artifacts
   are under
   `../p97-rvol/scratch/u1_2_faithful/twolargecap_core/`, especially
   `u12_metric.py`, `certify_globalcount_table.py`, and the
   `u12_metric_sample100_verdicts.jsonl`/global-count certificate outputs.
2. Build the exact constrained census for the `(5,5,4)` two-large-cap slice.
   The needed result is an exhaustive canonical family, not another sampled
   verdict.  Canonicalization must preserve the designated surplus cap: the two
   5-caps are not interchangeable at this leaf because the surplus cap is the
   one containing the escaped point.  Before trusting a full run, smoke-test the
   encoding against the known sampled `(5,5,4)` verdicts and verify that no
   symmetry quotient erases the surplus designation.
3. For each canonical no-double-apex cube, emit a Lean-checkable certificate in
   the existing polynomial-certificate style.  Reuse the
   `EndpointCertificate.Checker` schema only if the generated systems match its
   equality-certificate interface; otherwise add a parallel checker with the
   same exact-rational identity discipline.
4. Add one on-spine theorem, consumed directly by
   `DoubleApexOffSurplusSharedRadiusPair`, that maps the leaf hypotheses into
   the finite census family and applies the certificate row.
5. After each row-family milestone, run:

   ```bash
   cd lean && lake-build Erdos9796Proof.P97.U1LargeCapRouteBTail
   proof-blueprint spine Problem97.u1_largeCap_routeB_tail_liveData_false --max-depth 4
   ```

Open uniformity gate:

The finite-bank route must either handle `|A| > 11` or prove a reduction from
the general two-large-cap leaf to the `(5,5,4)` slice.  K4 is not known to be
downward-hereditary, so this cannot be assumed.

## Closure workstream B: live-data branch count

Target:

```lean
Problem97.u1_largeCap_routeB_tail_liveData_false
```

The direct `sorry`s inside this theorem are still on-spine.  However, the
current p97-rvol plan says the older equality leaves are not closed by raw
branch enumeration.  They need one of:

- a real collision/no-collision producer consumed by the branch;
- large-cap/cap-arc provenance that makes the equality cube inconsistent;
- a metric certificate theorem that the branch calls; or
- a stronger packet-label-centered surface that avoids the known no-collision
  conflict.

Acceptable progress in this workstream is narrowly defined:

1. Close a direct `sorry` with an existing named theorem or certificate surface.
2. Replace several direct `sorry`s by one strictly narrower on-spine residual.
3. Delete branch freedom by adding a proved case split whose branches are all
   either closed or consumed by a named residual.

Do not add a helper theorem unless the same change wires it into
`u1_largeCap_routeB_tail_liveData_false`.

## Closure workstream D: uniform-rigidity for the large-cardinality tail

Target:

```lean
Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair
```

This workstream owns the part of workstream A that the finite `(5,5,4)` census
does not cover.  The `|A| = 12` minimal-core census recorded in
`docs/audits/2026-07-06-frontier-missed-angle-analysis.md` makes a pure finite
bank extension unattractive: at and above `|A| = 12` the mined core families do
not collapse to the `(5,5,4)` slice.  Therefore full closure needs a uniform
metric-rigidity argument, not just more row generation.

First tasks:

1. Run a focused literature/proof search for the missing uniform rigidity
   principle: two large caps plus the route-B tail hypotheses should force the
   off-surplus shared-radius pair or an earlier contradiction.
2. Run the sparsity-invariant separation test over the mined large-cardinality
   cores from the missed-angle analysis.  The goal is to identify an invariant
   that separates the real leaf hypotheses from the non-flattening finite
   cores, or to prove that the proposed invariant is not the right one.
3. Only after one of those tasks produces a named theorem surface should it be
   wired into `DoubleApexOffSurplusSharedRadiusPair`.  Until then, the plan's
   full-closure endpoint is conditional on this workstream, not on workstream C.

July 7 acceleration probes:

- `census/q3_two_center/` records the formulation and encoder library for the
  smallest cross-center window around the two chord-sharing vertices.  It is a
  verdict-table probe only, not Lean production; any UNSAT result still needs an
  exact certificate or a theorem surface before it can close the
  `DoubleApexOffSurplusSharedRadiusPair` tail.
- `scratch/u12-census-port/gen_singular_shadow.py` and `_min_core_sound.py`
  are small Singular/msolve probes for fixed center-K4 shadows.  They are useful
  for finding candidate infeasible cores, but they do not replace the uniform
  metric-rigidity theorem required by this workstream.

## Closure workstream C: sibling certificate-bank obligations

These are not inside the current U1 anchor, but they are on the same
`erdos97_rhs` publish spine and use the certificate infrastructure already in
this repo.

Status owner: `docs/four-point-subpacket-live-frontier.md` is the live
slot-2/certificate frontier.  This section records historical checkpoints and
high-level dependencies only; before executing endpoint, pinned-surplus, or
erased-pin work, read the live frontier and proof-blueprint spine state.

### Endpoint residuals

Target:

```lean
Problem97.isM44EndpointResidualsExcluded
```

Existing artifacts:

- `certificates/endpoint/*.json` contains the 117 endpoint certificates.
- `Erdos9796Proof.P97.EndpointCertificate.Checker` is the pure certificate
  checker.
- Generated Lean modules under
  `Erdos9796Proof.P97.EndpointCertificate.Patterns` expose row facts.

Plan:

1. Confirm every row module builds, especially the sharded `EpQ1008` row.
2. Prove the faithfulness bridge from
   `SurplusCapPacket.EndpointEscapeLeftAt` /
   `SurplusCapPacket.EndpointEscapeRightAt` to one of the 117 certified
   endpoint patterns.
3. Wire the bridge into `isM44EndpointResidualsExcluded`.

Progress on 2026-07-06:

- Step 1 is complete. `lake-build
  Erdos9796Proof.P97.EndpointCertificate.Patterns.All` succeeds.
- The endpoint emitter now gives sharded rows the same `_valid` public theorem
  shape as direct rows, with the theorem proving the row's `checkProductSum`
  identity.
- The aggregate uses `checkProductSum` for the term-sharded rows:
  `ep_Q1_008`, `ep_Q1_009`, `ep_Q1_028`, `ep_Q2_002`, `ep_Q2_008`,
  `ep_Q2_019`, `ep_Q2_020`, `ep_Q2_024`, `ep_Q2_041`, `ep_Q2_054`,
  `ep_Q2_064`, and `ep_Q2_074`.
- `lake-build Erdos9796Proof.P97.RemovableVertexAxiom` also succeeds after the
  endpoint-row changes; remaining warnings are the pre-existing lint and `sorry`
  warnings outside the endpoint aggregate.
- Added `Erdos9796Proof.P97.EndpointCertificate.ShadowBank`, a finite
  shadow-bank surface for the 117 endpoint rows.  It records the endpoint
  `Q1`/`Q2` escape labels, the endpoint-specific `.v`/`.w` shape checks, and
  `allEndpointRows_valid`.
- Extended `Erdos9796Proof.P97.EndpointCertificate.Geometry` with the geometric
  endpoint-shadow bridge.  A left or right endpoint residual now produces the
  induced finite endpoint shadow and discharges the endpoint-specific `.v`/`.w`
  Boolean shape checks, leaving only the generic finite-bank checks and row
  coverage/soundness surface explicit.
- Added `Erdos9796Proof.P97.EndpointCertificate.Bank`, which pairs the finite
  shadow rows with the generated algebraic certificate aggregate and proves the
  two lists are id-aligned.  This module imports the full endpoint aggregate and
  is intentionally kept out of the main spine until the certificate soundness
  bridge consumes it.
- Extended `Bank` with `certifiedEndpointRows_entries` and
  `exists_certifiedEndpointRow_of_endpointShadowInBank`.  Boolean endpoint
  row-bank membership now yields an actual paired row/certificate entry whose
  checker Boolean is proved true.  This is still only the finite lookup and
  checker-identity layer; it does not yet assert the Nullstellensatz/geometric
  soundness theorem needed for contradiction.
- Extended `Bank` again with
  `exists_alignedCertifiedEndpointRow_of_endpointShadowInBank`, so the same
  membership hypothesis now returns a checked row/certificate pair whose row id
  is proved equal to the generated certificate id.  This removes another lookup
  obligation from the later row-data bridge.
- Added `Erdos9796Proof.P97.EndpointCertificate.Soundness`, a theorem-facing
  semantic layer for the endpoint checker.  It defines real-valued evaluation
  for endpoint sparse monomials/terms/polynomials and proves that checker
  normalization, addition, multiplication, product sums, and certificate
  cofactor sums preserve evaluation.  The public contradiction surfaces are
  `false_of_checkCertificate` for direct rows and `false_of_checkProductSum`
  for sharded product-sum rows, under the corresponding zero-evaluation
  hypotheses.  It also includes the reusable sharded-row bridge lemmas
  `evalPoly_eq_zero_of_mulPoly_eq_right_zero` and
  `evalPoly_target_eq_zero_of_checkProductSumEq`, which turn generated
  partial-product identities and checked block sums into zero-evaluation facts.
  To support this without importing `Mathlib` into every generated row,
  `Checker` now exposes its polynomial helper definitions while the proofs live
  in the separate `Soundness` module.
- Extended the generated certificate aggregate so each checked row now carries
  its algebraic payload: direct rows carry the full `Certificate`, and
  term-sharded rows carry the checked block list.  The endpoint emitter was
  updated to preserve this `CertificatePayload` surface on regeneration.
- Added `Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness`, connecting
  checked aggregate payloads to `Soundness` through
  `false_of_verifiedDirectCertificate`, `false_of_verifiedProductSum`, and the
  unified `false_of_verifiedCertificate` theorem.
- Added `Erdos9796Proof.P97.EndpointCertificate.BankSoundness`, which composes
  finite row-bank membership with aggregate payload soundness:
  `false_of_endpointShadowInBank_of_payload_zeros` turns
  `endpointShadowInBank` into `False` once the matching row payload has its
  semantic zero-evaluation condition.
- Added `Erdos9796Proof.P97.EndpointCertificate.Variables`, recording the
  17-column endpoint certificate variable order
  `ux, uy, s1x, s1y, s2x, s2y, s3x, s3y, pwx, pwy, pux, puy, q1x, q1y,
  q2x, q2y, tau` and the corresponding geometric real assignment.
- Added `Erdos9796Proof.P97.EndpointCertificate.PolynomialGeometry`, with
  reusable evaluation lemmas for the recurring endpoint generator shapes:
  squared-distance differences to a common center, squared-distance differences
  to `(1,0)`, squared-norm differences, point-to-`(1,0)` distance differences,
  and the frame equation `2 * X - 1`.
- Added `Erdos9796Proof.P97.EndpointCertificate.ShadowSearch`, isolated from
  the geometry imports.  It contains the endpoint DFS reachability bridge:
  every shadow satisfying `endpointShadowOK` is accepted by the computed
  endpoint search.
- A raw depth-2 endpoint subtree check is too coarse: a single `.Q1/.v/.w`
  branch took about 62 seconds.  Splitting one level deeper to fixed
  `.Q1/.v/.w/.u` subtrees brings an individual branch certificate under one
  second, while regrouping the 33 `.u` branches under one `.v/.w` pair again
  crossed a minute.  The remaining coverage work should generate sharded
  depth-3 certificates rather than hand-writing grouped depth-2 checks.
- Added generated depth-3 endpoint search shards under
  `Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards`.  The shard
  predicate is deliberately guarded: each fixed `.Q1`/`.Q2`, `.v`, `.w`, `.u`
  subtree proves that every `endpointShadowOK` leaf in the relaxed DFS is
  present in `endpointRowEntries`.  The unguarded raw predicate is too strong,
  because the relaxed DFS also reaches endpoint-shaped completions that fail the
  full endpoint shadow contract.
- `lake-build
  Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.All` succeeds.  The
  worst eight-mask chunks are slow, with the longest observed shard around 228
  seconds; if this area is edited often, split those chunks further before
  expanding the certificate surface.
- Added `Erdos9796Proof.P97.EndpointCertificate.ShadowSearchCoverage`, proving
  `ShadowBank.Search.endpointShadowInBank_of_endpointShadowOK`.  Thus the finite
  endpoint incidence bridge is now closed at the shadow-bank layer:
  `endpointShadowOK` implies membership in the 117-row endpoint bank.
- Added `Erdos9796Proof.P97.EndpointCertificate.GeometryCoverage`, which keeps
  the generated-search imports out of lightweight `Geometry` while composing the
  left/right endpoint residual geometry bridge with
  `endpointShadowInBank_of_endpointShadowOK`.  The new left/right theorems reach
  `ShadowBank.endpointShadowInBank` once the generic finite-shadow component
  checks from `Geometry` are supplied.
- Extended `GeometryCoverage` with endpoint-specific adapters from finite
  point-mask interfaces to the generic COMP-G shadow checks.  The left/right
  residual bridge now also has finite-interface entry points:
  `endpointLeft_residual_exists_endpointShadowInBank_of_mask_interfaces` and
  `endpointRight_residual_exists_endpointShadowInBank_of_mask_interfaces`.
  These discharge the endpoint `.v`/`.w` shape checks geometrically and reduce
  the remaining incidence work to exact mask-cardinality, no-self, one-hit,
  circumcenter, no-three, pair-count, and separation facts for the induced
  ten-label shadow.
- The finite coverage source is
  `../p97-rvol/scratch/u2b_oppcap2_endpoint/fragment/`: `frag_ep.py` is the Z3
  Boolean encoder, `indep_ep.py` is the independent pure-Python DFS,
  `gen_json.py` emits `endpoint_fragment_models_20260701.json`, and
  `finalcheck.py` reloads and checks the 117-model JSON.  The corresponding
  finite-shadow coverage is now represented as Lean theorems in this repo.
- `lake-build Erdos9796Proof.P97.EndpointCertificate.Soundness` succeeds.
  `lake-build Erdos9796Proof.P97.EndpointCertificate.Patterns.All`,
  `lake-build Erdos9796Proof.P97.EndpointCertificate.Bank`,
  `lake-build Erdos9796Proof.P97.EndpointCertificate.AggregateSoundness`, and
  `lake-build Erdos9796Proof.P97.EndpointCertificate.BankSoundness`,
  `lake-build Erdos9796Proof.P97.EndpointCertificate.Variables`, and
  `lake-build Erdos9796Proof.P97.EndpointCertificate.PolynomialGeometry` also
  succeed.  One full downstream Bank rebuild took 12m02s because the `Checker`
  helper visibility change invalidated the generated row cache; the later
  payload-surface rebuilds completed under two minutes.
- Proof-blueprint is runnable again as of 2026-07-06.  After
  `proof-blueprint index --refresh`, `proof-blueprint spine
  Problem97.erdos97_rhs --max-depth 6` reports the P97 publish spine open at
  six obligations: the five live `sorry` symbols
  `Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`,
  `Problem97.isM44EndpointResidualsExcluded`,
  `Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`,
  `Problem97.isM44PinnedSurplusResidualsExcluded`,
  `Problem97.u1_largeCap_routeB_tail_liveData_false`, plus the corresponding
  `sorryAx` closure.  `Lean.trustCompiler` is approved in `.blueprint.toml`
  under the project's native-decision policy; `sorryAx` remains the unapproved
  axiom closure while these spine sorries are open.  The
  current `proof-blueprint anchor` checkpoint points at
  `Problem97.isM44EndpointResidualsExcluded`.  The non-surplus containment
  erased-pin theorem is open on the publish spine; its reduced-input `sorry` is
  local and load-bearing inside that theorem.  After the count-family rewire,
  `proof-blueprint axioms
  Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`
  reports only core axioms plus `sorryAx`.  The publish target still reaches
  `Lean.trustCompiler` through other generated/native certificate paths.
- The remaining endpoint work is now narrower: connect each generated row's
  algebraic data to the row payload `evaluationZeros` condition using the new
  variable and polynomial-geometry surfaces, prove the row-specific geometric
  zero-evaluation facts for the induced residual shadow's finite-mask
  interface, and wire
  `BankSoundness.false_of_endpointShadowInBank_of_payload_zeros` into
  `isM44EndpointResidualsExcluded`.
- July 7 support audit: the coefficient-aware endpoint surface is not, by
  itself, a payload-only bridge.  A read-only pass over the exact endpoint bank
  found no row whose active nonzero distance support is covered only by the
  residual `.v`/`.w` payload classes, and a bounded Singular check on the
  smallest exact rows found no alternative payload-only certificate.  The
  smallest minimized concrete support found so far is `ep_Q2_023`.  Its
  minimized certificate still uses the residual `.v` equations, non-payload
  equations centered at `s3`, `Pw`, and `Pu`, and the forced `s1 != s3`
  Rabinowitsch separator.  The K4 fallback route does not supply these facts:
  `HasNEquidistantProperty 4` gives four ambient classmates at each carrier
  point, but `S.IsM44` does not confine the surplus cap to the ten endpoint
  labels.  The next endpoint work must therefore produce those row-specific
  geometric facts, add a real residual relation that rules out unsupported
  cases, or regenerate a certificate over a strictly smaller residual
  vocabulary; adding more weighted dispatch wrappers does not close the leaf.
- `PolynomialGeometry` now also proves zero-evaluation consequences for the
  reusable generator shapes: equal squared distances to a variable center,
  equal squared distances to `(1,0)`, equal squared norms, equal point-to-center
  and point-to-`(1,0)` distances, the forced-collapse Rabinowitsch polynomial
  `tau * |a - b|^2 - 1`, and the frame equation `ν x = 1 / 2`.
  `lake-build Erdos9796Proof.P97.EndpointCertificate.PolynomialGeometry`
  succeeds with these lemmas.
- `PolynomialGeometry` and `GeneratorZeros` now also cover the two
  opposite-orientation generator shapes found by the endpoint census:
  `1 - |a|^2` and `|b - a|^2 - |a|^2`.  The metric-shadow wrapper layer covers
  every classified endpoint distance-generator orientation: variable-center
  two-witness equations, `.v` and `.w` center equations, `.v`/`.w` unit-radius
  equations, variable-center equations with one endpoint anchor, and the
  `.v`/`.w` frame equation `2 * x - 1`.
- The endpoint certificate generator family is classified: a read-only check
  over the 117 JSON certificates found 3510 distance-equation generators and
  115 Rabinowitsch distinctness generators, with no unclassified generators.
  The saved nonzero-support census already reports no unclassified active
  generators.
- Added `Erdos9796Proof.P97.EndpointCertificate.NormalAxisVariables`, which
  packages the endpoint certificate assignment obtained from
  `normalAxis (pointOf .v) (pointOf .w)` and proves the endpoint versions of
  the normal-axis distance-equality, unit-radius, and nonzero coordinate
  squared-distance facts.  `lake-build
  Erdos9796Proof.P97.EndpointCertificate.NormalAxisVariables` succeeds; the
  only warnings are pre-existing lints in imported cap modules.
- Added `Erdos9796Proof.P97.EndpointCertificate.MetricShadow`, a theorem-facing
  semantic wrapper for endpoint finite shadows.  It records injectivity of the
  label interpretation and the same-radius meaning of finite selected classes,
  then exposes the corresponding endpoint normal-axis squared-distance and
  unit-radius equalities.  `lake-build
  Erdos9796Proof.P97.EndpointCertificate.MetricShadow` succeeds.
- Added `Erdos9796Proof.P97.EndpointCertificate.GeneratorZeros`, which
  specializes the forced-collapse `s1 = s3` Rabinowitsch generator to the
  endpoint normal-axis assignment and derives all reusable endpoint generator
  zeros from `EndpointMetricShadow`.  `lake-build
  Erdos9796Proof.P97.EndpointCertificate.GeneratorZeros` succeeds.
- Extended `scripts/endpoint-certificate.py` with a direct-row zero emitter.
  It classifies each direct-row generator from the source JSON, reduces it to
  one of the reusable `GeneratorZeros` shapes, and uses
  `evalPoly_eq_zero_of_normalizePoly_eq` plus `native_decide` to transfer from
  the generated sparse-polynomial literal to the reusable shape.
- Generated direct endpoint row-zero modules under
  `Erdos9796Proof.P97.EndpointCertificate.RowZeros.Direct`.  These prove
  `Patterns.CertificatePayload.evaluationZeros (.direct Patterns.ep_...)` for
  each non-product-sum endpoint row from `EndpointMetricShadow pointOf
  row.toShadow`.  `lake-build
  Erdos9796Proof.P97.EndpointCertificate.RowZeros.Direct.All` succeeds.  The
  only warnings in the run were the pre-existing cap-module lints.
- Extended `scripts/endpoint-certificate.py` with a product-sum row-zero
  emitter for the twelve sharded endpoint rows.  It emits per-block zero
  modules using `evalPoly_eq_zero_of_mulPoly_eq_right_zero` and
  `evalPoly_target_eq_zero_of_checkProductSumEq`, then emits one row
  coordinator per product-sum certificate.
- The product row coordinators avoid simplifying the entire generated block
  list.  Large rows such as `ep_Q1_008` and `ep_Q2_041` hit Lean's recursion
  limit when the coordinator used `simp` to expand `List.mem`; the emitter now
  unfolds the concrete block list with `change` and peels membership with
  `List.mem_cons.mp` one block at a time.
- Generated product endpoint row-zero modules under
  `Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product`.  These prove
  `Patterns.CertificatePayload.evaluationZeros (.productSum Patterns.ep_..._blocks)`
  for each product-sum endpoint row from `EndpointMetricShadow pointOf
  row.toShadow`.  `lake-build
  Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.All` succeeds.  The
  only warnings in the confirming run were the pre-existing cap-module lints.
- Added `Erdos9796Proof.P97.EndpointCertificate.RowZeros.Bank`, the bank-level
  row-zero dispatcher.  It proves that a matched
  `rowCert ∈ Bank.certifiedEndpointRows` carries the required
  `rowCert.2.payload.evaluationZeros` condition by transporting
  `EndpointMetricShadow` across the matched finite-mask equality and dispatching
  to the generated direct or product-sum row-zero theorem.  It also exposes the
  public contradiction surface
  `false_of_endpointShadowInBank_of_metricShadow`, which feeds those row-zero
  facts into `BankSoundness.false_of_endpointShadowInBank_of_payload_zeros`.
  `lake-build Erdos9796Proof.P97.EndpointCertificate.RowZeros.Bank` succeeds.
- The direct row-zero generator now suppresses `linter.unusedSimpArgs` in the
  generated direct files.  This removes the warning flood from the repeated
  `simp [endpointS1S3Assignment, EndpointVar.eval]` proofs while keeping the
  suppression scoped to regenerated certificate rows.
- `RowZeros.Bank.false_of_endpointShadowInBank_of_metricShadow` has been wired
  through the endpoint residual stack.  The remaining work is the formal
  residual bridge: from the endpoint residual hypotheses, build the induced
  finite endpoint shadow, prove `EndpointMetricShadow pointOf shadow`, and
  obtain `ShadowBank.endpointShadowInBank` using the existing `GeometryCoverage`
  mask-interface entry points plus the needed mask-cardinality/no-self/one-hit/
  circumcenter/no-three/pair-count/separation facts.
- Added `Erdos9796Proof.P97.EndpointCertificate.ResidualSoundness`, composing
  the residual geometry bridge, endpoint row-bank coverage, and generated
  row-zero dispatch.  The new left/right theorems
  `endpointLeft_residual_exists_false_of_mask_interfaces` and
  `endpointRight_residual_exists_false_of_mask_interfaces` show that each
  residual is contradictory once the induced shadow is supplied with
  `EndpointMetricShadow` and the generic finite-mask interfaces.
  `lake-build Erdos9796Proof.P97.EndpointCertificate.ResidualSoundness`
  succeeds.
- `ResidualSoundness` now also exposes
  `endpointMetricShadow_of_selectedClass_interfaces`: injective endpoint labels,
  a selected-class choice for every center, and a bit-to-class membership
  interface imply `EndpointMetricShadow`.  This moves the metric part of the
  endpoint leaf from a raw semantic assumption to concrete selected-class and
  membership obligations.  `lake-build
  Erdos9796Proof.P97.EndpointCertificate.ResidualSoundness` succeeds after this
  bridge.
- The same module also exposes
  `endpointMetricShadow_of_endpointPointMask_selectedClass_interfaces`, the
  induced-shadow version of that bridge.  `Geometry` now proves
  `endpointPointMask_maskHas_mem`, so the point-mask bit-to-class membership
  step is closed generically rather than left as a caller-supplied interface.
- `ResidualSoundness` now also exposes
  `false_of_endpointShadowInBank_of_selectedClass_interfaces`, composing
  endpoint row-bank membership with those selected-class interfaces directly.
  This removes the raw `EndpointMetricShadow` premise from the next endpoint
  wiring layer; the remaining semantic obligations are the selected-class
  choices for the induced point masks.
- Added the left/right selected-class residual continuations
  `endpointLeft_residual_exists_false_of_selectedClass_interfaces` and
  `endpointRight_residual_exists_false_of_selectedClass_interfaces`.  These are
  the broad proof-facing handoff for `isM44EndpointResidualsExcluded`: they
  retain the finite mask-cardinality, no-self, one-hit, circumcenter, no-three,
  pair-count, and separation obligations, but replace the raw metric-shadow
  assumption with selected-class choices.
- Added the finite endpoint mask facts
  `endpointVMask_card_of_v_mask`, `endpointVMask_not_self_of_v_mask`,
  `endpointWMask_card_of_w_mask`, `endpointWMask_not_self_of_w_mask`,
  `endpointWMask_cvNoW_le_one_of_w_mask`, and
  `endpointWMask_cuNoW_le_one_of_w_mask`, plus the left/right core handoffs
  `endpointLeft_residual_exists_false_of_selectedClass_core_interfaces` and
  `endpointRight_residual_exists_false_of_selectedClass_core_interfaces`.
  These discharge the residual-controlled `.v`/`.w` mask-cardinality,
  no-self, and `.w` one-hit facts internally.  `lake-build
  Erdos9796Proof.P97.EndpointCertificate.ResidualSoundness` succeeds after
  both core handoffs.
- Added `Erdos9796Proof.P97.EndpointCertificate.ResidualCoreData`, first
  exposing the data-first selected-class handoffs
  `endpointLeft_residual_exists_false_of_selectedClass_core_data` and
  `endpointRight_residual_exists_false_of_selectedClass_core_data`, then the
  finite-shadow handoffs
  `endpointLeft_residual_exists_false_of_metric_shadow_data` and
  `endpointRight_residual_exists_false_of_metric_shadow_data`.
  The on-spine theorem `isM44EndpointResidualsExcluded` now consumes the
  finite-shadow handoffs directly.  Its old broad top-level `sorry` has been
  narrowed to two local producers, one for each endpoint orientation, of
  finite endpoint row-bank membership plus an `EndpointMetricShadow`:
  `∃ shadow, endpointShadowInBank xLabel shadow = true ∧
  EndpointMetricShadow pointOf shadow`.  The handoff now exposes the residual
  `aLabel`/`bLabel` payload labels and exact `.v`/`.w` selected-class masks as
  data, but those exact row-mask equalities are no longer part of the local
  `hshadow` target.  A producer may still use them when choosing a compatible
  row.  `lake-build
  Erdos9796Proof.P97.RemovableVertexAxiom` succeeds after this refactor.
- `ResidualCoreData` now also exports
  `∀ center, pointOf center ∈ A` from each endpoint data handoff.  The endpoint
  theorem no longer tries to manufacture the non-payload selected classes with
  arbitrary `Classical.choose` radii from `hK4`.  The previous
  `EndpointSelectedClassFiniteBundle` surface has been removed from the live
  Lean interface because exact selected-class identities for all ten endpoint
  labels are stronger than the row-zero consumer needs and are not supplied by
  the current residual geometry.
- `ResidualCoreData` now derives the `.u` one-hit bounds internally as well.
  `Geometry` provides
  `endpointPointMask_cvNoUMask_le_one_of_inter_card` and
  `endpointPointMask_cwNoUMask_le_one_of_inter_card`, which convert adjacent-cap
  intersection card bounds for the three relevant endpoint labels into the
  finite `cvNoUMask`/`cwNoUMask` mask-intersection checks.  The left/right
  endpoint data handoffs apply these bridge lemmas using the adjacent-cap
  one-hit lemmas from `SurplusM44Packet.lean`.  The remaining local endpoint
  `sorry`s are the two finite row-bank metric-shadow producers described
  above.  The selected-class core-data handoffs now also derive non-`.v`/`.w`
  no-self facts from selected-class radius positivity using
  `endpointPointMask_maskHas_self_false_of_selectedClass`; they no longer take
  a separate finite no-self premise for those centers.  The still-open
  producer content is the non-`.v`/`.w` mask-cardinality, circumcenter,
  no-three, pair-count, and separation side of a genuine induced endpoint
  shadow, or a replacement relaxed/submask endpoint vocabulary.
- Added coefficient-aware direct certificate soundness through
  `Soundness`, `AggregateSoundness`, `BankSoundness`, and `RowZeros.Bank`.
  The public bank-level surface is
  `false_of_endpointShadowInBank_of_weighted_metricShadow`.  This is a useful
  compatibility checkpoint, but the current implementation still reuses the
  full row-zero dispatch rather than a minimized lifted-support bridge.
- The current endpoint leaf boundary is no longer algebraic certificate
  soundness, fallback-radius plumbing, or an all-label selected-class bundle.
  The remaining endpoint work is the genuine general-`n` producer for finite
  endpoint row-bank metric shadows using the residual's exposed exact `.v`/`.w`
  payload masks where they are actually justified, or a relaxed/submask
  endpoint bridge that consumes only label incidences supplied by the residual
  geometry.  Do not spend proof effort
  trying to prove exact ten-label masks for arbitrary `Classical.choose`
  fallback classes; that fallback producer has been removed from the live
  branch.
- July 7 check: the exact-row producer cannot be treated as a universal
  finite-table lookup from the currently exposed residual predicates.  The row
  bank has uncovered syntactic payload triples, and a matching row would still
  need full `EndpointMetricShadow` same-radius facts for all incident row bits.
  Continuing the leaf now means either strengthening the residual data with a
  real payload relation and full metric producer, or replacing the endpoint
  consumer with a relaxed/submask row-zero bridge.
- July 7 execution note: the existing cap/reflection lemmas do not eliminate
  the neighboring-apex payload cases.  In the left endpoint orientation,
  `aLabel = .w` asserts the `.v`-centered selected class contains the shared
  `.w` Moser endpoint; the endpoint residual's final inequality rules out the
  `.u`-to-`.v` first-radius equality, not this `.v`-to-`.w` equality.  The
  mirror/right orientation has the analogous live `bLabel = .v` case.  Thus
  canonicalizing the three surplus-interior labels is insufficient; the next
  proof-producing step must either prove new geometric relations for those
  live cases or mine a certificate vocabulary that does not require them.
- July 7 targeted support probe: for `ep_Q2_023`, using the actual finite
  row's residual-supplied `.v`/`.w` equations plus the `s1 != s3`
  Rabinowitsch separator gives base indices `[3,4,5,6,7,8,30]`, whose Singular
  standard basis starts with
  `q1x^2+q1y^2-q2x^2-q2y^2-2*q1x+2*q2x`, not `1`.  The minimal unit extension
  inside the stored nonzero support has size six:
  `[15,16,17,18,19,21]`, namely
  `dist2(s3,v)=dist2(s3,w)`,
  `dist2(s3,v)=dist2(s3,s1)`,
  `dist2(s3,v)=dist2(s3,Pu)`,
  `dist2(Pw,w)=dist2(Pw,s3)`,
  `dist2(Pw,w)=dist2(Pw,Pu)`, and
  `dist2(Pu,v)=dist2(Pu,w)`.  The stored active equation
  `dist2(Pu,v)=dist2(Pu,Pw)` is not needed for this minimized row, but the
  remaining six equations are still centered at non-residual labels and are not
  supplied by the current cap/selected-class residual data.  The existing
  weighted bank surface also does not solve this: its generated dispatch still
  obtains weighted zeros from full `EndpointMetricShadow`, so it is only a
  future call-site for support-minimized row proofs, not a closure mechanism by
  itself.
- `proof-blueprint spine Problem97.isM44EndpointResidualsExcluded --max-depth 4`
  re-mined `RemovableVertexAxiom` after the metric-shadow refactor and reports
  42/43 project nodes closed.  The only open project symbol in this target is
  `Problem97.isM44EndpointResidualsExcluded`, through the two direct local
  finite row-bank metric-shadow producer `sorry`s.  The residual handoff
  exposes exact `.v`/`.w` selected-class masks, but the local `hshadow`
  obligations are just bank membership plus `EndpointMetricShadow`.
  `sorryAx` remains the unapproved axiom closure.  The endpoint certificate
  subtrees excluded by `[mining].skip` remain covered by the `#print axioms`
  gate.
- July 7 build checkpoint: `ErasedPinFixedSeedDFS` now records the generated
  erased-pin seed mask audits as Boolean `List.all` facts and
  `SurplusCOMPGBankGeometry` extracts the membership-shaped consequences via
  `List.all_eq_true`.  This removes the recursion-depth failure from the three
  erased-pin seed private-mask checks.  `lake-build
  Erdos9796Proof.P97.ErasedPinFixedSeedDFS`,
  `lake-build Erdos9796Proof.P97.SurplusCOMPGBankGeometry`, and
  `lake-build Erdos9796Proof.P97.RemovableVertexAxiom` all succeed; the
  remaining warnings are pre-existing lints plus the live spine `sorry`s.

### Pinned surplus residuals

Target:

```lean
Problem97.isM44PinnedSurplusResidualsExcluded
```

Existing artifacts:

- `certificates/surplus/pinned_surplus_comp_g_bank.json`
- `certificates/surplus/relaxed_split_singleton/*.json` (135 singleton
  relaxed split coefficient certificates)
- `certificates/surplus/reports/pinned_surplus_relaxed_split_singleton_probe.{json,md}`
- `certificates/surplus/reports/pinned_surplus_relaxed_split_singleton_certificate_census.{json,md}`
- `Erdos9796Proof.P97.SurplusCOMPGBank`
- `Erdos9796Proof.P97.SurplusCOMPGBankDFS`
- `Erdos9796Proof.P97.SurplusCOMPGBankGeometry`
- `Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.All`
- `Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.Bank`
- `Erdos9796Proof.P97.SurplusCertificate.AggregateSoundness`
- `Erdos9796Proof.P97.SurplusCertificate.BankSoundness`
- `Erdos9796Proof.P97.SurplusCertificate.ExactBridge`
- `Erdos9796Proof.P97.SurplusCertificate.GeometryBridge`
- `Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.All`
- `Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.All`
- `Erdos9796Proof.P97.SurplusCertificate.RowZeros.Bank` (verified by locked
  single-file Lean compile after the range-dispatch split)

Closed interfaces already available:

- `pinnedRightSurplusResidual_exists_candidateMasks_vw`
- `pinnedLeftSurplusResidual_exists_candidateMasks_vw`
- `isValidPinnedFragment_shadowOfPointClasses_of_mask_interfaces_pinned_v`
- `endpointMetricShadow_shadowOfPointClasses_of_sameRadius`
- `pinnedSurplusCOMPGBankBridge`

Plan:

Regime split:

- `m = 5`: the exact ten-label shadow is faithful.  The existing exact-bank
  consumers may be used: construct the exact `shadowOfPointClasses`, prove
  `isValidPinnedFragment_shadowOfPointClasses_of_mask_interfaces_pinned_v`,
  apply `pinnedSurplusCOMPGBankBridge`, and then discharge the matching relaxed
  singleton certificate row through the exact-pid bridge.
- `m >= 6`: do not treat exact ten-mask bank membership as closure.  This route
  must either prove a relaxed/sub-mask faithfulness theorem that maps the
  formal payload directly to a relaxed singleton split row, prove a confinement
  theorem that makes the needed non-`{v,w}` centers faithful, or introduce a
  named on-spine general-`m` pinned-surplus residual.  A wiring commit for
  `isM44PinnedSurplusResidualsExcluded` must state which regime it closes.

The implementation items below are therefore not one linear general-`m` recipe:
items 1, 3, and 4 are exact-bank work for the `m = 5` regime unless preceded by
one of the general-`m` faithfulness/confinement theorems just listed.

1. From each formal pinned residual, construct the ten-label geometric model and
   `shadowOfPointClasses`.
2. Prove the remaining geometric mask/prefix facts for centers not already
   covered by the pinned `.v` and exact `.w` mask equalities.  For the
   general-`m` route this should target the relaxed singleton split vocabulary,
   not the exact 135-row completion masks.
3. In the exact `m = 5` route, apply
   `isValidPinnedFragment_shadowOfPointClasses_of_mask_interfaces_pinned_v`.
4. In the exact `m = 5` route, apply `pinnedSurplusCOMPGBankBridge`.
5. Add the relaxed split metric verdict boundary.  The algebraic side is no
   longer blocked on certificate generation: the fully singleton relaxed split
   has 135 `unit` leaves, all 135 certificate JSON files parse cleanly, and
   `lake-build Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.All`
   succeeds.  The generated aggregate has 136 top-level Lean modules including
   `All.lean`, 34 term-sharded certificate directories, and 2729 shard modules;
   the last recorded clean aggregate build took 15m03s.  The aggregate now
   carries proof-facing payloads.
   `Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.Bank` builds, recording
   the 135 singleton row ids/case ids/leaf ids/split paths/exact completion
   pids/common erased masks and proving row-id/certificate-id alignment plus
   `exists_certifiedRelaxedSplitRow_of_rowIdInBank`.
   `Erdos9796Proof.P97.SurplusCertificate.AggregateSoundness` builds, exposing
   `false_of_verifiedCertificate` for a checked relaxed split payload plus its
   zero-evaluation hypotheses.
   `Erdos9796Proof.P97.SurplusCertificate.BankSoundness` builds and exposes
   `false_of_relaxedSplitRowIdInBank_of_payload_zeros`, which composes row-id
   membership with the aggregate soundness theorem.
   `Erdos9796Proof.P97.SurplusCertificate.ExactBridge` builds and exposes
   `false_of_shadowInBank_of_payload_zeros`, which maps exact
   `SurplusCOMPGBank.shadowInBank` membership to the matching singleton
   relaxed split certificate row by exact pid.  It now also proves that the
   matched relaxed row's common masks and stored member strings agree with the
   corresponding exact row masks.
   `Erdos9796Proof.P97.SurplusCertificate.GeometryBridge` builds and composes
   that finite alignment with `shadowOfPointClasses`: stored common-mask
   members in the matched relaxed row are now proved to appear as bits/classes
   in the induced geometric shadow.  Under `EndpointMetricShadow`, the bridge
   also proves equal normal-axis coordinate squared distances and zero
   evaluation for every distance-equation generator family found in the relaxed
   singleton metadata: common-center/two-ordinary, common-center fixed `.v`
   member, common-center fixed `.w` member, common-center `.v`/`.w` frame,
   exact `.v` center, exact `.w` center, and exact `.w` center unit-radius
   shapes.  It now also covers the relaxed separator Rabinowitsch generators:
   variable-variable separators such as `u=s1` use the pair-distance
   Rabinowitsch adapter, and fixed-`.v` separators such as `u=v` use the
   new `rabinowitschSqNormPoly` adapter.  At the generator-shape level, the
   relaxed singleton metadata is fully classified.
6. For the exact `m = 5` route, build the proof-facing bridge from a formal
   pinned residual to one of the exact pinned-bank shadows, then supply the
   remaining zero-evaluation facts needed by
   `false_of_shadowInBank_of_payload_zeros`.  For the general-`m` route, replace
   this with a relaxed row-id bridge or leave the named residual described
   above.  Current checkpoint:
  `scripts/pinned-surplus-certificate.py` has an
  `--emit-relaxed-split-direct-row-zeros` mode and now derives the direct vs.
  product split from the emitted Lean certificate coordinators (`_generators`
  vs. `_blocks`) instead of from the older source-size threshold.  With the
  current emitted certificate layer this gives 101 direct relaxed singleton
  row-zero coordinators under
  `Erdos9796Proof/P97/SurplusCertificate/RowZeros/Direct`, plus an aggregate
  import file.  The generated direct layer is now sharded into:
   exact-pid mask-bit fact modules under `RowZeros/ExactMaskBits`, per-row
   polynomial shape facts under `RowZeros/ShapeFacts`, and per-generator
   geometric zero proofs under `RowZeros/Direct/GeneratorZeros`.
   A representative regenerated shard target,
   `lake-build
   Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.GeneratorZeros.R001NoSeparatorR001N.G00`,
   succeeds; that target also rebuilt the `R001` exact-mask and shape-fact
   shards.  Broad row/coordinator and aggregate builds remain too expensive for
   routine feedback because Lake fans out through all generator shards; use
   narrow shard targets while finishing compile-scaling.  The row coordinator
   has been reduced to an index-based dispatcher over `List.get_of_mem`, with
   no polynomial list-membership comparison.  July 7 focused verification:
  `lake-build
  Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct.R001NoSeparatorR001N`
  succeeds; after the imported generator-zero shards are warm, the final row
  coordinator elaboration took 83s.  Product-sum row-zero lifting for the
  term-sharded payloads is now emitted for every product-sum coordinator in the
  singleton relaxed-split certificate layer: the same script has an
  `--emit-relaxed-split-product-row-zeros` mode that generated 34 row
  coordinators under `RowZeros/Product`, plus the `RowZeros/Product/All.lean`
  aggregate with `productSumRowZeroCertificateIds.length = 34`.  Focused
  verification:
  `lake-build
  Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006`
  succeeds; after warm imports its final row coordinator took 98s.  Focused
  verification of the largest product row,
  `lake-build
  Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYNYN`,
  also succeeds across 182 block-zero modules; after warm imports its final
  row coordinator took 96s.  Focused verification of a newly reclassified
  product row,
  `lake-build
  Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NN`,
  succeeds across its generated block-zero modules; the final row coordinator
  took 97s.  The generated block files prove each product block zero from the
  existing geometric generator metadata and checked partial-product identities,
  and the row coordinators prove
  `CertificatePayload.evaluationZeros (.productSum ...)`.  A generated
  `RowZeros/Bank.lean` now imports the direct/product aggregates and supplies
  the row-local `∃ ν, rowCert.2.payload.evaluationZeros ν` witness consumed by
  `false_of_shadowInBank_of_exists_payload_zeros`, producing
  `RowZeros.false_of_shadowInBank_of_metricShadow`.  July 7 integration
  history: a broad
  `lake-build Erdos9796Proof.P97.SurplusCertificate.RowZeros.Bank` reached the
  final `RowZeros.Bank` module after compiling the direct/product row-zero
  dependencies, then failed only on deterministic heartbeat timeouts in the
  135-row dispatch list.  The original timeout source was repeated
  `Fin.mk n (by native_decide)` bounds, which re-evaluated the large
  `certifiedRelaxedSplitRows` table once per row.  A second broad retry was
  stopped at `14774/17183` after confirming that Lake can spend several minutes
  in product coordinator modules before the bank dispatcher is checked; for
  example `R014UeqvR014YY` and neighboring product modules emitted after about
  400 seconds.  Treat that as dependency fanout cost and avoid repeating the
  broad target for routine coordinator feedback.

  The bank dispatcher is now range-split at the emitter level in
  `scripts/pinned-surplus-certificate.py`: the generated file defines nine
  15-row `certifiedRelaxedSplitRowsRangeXX` chunks, proves one private
  zero-witness lemma per chunk, and keeps
  `exists_payload_zeros_of_certifiedRelaxedSplitRow` as a thin membership
  router.  The row-index bounds use
  `rw [certifiedRelaxedSplitRows_length]; norm_num`, and branch proofs call the
  direct/product row-zero theorems by `exact` rather than simplifying the full
  payload expression.  Focused verification now succeeds:
  `/usr/bin/lockf -k .lake/lake-build.lock lake env lean -M 16384
  Erdos9796Proof/P97/SurplusCertificate/RowZeros/Bank.lean -o
  .lake/build/lib/lean/Erdos9796Proof/P97/SurplusCertificate/RowZeros/Bank.olean
  -i
  .lake/build/lib/lean/Erdos9796Proof/P97/SurplusCertificate/RowZeros/Bank.ilean`
  exits 0 in about 13 seconds.  The 8 GB version fails with a Lean memory cap
  exception, so keep the normal 16 GB cap for this coordinator check.  A broad
  Lake rebuild has not been rerun after the split because the single-file check
  is the intended feedback path for this generated-heavy module.

  Compile-scaling guidance for this checkpoint: do not add more certificate
  sharding for `RowZeros.Bank`.  For small edits to the bank coordinator, use
  the locked single-file compile above.  Use a broad `lake-build
  Erdos9796Proof.P97.SurplusCertificate.RowZeros.Bank` only when a final
  Lake-scheduler confidence check is worth the known generated-dependency
  fanout cost.

  Proof-closure guidance for this checkpoint: once
  `RowZeros.false_of_shadowInBank_of_metricShadow` builds, the certificate side
  is no longer the main blocker for the exact `m = 5` route.  The fastest
  closure path is to stay inside the publish-spine theorem
  `isM44PinnedSurplusResidualsExcluded`, construct the exact ten-label
  `shadowOfPointClasses` from a formal pinned residual, use the existing
  candidate-mask interfaces to prove `isValidPinnedFragment`, apply
  `pinnedSurplusCOMPGBankBridge`, and then feed the resulting `shadowInBank`
  plus a metric-shadow proof to `RowZeros.false_of_shadowInBank_of_metricShadow`.

  The metric-shadow side should use
  `endpointMetricShadow_shadowOfPointClasses_of_sameRadius` in
  `SurplusCOMPGBankGeometry.lean`.  The bridge reduces the metric obligation to
  injectivity of the ten-label point model and same-radius facts for each
  `centerClass center`.  Injectivity is already returned by
  `pinnedRightSurplusResidual_exists_validFragment_of_candidate_interfaces` and
  its left mirror.  Selected-class centers should not be treated as missing:
  `SelectedClass` is a distance level set
  (`WitnessPacketInterface.mem_selectedClass`), with
  `dist_self_of_mem_selectedClass` available for the point-first orientation.
  The remaining metric-shadow work is therefore to account for the cap-centered
  exact `.v`/`.w` classes (`S.capByIndex ...`) and then thread these facts
  through the existing right/left pinned candidate-interface handoffs.  There is
  a useful existing shortcut for this when non-surplus Moser-cap containment is
  available:
  `SurplusCapPacket.exact_cap_class_at_index_of_cap_card_eq_four` produces
  `SelectedClass A (S.oppositeVertexByIndex i) radius = S.capByIndex i`, and
  `dist_opposite_eq_of_mem_capByIndex_of_exact` reads same-radius facts out of
  that equality.  This should not be used circularly inside
  `isM44PinnedSurplusResidualsExcluded`: the current statement does not take
  `S.NonSurplusMoserCapContainment`, and the containment producers in this file
  are downstream of endpoint/pinned residual exclusions.  Treat it as a speed
  path only if containment can be supplied non-circularly or the spine is
  explicitly refactored to make it an input.  Otherwise, if a full same-radius
  proof for the cap-centered classes cannot be recovered from the current formal
  residual surface, replace the broad pinned theorem by a named on-spine
  residual that states exactly that missing metric-shadow producer; do not add
  an off-spine wrapper around the bank theorem.  The current bridge and checked
  polynomial identities alone are not yet a geometric contradiction.

  July 7 speed check: `nthdegree docs search --lean` ranks
  `endpointMetricShadow_shadowOfPointClasses_of_sameRadius` and the existing
  finite pinned-fragment interface lemmas as the relevant Lean declarations.
  This matches the source audit above and gives no evidence that more
  certificate sharding is needed before attempting the on-spine proof wiring.

### Erased-pin triple residuals

Publish-spine theorem:

```lean
Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded
```

This theorem is open in the current proof-blueprint spine.  The remaining
erased-pin work is the local reduced-input proof inside that theorem, not a
parked off-spine theorem.

Current Lean boundary:

1. Use the existing exact-pin adapters in `RemovableVertexAxiom.lean`; do not
   bypass them.
2. The current finite-residual input asks for:
   - surplus-opposite Moser vertex direct `ErasedPinTriple` exclusion;
   - surplus-cap strict-interior direct `ErasedPinTriple` exclusions;
   - `ErasedPinFiniteCandidateScaffoldFacts S x` for the erased surplus point;
   - `oppIndex1` non-surplus strict interiors:
     `RightNonSurplusRoutedFiniteResidualRowsExcluded S x p`, now reduced to
     the pure surplus-side four-hit row `(0,0,0,4)`;
   - `oppIndex2` non-surplus strict interiors:
     `LeftNonSurplusRoutedFiniteResidualRowsExcluded S x p`, now reduced to
     the pure surplus-side four-hit row `(0,0,4,0)`.
3. Closed arithmetic adapters turn the finite rows into the universal family
   predicates:
   `rightNonSurplusExactCountRowsExcluded_of_routedRowsExcluded`,
   `leftNonSurplusExactCountRowsExcluded_of_routedRowsExcluded`,
   `countRowsFactsStatement_of_routedRowsFactsStatement`,
   `rightNonSurplusExactCountFamilyExcluded_of_rowsExcluded`,
   `leftNonSurplusExactCountFamilyExcluded_of_rowsExcluded`, and
   `countFamilyFactsStatement_of_countRowsFactsStatement`.
4. The closed count-budget bridge turns an erased-pin triple into one of those
   exact selected-count family rows using:
   `selectedCount_groupSum_eq_four_of_card`,
   `moserCount_oppIndex*_le_two_of_moserCapContainment`,
   `sameCapCount_oppIndex*_le_one`, and the surplus-side adjacent lower bound.
5. Let the closed adapters convert triple residual exclusions into exact-pin
   exclusions, erased-set selected-class witnesses, and finally
   `IsRemovableVertex`.

Correction after the two-hit probe: the old finite-facts statement passed
through the legacy `AdjacentChainOneHitData` reducer, but
`scratch/two-hit-probe/report.md` proves the adjacent one-hit upper bounds
false at non-surplus strict-interior centers.  Do not try to prove
`AdjacentChainOneHitData` for this branch.  The current Lean branch has been
rewired to the seeded-census/count-family shape that admits the verified
two-hit rows `(1,0,2,1)` and `(1,0,1,2)` and checks the remaining follow-up row
families `(0,1,2,1)`, `(0,0,2,2)`, and surplus-side at-least-three hits.

Current routed-row/count-family boundary:

- The local on-spine `sorry` proves
  `IsM44NonSurplusContainmentErasedPinTripleRoutedSeedFiniteResidualRowsFactsStatement`.
  The older pruned/routed seed-row surfaces and then the raw
  `IsM44NonSurplusContainmentErasedPinTripleCountRowsFactsStatement` are
  recovered by closed finite-residual, seed-row, and routed-row adapters.
- `RightNonSurplusExactCountRowsExcluded S x p` and
  `LeftNonSurplusExactCountRowsExcluded S x p` enumerate the 15 concrete rows
  per side.  Their closed adapters recover
  `RightNonSurplusExactCountFamilyExcluded S x p` and
  `LeftNonSurplusExactCountFamilyExcluded S x p`.
- Generated row/route artifacts are present in
  `certificates/surplus/erased_pin_count_rows.json`,
  `certificates/surplus/reports/erased_pin_count_rows.md`, and
  `lean/Erdos9796Proof/P97/ErasedPinCountRows.lean`.  They are generated by
  `scripts/erased-pin-row-census.py` and verified by:
  `LEAN_ROOT=/Users/adam/projects/math-projects/erdos-97-96-formalization/lean lake-build Erdos9796Proof.P97.ErasedPinCountRows`.
- The generated route census splits the 30 rows into:
  `18` left-right subpacket rows, `10` same-side-heavy rows, and `2`
  one-sided terminal rows.  The Lean routed surface now consumes this split:
  the two terminal rows reduce to generated seed-candidate inputs and then, by
  closed adapter, to erased one-sided payload exclusions.  The other 28 rows
  were row-exclusion targets before the structural row pruning below.
- Two generated rows are now closed structurally in Lean and removed from the
  local proof-facing obligation: right `(0,0,3,1)` and left `(0,0,1,3)`.
  Both require three hits in the other non-surplus strict interior, which has
  cardinality two in an `IsM44` packet.  The closing lemmas are
  `rightNonSurplusLeftAdjacentThreeRowExcluded` and
  `leftNonSurplusRightAdjacentThreeRowExcluded`, wired through
  `IsM44NonSurplusContainmentErasedPinTripleRoutedSeedPrunedRowsFactsStatement`.
- The terminal reduction is closed in Lean.  The strict cap-interior placement
  proves `dist p x > 0`; `selectedClass_card_eq_groupSum` turns the terminal
  count sum into a four-point selected class; then the existing one-sided
  obstruction constructors produce the erased payloads.  Therefore the terminal
  route now needs seed-candidate inputs, not row certificates or arbitrary
  payload-exclusion assumptions.
- `RightNonSurplusExactCountFamilyExcluded S x p` and
  `LeftNonSurplusExactCountFamilyExcluded S x p` are deliberately row-family
  predicates, not one-hit chain predicates.  They include the verified two-hit
  rows `(1,0,2,1)` and `(1,0,1,2)` rather than trying to prove them away.
- Existing one-sided chain/payload reducers in `SurplusM44Packet.lean` require
  adjacent upper bounds (`leftAdjCount <= 1` and `rightAdjCount <= 1`).  They may
  help for row-specific one-hit subcases after a census certificate supplies
  those bounds, but they do not replace the finite-row surface globally.
- The older finite/named/candidate/seed-mask inputs remain useful compiled
  support for the previous seeded-shadow route, but they are no longer the
  expected proof-facing local obligation for this theorem.
- The remaining local `sorry` is boundary-specified but not
  producer-complete.  Its concrete producer obligations are:
  `surplus-opposite` direct `ErasedPinTriple` exclusion; surplus-cap
  strict-interior direct `ErasedPinTriple` exclusions; the finite candidate
  scaffold; and the two pure surplus-side four-hit row exclusions, right
  `(0,0,0,4)` and left `(0,0,4,0)`.  It no
  longer has to
  construct arbitrary one-sided payload exclusions, terminal seed-candidate
  inputs, or `AdjacentChainOneHitData`.
- The erased-pin producer census is now generated by
  `scripts/erased-pin-producer-census.py`.  It writes
  `certificates/surplus/erased_pin_producer_census.json` and
  `certificates/surplus/reports/erased_pin_producer_census.md`.  The census
  expands each exact-count row into oriented ten-label selected-class masks and
  now runs the generalized one-sided fixed-seed DFS by default.  After the two
  already-closed pair-overflow rows, 28 proof-facing rows remained: 26 had
  finite ten-label masks and two rows required a surplus-extra bridge because
  they ask for four selected surplus-side hits inside a three-label surplus
  subpacket.  The finite-scaffold row bridges now close all 26 finite
  ten-label rows; only the surplus-extra rows right `(0,0,0,4)` and left
  `(0,0,4,0)` remain.
- July 7 producer result: the 26 finite rows have 660 named finite masks,
  deduplicating to 330 fixed seeds `(sstar, privateCenter, privateMask)` for
  the exact `.v/.w` cap-mask seeded search.  The generated DFS census finds
  zero completions for all 330 distinct seeds and zero completions for all 660
  named masks.  The Lean module
  `Erdos9796Proof.P97.ErasedPinFixedSeedDFS` emits and proves the fixed-seed
  zero theorem, and `Erdos9796Proof.P97.SurplusCOMPGBankGeometry` exposes the
  bridge
  `false_of_erasedPinFixedSeedShadow_pointClasses_of_seed_circ_interfaces` for
  point-class geometry with exact `.v/.w` cap masks and a generated private
  mask.
- Further Lean surface reshaping does not count as progress unless its adapter
  proves and removes one of those producer obligations.  The next proof step is
  to specialize one finite row family to a generated fixed seed and consume the
  bridge above, then repeat across the 13 oriented signatures; or prove the
  surplus-extra bridge for the two non-finite rows.  Deleting a direct
  surplus-side exclusion remains valid only if an existing theorem supplies it
  directly.
- Producer-plan correction, July 7: the previous sentence names the boundary
  but not the full producer theorem shape.  A finite-row producer is not just a
  row id plus a generated DFS seed; it must prove the geometric-to-finite
  translation:

  ```text
  exact count row
    -> named ten-label selected-class mask for the private center
    -> generated fixed-seed membership
    -> exact `.v/.w` cap masks and non-fixed candidate remainder
    -> generated DFS contradiction
  ```

  The first acceptable Lean target is one concrete theorem of shape
  `RightNonSurplusExactCountRowExcluded S x p m s l r` or its left mirror that
  consumes `false_of_erasedPinFixedSeedShadow_pointClasses_of_exact_vw_private_candidates`.
  A terminal producer may instead prove
  `RightNonSurplusOneSidedTerminalSeedInputs S x p` or
  `LeftNonSurplusOneSidedTerminalSeedInputs S x p`, because those are already
  consumed by the terminal payload adapters.  The same-side pure surplus-extra
  rows `(0,0,0,4)` and `(0,0,4,0)` are explicitly not covered by the ten-label
  fixed-seed ladder.
- Producer artifact update, July 7: `ErasedPinFixedSeedDFS.lean` now includes
  generated row and oriented-signature seed lists.  Each finite row/signature
  has a candidate seed list, a filtered fixed-bank seed list, a structural
  subset theorem into `erasedPinFixedSeeds`, an equality theorem showing the
  fixed-bank filter recovers exactly the candidate list, a direct
  candidate-list subset theorem, and a no-valid-shadow theorem for any seed in
  that row/signature candidate list.  The length theorem is now only the audit
  count; downstream proofs should use the equality/subset/no-valid facts
  instead of unfolding the generated bank.  Verified by:

  ```bash
  LEAN_ROOT=/Users/adam/projects/math-projects/erdos-97-96-formalization/lean lake-build Erdos9796Proof.P97.ErasedPinFixedSeedDFS
  ```

  This is not a row closure theorem yet; it is the finite-data handoff the
  first row producer should consume after it proves the geometric selected
  class lands in one of the listed row/signature seeds.
- Producer kind-normalization update, July 7: the fixed-bank list deduplicates
  generated seeds with `kind := .own`, while some proof payload branches still
  carry `.own`, `.oppositeU`, or `.oppositeW`.  Since the seeded validator and
  candidate masks ignore the kind tag, `ErasedPinFixedSeedDFS.lean` now emits
  `erasedPinCanonicalSeed`, `erasedPinCanonicalSeed_candidateMasks`,
  `isValidOneSidedSeedShadow_erasedPinCanonicalSeed`, and
  `false_of_isValidOneSidedSeedShadow_of_mem_erasedPinCanonicalSeed`.  This
  lets a producer enter the deduplicated fixed bank through the canonical
  `.own` seed without expanding the bank to three copies per seed.  Verified by:

  ```bash
  LEAN_ROOT=/Users/adam/projects/math-projects/erdos-97-96-formalization/lean lake-build Erdos9796Proof.P97.ErasedPinFixedSeedDFS
  LEAN_ROOT=/Users/adam/projects/math-projects/erdos-97-96-formalization/lean lake-build Erdos9796Proof.P97.SurplusCOMPGBankGeometry
  ```
- Upstream surplus-placement update, July 7:
  `SurplusCapPacket.IsM44.exists_surplusInterior_triple_preserving_subset`
  now embeds any surplus-interior subset of cardinality at most three into the
  named `s1/s2/s3` surplus labels.  This is the placement theorem needed by
  finite exact-row producers: the chosen three-label surplus subpacket can be
  selected after the row identifies all surplus-side selected hits, not merely
  after the erased point `x` is known.  Verified by:

  ```bash
  LEAN_ROOT=/Users/adam/projects/math-projects/erdos-97-96-formalization/lean lake-build Erdos9796Proof.P97.SurplusM44Packet
  ```
- First finite-row specialization update, July 7:
  `SurplusCOMPGBankGeometry.lean` now proves the row-level adapter for
  `ep_right_m0_s0_l2_r2`:
  `erasedPinRow_ep_right_m0_s0_l2_r2_seed_mem_candidates_of_surplus_pair`
  turns two distinct surplus labels plus `.Q1/.Q2` and a `.Pw/.Pu` private
  center into membership in the generated 12-seed row list, and
  `false_of_erasedPinRow_ep_right_m0_s0_l2_r2_seedShadow_pointClasses`
  closes any point-class shadow using such a listed row seed via the generated
  row no-survivor theorem.  `SurplusM44Packet.lean` now also proves
  `SurplusCapPacket.IsM44.right_row0022_selectedClass_eq_oppInterior2_union_surplusPair`:
  the exact count equalities `(0,0,2,2)` force the selected class at
  `oppIndex1` to be the named `oppInterior2` pair together with a two-point
  surplus-interior pair.  `SurplusCOMPGBankGeometry.lean` now also proves
  `right_row0022_exists_erasedPinRowSeed_privateMask`: after the two selected
  surplus-side points are embedded in the named `s1/s2/s3` triple, the row
  produces a generated row seed and the exact private-center mask needed by
  the row point-class contradiction.
  A later July 7 checkpoint narrows the row further:
  `erasedPinRow_ep_right_m0_s0_l2_r2_seed_private_w_crossSeparation_false`
  proves every generated `(0,0,2,2)` row seed fails cross-separation against
  the exact `.w` cap mask, and
  `false_of_right_row0022_private_w_crossSeparation` composes this finite fact
  with the exact row placement theorem.  The row can now close from the exact
  `.w` mask, the private-mask placement, and the geometric `hsearchSep`
  interface without building a complete ten-mask DFS shadow.
  Follow-up census scan, July 7: this cheap route applies to eight finite
  erased-pin rows, not only the proved right `(0,0,2,2)` row:
  `ep_right_m0_s0_l2_r2`, `ep_right_m0_s1_l2_r1`,
  `ep_right_m1_s0_l2_r1`, `ep_right_m2_s0_l1_r1`,
  `ep_left_m0_s0_l2_r2`, `ep_left_m0_s1_l1_r2`,
  `ep_left_m1_s0_l1_r2`, and `ep_left_m2_s0_l1_r1`.  The finite erased-pin
  row plan was then split into eight cross-separation-only rows, two threaded
  triple rows using the full fixed-seed DFS route, two threaded two-surplus rows
  using the full fixed-seed DFS route, fourteen finite ten-label rows needing a
  stronger validator or full fixed-seed DFS route, and two surplus-extra rows
  needing a separate surplus-extra bridge.  Later finite-scaffold row bridges
  closed the finite ten-label remainder; the current live row residue is only
  the two surplus-extra rows.
  Implementation update, July 7: `scripts/erased-pin-producer-census.py` now
  records private-`.v`/private-`.w` cross-separation incidence in the
  JSON/report output, and generated module `ErasedPinFixedSeedDFS.lean`
  exposes all eight row-wide
  `erasedPinRow_*_seed_private_w_crossSeparation_false` facts.  The hand
  geometry row0022 adapter now consumes the generated fact rather than owning a
  local duplicate.
  Second-pass scan of the eighteen residual finite rows found no local-mask or
  fixed-pair-count row kill.  It did find that every residual seed dies from
  the exact `.v/.w/private` masks plus at most three additional center labels;
  six mirrored rows have a uniform one-extra-center kill, while the other
  twelve need small mask-orbit splits.  The lowest-risk implementation is to
  emit shorter prefix no-survivor facts for the existing
  `oneSidedSeedSearchAux` order.  The faster geometric implementation is a new
  small-fragment adapter that consumes only the selected extra centers'
  `hsearchSep`/pair-count facts.
  Third July 7 checkpoint: `RemovableVertexAxiom.lean` now proves
  `false_of_right_row0022_finiteCandidateFacts`.  This closes the right
  exact row `(0,0,2,2)` from the finite point-class packet, the exact row
  counts, the `.w` mask, and the geometric `hsearchSep` table, by splitting
  the named opposite pair into the `.Pw`/`.Pu` private-center cases and then
  applying `false_of_right_row0022_private_w_crossSeparation`.
  The finite-scaffold wrapper
  `rightNonSurplusRow0022Excluded_of_finiteScaffold` closes
  `RightNonSurplusExactCountRowExcluded S x p 0 0 2 2` once the scaffold facts
  are available.  The row-truth relay found realizations for the non-closed
  left-right rows under the current ambient inputs, and the current
  `RightNonSurplusLeftRightSubpacketPrunedRowsExcluded` surface keeps only four
  count equalities.  It has already discarded the finite masks, named
  private-center placement, surplus-triple placement, and `hsearchSep` table
  needed by the generated contradiction.  The remaining row work is therefore
  to refine the on-spine producer surface so row0022 is consumed before that
  data is erased, not to assert bare row impossibility.
  Verified by:

  ```bash
  LEAN_ROOT=/Users/adam/projects/math-projects/erdos-97-96-formalization/lean lake-build Erdos9796Proof.P97.SurplusM44Packet
  LEAN_ROOT=/Users/adam/projects/math-projects/erdos-97-96-formalization/lean lake-build Erdos9796Proof.P97.SurplusCOMPGBankGeometry
  lake-build Erdos9796Proof.P97.RemovableVertexAxiom
  ```

  Fourth July 7 checkpoint: the right `(1,0,2,1)` finite row now follows the
  same exact-`.w` cross-separation route.  `SurplusM44Packet.lean` proves
  `IsM44.right_row1021_selectedClass_eq_moser_oppInterior2_surplus`, naming the
  selected class as the `oppInterior2` pair, one Moser-triangle vertex, and one
  surplus-interior point.  `SurplusCOMPGBankGeometry.lean` adds
  `exists_moserLabel_rightPinnedLabelPoint_eq_of_mem_triangle`,
  `pointMask_eq_QQSurplusMoserMask` and its swapped form, the generated seed
  membership lemma
  `erasedPinRow_ep_right_m1_s0_l2_r1_seed_mem_candidates_of_moser`, and the row
  seed contradiction
  `false_of_erasedPinRow_ep_right_m1_s0_l2_r1_seed_private_w_crossSeparation`.
  `RemovableVertexAxiom.lean` consumes those facts through
  `false_of_right_row1021_finiteCandidateFacts` and
  `rightNonSurplusRow1021Excluded_of_finiteScaffold`, so the local row exclusion
  is now closed once the finite scaffold facts are available.  The remaining
  on-spine producer work is to preserve that finite selected-class payload,
  private-center placement, surplus-triple placement, exact `.w` mask, and
  `hsearchSep` data long enough to call the row-specific finite-scaffold
  theorem.  Current finite-scaffold wrapper coverage for the cheap
  cross-separation route is now eight of eight rows:
  `rightNonSurplusRow0022Excluded_of_finiteScaffold`,
  `rightNonSurplusRow0121Excluded_of_finiteScaffold`,
  `rightNonSurplusRow1021Excluded_of_finiteScaffold`,
  `rightNonSurplusRow2011Excluded_of_finiteScaffold`,
  `leftNonSurplusRow0022Excluded_of_finiteScaffold`,
  `leftNonSurplusRow0112Excluded_of_finiteScaffold`,
  `leftNonSurplusRow1012Excluded_of_finiteScaffold`, and
  `leftNonSurplusRow2011Excluded_of_finiteScaffold`.  The final `m = 2`
  cases use
  `IsM44.right_row2011_selectedClass_eq_moserPair_oppInterior2_surplus`,
  `IsM44.left_row2011_selectedClass_eq_moserPair_oppInterior1_surplus`,
  the row seed/mask bridges
  `right_row2011_exists_erasedPinRowSeed_privateMask` and
  `left_row2011_exists_erasedPinRowSeed_privateMask`, and the finite fact
  adapters `false_of_right_row2011_finiteCandidateFacts` /
  `false_of_left_row2011_finiteCandidateFacts`.  The producer surface still
  has to pass the finite scaffold facts into the pruned left-right row
  obligation before that data is erased.

  Fifth July 7 checkpoint: the right and left `(2,0,1,1)` finite-scaffold
  bridges both compile.  Focused checks run from `lean/`:

  ```bash
  /usr/bin/lockf -k .lake/lake-build.lock lake env lean -M 16384 Erdos9796Proof/P97/SurplusM44Packet.lean -o .lake/build/lib/lean/Erdos9796Proof/P97/SurplusM44Packet.olean -i .lake/build/lib/lean/Erdos9796Proof/P97/SurplusM44Packet.ilean
  /usr/bin/lockf -k .lake/lake-build.lock lake env lean -M 16384 Erdos9796Proof/P97/SurplusCOMPGBankGeometry.lean -o .lake/build/lib/lean/Erdos9796Proof/P97/SurplusCOMPGBankGeometry.olean -i .lake/build/lib/lean/Erdos9796Proof/P97/SurplusCOMPGBankGeometry.ilean
  /usr/bin/lockf -k .lake/lake-build.lock lake env lean -M 16384 Erdos9796Proof/P97/RemovableVertexAxiom.lean -o .lake/build/lib/lean/Erdos9796Proof/P97/RemovableVertexAxiom.olean -i .lake/build/lib/lean/Erdos9796Proof/P97/RemovableVertexAxiom.ilean
  ```

  `RemovableVertexAxiom.lean` still reports the three expected live `sorry`
  warnings.  The remaining closure risk is producer-surface wiring, not the
  cheap finite-scaffold row wrapper proofs.

  Sixth July 7 checkpoint: the mirror triple rows are now threaded through the
  finite scaffold rather than left in the residual tuple.  The right row
  `(0,0,1,3)` / `ep_right_m0_s0_l1_r3` is closed by
  `rightNonSurplusRow0013Excluded_of_finiteScaffold`; the left row
  `(0,0,3,1)` / `ep_left_m0_s0_l3_r1` is closed by
  `leftNonSurplusRow0031Excluded_of_finiteScaffold`.  Both use selected-class
  decompositions naming one `.Q` point plus the three surplus labels, then
  transfer the terminal scaffold candidate remainder with
  `oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter` into the
  generated row no-survivor theorem.  At that checkpoint, the proof-facing
  finite residual source was the scaffold plus sixteen finite residual rows:
  six left-right rows and ten same-side-heavy rows.  Focused checks passed for
  `SurplusM44Packet.lean`, `SurplusCOMPGBankGeometry.lean`, and
  `RemovableVertexAxiom.lean`; the residual file still has only the three
  expected live `sorry` warnings.

  Seventh July 7 checkpoint: the right `(0,1,1,2)` finite row is no longer in
  the residual tuple.  `SurplusM44Packet.lean` adds
  `IsM44.right_row0112_selectedClass_eq_oppInterior2_singleton_sameCap_surplusPair`,
  naming one `.Q`/`oppInterior2` point, the same-cap private singleton, and
  both selected surplus-side points.  `SurplusCOMPGBankGeometry.lean` adds the
  one-Q/two-surplus/one-private mask adapters, the generated candidate
  membership lemma
  `erasedPinRow_ep_right_m0_s1_l1_r2_seed_mem_candidates_of_q_surplus_pair_same`,
  `right_row0112_exists_erasedPinRowSeed_privateMask`, and
  `false_of_erasedPinRow_ep_right_m0_s1_l1_r2_seedShadow_pointClasses`.
  `RemovableVertexAxiom.lean` consumes those through
  `false_of_right_row0112_finiteCandidateFacts` and
  `rightNonSurplusRow0112Excluded_of_finiteScaffold`, then shrinks
  `RightNonSurplusLeftRightSubpacketFiniteResidualRowsExcluded` to two right
  left-right residual rows.  At that checkpoint, the proof-facing finite
  residual source was the scaffold plus fifteen finite residual rows: five
  left-right rows and ten same-side-heavy rows.  Focused checks passed for
  `SurplusM44Packet.lean`, `SurplusCOMPGBankGeometry.lean`, and
  `RemovableVertexAxiom.lean`; `RemovableVertexAxiom.lean` still reports only
  the three expected live `sorry` warnings.

  Eighth July 7 checkpoint: the left mirror `(0,1,2,1)` finite row is also no
  longer in the residual tuple.  `SurplusM44Packet.lean` adds
  `IsM44.left_row0121_selectedClass_eq_oppInterior1_singleton_sameCap_surplusPair`.
  `SurplusCOMPGBankGeometry.lean` adds the mirror generated candidate
  membership lemma
  `erasedPinRow_ep_left_m0_s1_l2_r1_seed_mem_candidates_of_q_surplus_pair_same`,
  `left_row0121_exists_erasedPinRowSeed_privateMask`, and
  `false_of_erasedPinRow_ep_left_m0_s1_l2_r1_seedShadow_pointClasses`.
  `RemovableVertexAxiom.lean` consumes those through
  `false_of_left_row0121_finiteCandidateFacts` and
  `leftNonSurplusRow0121Excluded_of_finiteScaffold`, then shrinks
  `LeftNonSurplusLeftRightSubpacketFiniteResidualRowsExcluded` to two left
  left-right residual rows.  At that checkpoint, the proof-facing finite
  residual source was the scaffold plus fourteen finite residual rows: four
  left-right rows and ten same-side-heavy rows.  Focused checks passed for
  `SurplusM44Packet.lean`, `SurplusCOMPGBankGeometry.lean`, and
  `RemovableVertexAxiom.lean`; `RemovableVertexAxiom.lean` still reports only
  the three expected live `sorry` warnings.

  Ninth July 7 checkpoint: the same-side-heavy Moser-plus-surplus-triple pair
  is now threaded through the finite scaffold.  The right row `(1,0,0,3)` /
  `ep_right_m1_s0_l0_r3` is closed by
  `IsM44.right_row1003_selectedClass_eq_moser_surplusTriple`,
  `right_row1003_exists_erasedPinRowSeed_privateMask`,
  `false_of_right_row1003_finiteCandidateFacts`, and
  `rightNonSurplusRow1003Excluded_of_finiteScaffold`.  The left mirror row
  `(1,0,3,0)` / `ep_left_m1_s0_l3_r0` is closed by
  `IsM44.left_row1030_selectedClass_eq_moser_surplusTriple`,
  `left_row1030_exists_erasedPinRowSeed_privateMask`,
  `false_of_left_row1030_finiteCandidateFacts`, and
  `leftNonSurplusRow1030Excluded_of_finiteScaffold`.  The proof-facing finite
  residual source at that checkpoint was the scaffold plus ten finite residual rows:
  four left-right rows and six same-side-heavy rows.  Focused checks passed for
  `SurplusM44Packet.lean`, `SurplusCOMPGBankGeometry.lean`, and
  `RemovableVertexAxiom.lean`; `RemovableVertexAxiom.lean` still reports only
  the three expected live `sorry` warnings.

  Tenth July 7 checkpoint: the remaining `M1|S0|O1|X2` left-right pair is
  now threaded through the finite scaffold.  The right row `(1,0,1,2)` /
  `ep_right_m1_s0_l1_r2` is closed by
  `IsM44.right_row1012_selectedClass_eq_moser_oppInterior2_singleton_surplusPair`,
  `right_row1012_exists_erasedPinRowSeed_privateMask`,
  `false_of_right_row1012_finiteCandidateFacts`, and
  `rightNonSurplusRow1012Excluded_of_finiteScaffold`.  The left mirror row
  `(1,0,2,1)` / `ep_left_m1_s0_l2_r1` is closed by
  `IsM44.left_row1021_selectedClass_eq_moser_oppInterior1_singleton_surplusPair`,
  `left_row1021_exists_erasedPinRowSeed_privateMask`,
  `false_of_left_row1021_finiteCandidateFacts`, and
  `leftNonSurplusRow1021Excluded_of_finiteScaffold`.  The proof-facing finite
  residual source at that checkpoint was the scaffold plus eight finite
  residual rows: two left-right rows and six same-side-heavy rows.  Focused
  checks passed for `SurplusM44Packet.lean`,
  `SurplusCOMPGBankGeometry.lean`, and `RemovableVertexAxiom.lean`;
  `RemovableVertexAxiom.lean` still reports only the three expected live
  `sorry` warnings.

  Eleventh July 7 checkpoint: the last left-right pair, `M1|S1|O1|X1`, is now
  threaded through the finite scaffold.  The right row `(1,1,1,1)` /
  `ep_right_m1_s1_l1_r1` is closed by
  `IsM44.right_row1111_selectedClass_eq_moser_sameCap_oppInterior2_singleton_surplus`,
  `right_row1111_exists_erasedPinRowSeed_privateMask`,
  `false_of_right_row1111_finiteCandidateFacts`, and
  `rightNonSurplusRow1111Excluded_of_finiteScaffold`.  The left mirror row
  `(1,1,1,1)` / `ep_left_m1_s1_l1_r1` is closed by
  `IsM44.left_row1111_selectedClass_eq_moser_sameCap_oppInterior1_singleton_surplus`,
  `left_row1111_exists_erasedPinRowSeed_privateMask`,
  `false_of_left_row1111_finiteCandidateFacts`, and
  `leftNonSurplusRow1111Excluded_of_finiteScaffold`.  The current
  proof-facing finite residual source is now the scaffold plus six finite
  residual rows: the six same-side-heavy rows.  Focused checks passed for
  `SurplusM44Packet.lean`, `SurplusCOMPGBankGeometry.lean`, and
  `RemovableVertexAxiom.lean`; `RemovableVertexAxiom.lean` still reports only
  the three expected live `sorry` warnings.

  Twelfth July 7 checkpoint: the same-side-heavy `M1|S1|O0|X2` pair is now
  threaded through the finite scaffold.  The right row `(1,1,0,2)` /
  `ep_right_m1_s1_l0_r2` is closed by
  `IsM44.right_row1102_selectedClass_eq_moser_sameCap_surplusPair`,
  `right_row1102_exists_erasedPinRowSeed_privateMask`,
  `false_of_right_row1102_finiteCandidateFacts`, and
  `rightNonSurplusRow1102Excluded_of_finiteScaffold`.  The left mirror row
  `(1,1,2,0)` / `ep_left_m1_s1_l2_r0` is closed by
  `IsM44.left_row1120_selectedClass_eq_moser_sameCap_surplusPair`,
  `left_row1120_exists_erasedPinRowSeed_privateMask`,
  `false_of_left_row1120_finiteCandidateFacts`, and
  `leftNonSurplusRow1120Excluded_of_finiteScaffold`.  The current
  proof-facing finite residual source was then the scaffold plus four finite
  residual rows: right `(0,0,0,4)`, right `(2,0,0,2)`, left `(0,0,4,0)`, and
  left `(2,0,2,0)`.  Focused checks passed for
  `SurplusCOMPGBankGeometry.lean` and `RemovableVertexAxiom.lean`;
  `RemovableVertexAxiom.lean` still reports only the three expected live
  `sorry` warnings.

  Thirteenth July 7 checkpoint: the same-side-heavy `M2|S0|O0|X2` pair is now
  threaded through the finite scaffold.  The right row `(2,0,0,2)` /
  `ep_right_m2_s0_l0_r2` is closed by
  `IsM44.right_row2002_selectedClass_eq_moserPair_surplusPair`,
  `right_row2002_exists_erasedPinRowSeed_privateMask`,
  `false_of_right_row2002_finiteCandidateFacts`, and
  `rightNonSurplusRow2002Excluded_of_finiteScaffold`.  The left mirror row
  `(2,0,2,0)` / `ep_left_m2_s0_l2_r0` is closed by
  `IsM44.left_row2020_selectedClass_eq_moserPair_surplusPair`,
  `left_row2020_exists_erasedPinRowSeed_privateMask`,
  `false_of_left_row2020_finiteCandidateFacts`, and
  `leftNonSurplusRow2020Excluded_of_finiteScaffold`.  The current
  proof-facing finite residual source is now the scaffold plus two residual
  rows: right `(0,0,0,4)` and left `(0,0,4,0)`.  Focused checks passed for
  `SurplusCOMPGBankGeometry.lean` and `RemovableVertexAxiom.lean`;
  `RemovableVertexAxiom.lean` still reports only the three expected live
  `sorry` warnings.

  Local artifact checkpoint: `certificates/surplus/relaxed_split/` contains the
  70 grouped relaxed-split certificate JSON files from the pre-singleton pass,
  while `certificates/surplus/relaxed_split_singleton/` remains the 135-row
  source for the verified `RowZeros.Bank` dispatcher.  The grouped relaxed-split
  directory and `scratch/census-12-gate/` are large local artifacts and are
  intentionally ignored rather than committed.  The `scratch/census-12-gate/`
  state records the |A| = 12 window-shape CEGAR measurement for profile 654: 52
  banked certificates, 13 failed witnesses, and the state file classifies the
  result as a heuristic convergence gate, not a proof.
  `scratch/erased-pin-row-truth/` records the exact-rational row-truth probe:
  all searchable erased-pin rows and the two surplus-side probes have
  constructive local witnesses; the row exclusions therefore must be routed
  through the proof-facing finite-mask/cross-separation interfaces rather than
  asserted as local geometric impossibilities.
- Boundary check: the existing endpoint/pinned-surplus reducers in
  `SurplusM44Packet.lean` do not directly close the direct surplus-side
  erased triples in this count-family statement.  They reduce selected classes
  centered at the two non-surplus opposite vertices.  The minimality/exact-pin
  route is circular here, because exact erased pins are first converted to
  `ErasedPinTriple`s and only after all such triples are excluded do we obtain
  the erased-set `K4` witness.
- Verification after this rewire: focused `lake env lean -M 16384` checks
  succeed for `Erdos9796Proof/P97/SurplusM44Packet.lean`,
  `Erdos9796Proof/P97/SurplusCOMPGBankGeometry.lean`, and
  `Erdos9796Proof/P97/RemovableVertexAxiom.lean`; the last still reports the
  three expected live `sorry` warnings.
  `proof-blueprint spine
  Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded
  --max-depth 3` reports 340/341 nodes closed, with only the theorem's local
  source-level spine `sorry` open, reported in kernel axiom closure as
  `sorryAx`; `proof-blueprint spine
  Problem97.erdos97_rhs --max-depth 6` reports 1155/1177 nodes closed and
  still has the five live publish source-level `sorry`s, which appear in
  kernel axiom closure as `sorryAx`.  `proof-blueprint axioms
  Problem97.erdos97_rhs` currently reports `Lean.trustCompiler` as an approved
  custom axiom and `sorryAx` as the only unapproved custom axiom.

## Verification checklist

After any Lean change in this plan:

```bash
cd lean && lake-build Erdos9796Proof.P97.RemovableVertexAxiom
proof-blueprint spine Problem97.u1_largeCap_routeB_tail_liveData_false --max-depth 4
proof-blueprint spine Problem97.erdos97_rhs --max-depth 6
proof-blueprint axioms Problem97.erdos97_rhs
```

Proof-blueprint is part of the active verification path again.  If the index or
mined graph is stale, refresh it before reading open-obligation counts.

Blueprint caveats:

- Generated certificate subtrees may be skipped by the miner to keep the graph
  tractable.  That makes proof-blueprint usable for spine shape, but it does
  not by itself approve the trust cost of generated/native certificate leaves.
- `proof-blueprint axioms Problem97.erdos97_rhs` remains the live gate for
  native/generated trust boundaries and `sorryAx`.  As of this checkpoint,
  `Lean.trustCompiler` is reported as an approved custom axiom; source-level
  `sorry`s remain unproved and appear as unapproved `sorryAx` until the spine
  obligations close.
- A certificate module building is not the same as being on the proof spine.
  Wiring claims should cite a consuming spine theorem or a proof-blueprint diff,
  not just an olean or `lake-build` result.

Expected endpoint before full closure:

- `lake-build` succeeds.
- `u1_largeCap_routeB_tail_liveData_false` reports fewer open U1 obligations, or
  the same count with a strictly narrower on-spine residual.
- `erdos97_rhs` reports fewer open obligations.
- No new off-spine `sorry` is introduced by the active work.

Completion endpoint:

- `proof-blueprint spine Problem97.erdos97_rhs` is kernel-complete under the
  approved axiom set.
- `proof-blueprint verify-publish` passes.

## P1/P2 residual specification (2026-07-08, orchestrator + P1-session synthesis)

Sharpened structure of what remains, agreed between the P1 session's own
assessment and the orchestrator's code-level verification:

**P1 splits into a matching half and a nonmatching-orientation half.**  Each apex
enumeration order lands ONE hull template directly: one order gives the right
packet's template (`u, Q1, Q2, v, s1, s2, s3, w, Pw, Pu`), the other gives the
left/mirror template.  So each P1 sorry (right 9407, left 9436 at current
line numbers) decomposes as:

- *Matching half* — nearly free from the producers already landed (cap-block
  interval bridges, strict-interior index exports, reverse-complement
  orientation, `isCcwConvexPolygon_subsequence`): the side whose apex order
  agrees with the built template.
- *Nonmatching half* — needs an orientation-indexed producer surface or
  duplicated finite producer: the row consumer must be fed by the side whose
  CCW template is actually supplied by the boundary order, without asserting
  reverse preservation of the CCW finite hull order.

**Rejected route: reverse-CCW transport.**  A theorem of the shape
CCW/certificate for label order σ ⇒ CCW/certificate for ρ∘σ, where ρ is the
apex-order reversal, is not the right target for this proof surface.  The
generated separator uses `labelOfHullFin` through `btw_sep`, and reversing the
finite hull order changes chirality and the Boolean separation convention.
`ConvexCyclicOrder/Basic.lean` already has cyclic-shift transport, but not
reverse preservation of `IsCcwConvexPolygon`; treating that as the primary P1
route would try to prove the wrong geometric statement.

*Orchestrator code-level confirmation (2026-07-08): the rejection is forced,
not just preferred.*  The nonmatching-orientation sorries (currently
`RemovableVertexAxiom.lean:10021` and `:10051` — the 9407/9436 numbers above
have drifted) state goals that are geometrically FALSE in their branches:
`HullOrderSubsequenceCertificate A pointOf` forces `image φ = A` with
`IsCcwConvexPolygon φ`, so A is in convex position and its CCW cyclic order is
unique up to rotation; the right template forces apex order u→v→w along that
boundary while the branch hypothesis supplies u→w→v, and the free within-pair
choices (p₁/p₂, q₁/q₂, s-permutation) cannot change the apex cyclic order.  A
cyclic order and its reversal cannot both embed CCW into the same
convex-position set.  Consequence: no lemma can fill those sorries as written —
the refactor must change the branch call sites (which producer is invoked /
what orientation input it takes), not just supply a missing proof term.

**Primary route: finite-producer orientation refactor.**  Enumerate both
apex orientations as separate concrete producers or make the finite scaffold
orientation-indexed, so each row consumer receives the CCW template that the
boundary order actually supplies.  This duplicates/refactors the selector and
finite-producer boundary rather than transporting a reversed CCW certificate.
The expected work is interface and producer plumbing plus mirrored interval
bridges; the proof should not introduce a reverse-CCW lemma.

**P2 is sequenced strictly behind the P1 boundary.**  Sites 9415/9443 consume
`oneSidedSeedCandidateRemainder_of_mask_interfaces`-shaped hypotheses stated
over the ordered labels/masks that P1's boundary fixes.  P2 work started
before that interface freezes is rework risk with no offsetting gain.  Order:
P1 matching halves → orientation-indexed producer boundary → P2.

2026-07-08 update: the P1 boundary is now frozen in the current source,
including the reflected nonmatching branches.  P2 can proceed against the
current split ordered scaffold; do not reopen P1 unless a later build shows the
reflected producer path is invalid.

2026-07-08 refinement: after the P1 orientation refactor, the remaining P2
helpers are not just missing local ordered-label facts.  They also assert
candidate remainders for selected classes at a shared radius for centers that
are not row-payload centers.  The finite separator producer currently derives
prefix-count and separation facts from those selected classes, but it does not
derive the exact mask-cardinality/no-self/trigger facts needed by the generated
candidate filter.  The closure target is therefore a producer-surface change:
either carry explicit finite mask-interface facts through the ordered scaffold,
or delay terminal seed/candidate production until the row-specific payload
surface supplies the exact selected-class equalities.  Do not spend effort on a
lemma proving the current universal `hrightCandidate`/`hleftCandidate` goals as
written.

**Tally implication.**  P1 has closed the two CCW holes.  The live local hole
set is now two P2 candidate-remainder helpers and two P4 direct erased-pin
branches, all inside the one on-spine headline theorem.

2026-07-08 checkpoint: the nonmatching P1 orientation branches now build
without local `sorry`s.  The committed Lean route adds reflected same-radius
cross-separation producers, reduced reflected finite-packet producers, and
wires both nonmatching branches through the opposite orientation selector with
reversed labels.  The active theorem still has the two direct P4 holes and the
two P2 candidate-remainder holes.

2026-07-08 P2 checkpoint: the candidate-remainder holes are now classified as
producer-boundary holes, not tactic holes.  `oneSidedSeedCandidateRemainder` is
provable from the old explicit mask-interface fields, and the seed-mask to
seed-candidate adapters are already proved, but the current ordered finite
scaffold tries to obtain those candidate remainders before any such geometric
mask-interface data is available.  The next implementation pass should not
attempt to fill `hrightCandidate`/`hleftCandidate` in place.  It should first
test the relaxed/candidate-free finite-row route against the existing relaxed
singleton split certificate layer; if that route does not cover the active row
families, the fallback is a real ordered seed-mask producer for the exact
candidate surface.

2026-07-09 P2 route check: the relaxed/candidate-free route does not currently
expose an erased-pin replacement for the active ordered scaffold.  The existing
`SurplusCertificate.RelaxedSplit` layer is pinned-surplus bank machinery: it
aligns exact pinned-bank shadows with singleton relaxed split rows and supplies
checked common-mask/zero-evaluation facts.  It does not provide a theorem that
replaces
`RightOneSidedErasedPayloadFiniteCandidateSepFacts` or
`LeftOneSidedErasedPayloadFiniteCandidateSepFacts`, and it has no direct
consumer for the right/left one-sided erased payload rows.

The reusable P2 surface already in the Lean tree is instead the seed-mask
adapter:
`oneSidedSeedCandidateRemainder_of_mask_interfaces` and
`rightOneSidedErasedPayloadSeedCandidateInputs_of_seedMaskInputs`/
`leftOneSidedErasedPayloadSeedCandidateInputs_of_seedMaskInputs`.  Therefore
the next grounded producer should not be another candidate wrapper.  It should
either:

1. add right/left ordered seed-mask scaffold fields for the terminal payload
   path, carrying the exact mask-cardinality, no-self, `.u` one-hit,
   circumcenter, trigger, prefix-count, and separation interfaces; or
2. prove those same mask-interface fields directly for
   `rightPinnedErasedPayloadCenterClass` and
   `leftPinnedErasedPayloadCenterClass`, then close `hrightCandidate` and
   `hleftCandidate` by applying
   `oneSidedSeedCandidateRemainder_of_mask_interfaces`.

The second route is the smallest source-level change if the mask-interface
facts are derivable from the existing exact-cap/selected-class geometry.  If
they are not, the first route is the correct producer-boundary refactor:
terminal seed production must be delayed until the row-specific payload surface
supplies those exact selected-class/mask facts.

2026-07-09 terminal-row producer checkpoint: the generated terminal row
machinery is present but does not by itself close P2.  The right terminal row
`ep_right_m2_s1_l0_r1` and left terminal row `ep_left_m2_s1_l1_r0` both have
row seed lists, private-mask existence lemmas, and no-valid-shadow
contradictions.  Their consumers
`false_of_right_row2101_finiteCandidateFacts` and
`false_of_left_row2110_finiteCandidateFacts` still obtain the needed row seed
by splitting the erased payload private center, then consume the same
`OneSidedSeedCandidateRemainder` premise for the matching `.Pw`/`.Pu`
own-kind seed.  Because `OneSidedSeedCandidateRemainder` is a statement about
all non-fixed centers' masks being in `seed.candidateMasks`, the terminal row
data only identifies the fixed private mask; it does not prove the missing
non-fixed candidate memberships.  Therefore the next grounded implementation
target remains the ordered seed-mask/candidate producer boundary described
above, not a local rewrite of the terminal row consumers.

2026-07-09 relaxed erased-pin probe checkpoint: added
`scripts/erased-pin-relaxed-producer-probe.py` to test the exact finite
search surface obtained by removing `seed.candidateMasks` from the erased-pin
row producer.  The probe imports the existing erased-pin census generator and
checks fixed `.v`, `.w`, private masks, no-three/prefix counts, and
separation.  Results with `--max-survivors 1 --summary-only`:

- `--mode raw`: 189 closed / 330 total, 141 open.
- `--mode no_self`: 189 closed / 330 total, 141 open.  No-self alone removes
  nothing beyond raw because the open witnesses can use zero masks.
- `--mode shape`: 330 closed / 330 total.
- terminal rows `ep_right_m2_s1_l0_r1`/`ep_left_m2_s1_l1_r0`: raw and
  no-self close 15 / 18; the three open seeds are the opposite-`w` private
  masks `v,w,s*,otherPrivate`.  Shape closes 18 / 18.

Interpretation: a generated shape-relaxed DFS would be strong enough to
replace the full candidate predicate computationally, but only after the
proof-facing packet supplies exact-four/no-self mask shape for the non-fixed
centers.  That shape is not currently present in
`RightOneSidedErasedPayloadFiniteCandidateSepFacts`/
`LeftOneSidedErasedPayloadFiniteCandidateSepFacts`, and it is not automatically
available from the selected-class geometry used by
`rightPinnedErasedPayloadCenterClass`/`leftPinnedErasedPayloadCenterClass`.
The relaxed route is therefore not closed by generation alone.  The next
productive fork is:

1. prove real shape/mask-interface fields at the ordered row boundary and then
   use either the existing candidate adapter or a new shape-relaxed DFS; or
2. keep candidate generation row-specific and reduce the remaining cases to
   the 141 raw-open seeds, with special attention to the three terminal
   opposite-`w` private masks.

2026-07-09 symmetry bugcheck: the first symmetry probe used global pairwise
mask-membership symmetry and reported 312 closed / 330 total in raw and
no-self mode, leaving 18 seeds in four row IDs.  That assumption is too strong
for the active erased-payload scaffold: `.v` and `.w` are exact cap classes,
not same-radius selected classes, so membership against them is not symmetric
with the selected-class centers.  The script now distinguishes
`--symmetry-scope selected` from the overstrong `--symmetry-scope all`.

The proof-facing selected-center-only symmetry check gives no additional
finite cut:

- `--mode raw --symmetry-scope selected`: 189 closed / 330 total, 141 open.
- `--mode no_self --symmetry-scope selected`: 189 closed / 330 total, 141 open.
- `--mode shape --symmetry-scope selected`: 330 closed / 330 total.

The 141 no-self/selected-symmetry survivors affect 18 row IDs:
`ep_right_m0_s0_l1_r3`, `ep_right_m0_s1_l0_r3`,
`ep_right_m0_s1_l1_r2`, `ep_right_m1_s0_l0_r3`,
`ep_right_m1_s0_l1_r2`, `ep_right_m1_s1_l0_r2`,
`ep_right_m1_s1_l1_r1`, `ep_right_m2_s0_l0_r2`,
`ep_right_m2_s1_l0_r1`, and the nine left mirrors
`ep_left_m0_s0_l3_r1`, `ep_left_m0_s1_l2_r1`,
`ep_left_m0_s1_l3_r0`, `ep_left_m1_s0_l2_r1`,
`ep_left_m1_s0_l3_r0`, `ep_left_m1_s1_l1_r1`,
`ep_left_m1_s1_l2_r0`, `ep_left_m2_s0_l2_r0`,
`ep_left_m2_s1_l1_r0`.

Conclusion: selected-center symmetry is valid but not useful by itself.  The
remaining finite route is still the exact shape/mask-interface route, or a
row-specific candidate producer that supplies the same local mask facts without
claiming a universal candidate lemma at the current false P2 helper sites.

2026-07-09 source-refresh checkpoint: the current source still has exactly the
same active local gap set inside
`isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`: two direct P4
erased-pin branches plus the two P2 candidate-remainder helpers.  Re-running
the proof-facing relaxed probe confirms the earlier finite numbers:

- `--mode raw --symmetry-scope selected`: 189 closed / 330 total, 141 open.
- `--mode shape --symmetry-scope selected`: 330 closed / 330 total.

The extra geometric caveat is now explicit: the shape-relaxed DFS result is a
computational producer target, not yet a proof-facing producer.  Its `shape`
mode assumes every non-fixed center's ten-label mask has exact card four and
does not contain the center.  `HasNEquidistantProperty 4 A` only supplies some
four-point selected class at each center, and the existing erased-pin exact
pin lemmas supply the exact four-point class for the payload center.  They do
not imply that the shared radius `dist p x` gives exact four witnesses inside
the ten-label packet for every other center.  Therefore the shortest closed
P2 route is a real confinement/exact-shape bridge at the ordered row boundary:
prove that the K4 witness classes used by the finite DFS are represented by the
packet masks, then feed those shape facts to a generated shape-relaxed DFS or
to `oneSidedSeedCandidateRemainder_of_mask_interfaces`.  Without that bridge,
generating the shape-relaxed DFS only moves the obligation.

2026-07-09 frontier-census checkpoint: re-ran the canonical active-leaf
frontier report:

```text
env UV_CACHE_DIR=/private/tmp/uv-cache uv run python census/multi_center/frontier_report.py
```

The loaded L2 GLOBAL / PROVEN census is complete through `n = 32` for the
report's available artifacts: `977,975 / 977,975` cells SAT, `0` UNSAT, `0`
INDETERMINATE.  The project-level exact inventory stabilizes at `3,375`
classes over `n = 29..32`.  This is useful negative information, not a
producer: the report explicitly leaves all three erased-pin producer facts
unavailable:

- `ErasedPinFiniteCandidateSepScaffoldFacts S x`;
- `ErasedPinTriple A x (S.oppositeVertexByIndex S.surplusIdx) -> False`;
- `forall p in S.capInteriorByIndex S.surplusIdx, p in A.erase x ->
  ErasedPinTriple A x p -> False`.

Source search and Lean-local probing also confirm that the pinned-surplus
residual consumers are centered at the two non-surplus opposite vertices, so
they do not directly match the direct surplus-opposite branch whose center is
`S.oppositeVertexByIndex S.surplusIdx`, nor the surplus-interior branch whose
center lies in `S.capInteriorByIndex S.surplusIdx`.  The next grounded move is
therefore still one of:

1. prove the ordered-row exact-shape/confinement bridge for P2; or
2. introduce and prove a real surplus-index selected-class cut for P4.

Do not treat the completed multi-center census as closing this leaf unless one
of those producer interfaces is actually constructed and wired into the active
theorem.

2026-07-09 P2 producer-boundary audit checkpoint: re-inspected the current
P2 surface in `RemovableVertexAxiom.lean` and the reusable seed-mask/candidate
interfaces in `SurplusCOMPGBankGeometry.lean` / `SurplusSeededShadow.lean`.
The existing row producers such as
`right_row2101_exists_erasedPinRowSeed_privateMask`,
`left_row2110_exists_erasedPinRowSeed_privateMask`, and the
`false_of_erasedPinRow_*_seedShadow_pointClasses` consumers are downstream of
an exact row or erased-payload split.  They can transport a terminal
own-private candidate remainder to a row-specific seed once the finite packet
already supplies that candidate remainder.

They do not prove the current local helpers
`hrightCandidate` / `hleftCandidate` as written.  Those helpers are upstream of
the row split and quantify over every non-surplus interior point `p` using
`radiusOf := fun _ => dist p x`; at that point the proof has no selected
four-class support or exact mask facts for the non-fixed centers.  The global
`HasNEquidistantProperty 4 A` is only an existence theorem for some selected
four-class at each center, not a statement that the particular shared radius
`dist p x` gives exact four-point ten-label masks for all centers.  Therefore
the P2 hole remains a real producer-boundary hole, not a local tactic problem.

The smallest grounded next implementation is still to move candidate
production to a boundary that has exact row data.  Concretely, either:

1. add an ordered seed-mask / exact-shape scaffold whose fields include the
   mask-cardinality, no-self, circumcenter, trigger, prefix-count, and
   separation interfaces consumed by
   `oneSidedSeedCandidateRemainder_of_mask_interfaces`; or
2. refactor the finite row consumers so the row-specific private-mask
   producers are called before demanding `OneSidedSeedCandidateRemainder`, and
   then prove the remaining non-fixed candidate memberships from an exact
   ordered-row shape/confinement bridge.

Current closure status is still `1 open / 785 total` at the spine leaf level,
with four local holes inside
`Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`: two P2
candidate-remainder helpers and the two direct P4 erased-pin branches.

2026-07-09 candidate-free row-coverage checkpoint: audited whether the
existing row-level `private_w_crossSeparation` contradictions can remove P2
without proving the upstream candidate remainders.  They are useful but not
complete.  The direct candidate-free closures currently cover:

- right rows `(0,0,2,2)`, `(0,1,2,1)`, `(1,0,2,1)`,
  `(2,0,1,1)`;
- left rows `(0,0,2,2)`, `(0,1,1,2)`, `(1,0,1,2)`,
  `(2,0,1,1)`.

All other active erased-pin row consumers still construct a valid seeded
shadow and therefore still need the non-fixed candidate memberships supplied by
`OneSidedSeedCandidateRemainder`.  In particular, the pure surplus-side rows
need at least a `.u` candidate-mask membership for
`false_of_privateSurplusTriple_u_crossSeparation`, and the terminal rows
`right (2,1,0,1)` / `left (2,1,1,0)` still route through the terminal seed
input interface.  Thus the candidate-free shortcut is only partial; importing
or extending `ErasedPinOrderedProducer.lean` as it stands would add fixed-bank
seed membership/no-survivor facts but would not produce the missing geometric
candidate memberships.

The fastest remaining P2 route is therefore one of two producer tasks, not a
wrapper task:

1. generate/prove additional row-level separation kills for the currently
   seeded-shadow-dependent row families, so those consumers no longer ask for
   `OneSidedSeedCandidateRemainder`; or
2. prove the exact-shape/confinement producer at the ordered row boundary, so
   non-fixed masks have card four, no self-hit, and the trigger/circumcenter
   facts required by `oneSidedSeedCandidateRemainder_of_mask_interfaces`.

Route 1 is attractive only if a quick producer generation pass closes the 18
surviving row IDs from the selected-symmetry probe.  Otherwise route 2 remains
the general proof-facing bridge needed for both the existing candidate adapter
and the shape-relaxed DFS.
