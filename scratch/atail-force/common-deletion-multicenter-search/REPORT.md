# Common-deletion multi-center theorem-bank audit

Date: 2026-07-26

## Verdict

**No checked production or scratch theorem turns the current exact-four
common-deletion ingress, or a bare one-deletion/three-or-four-center K4
survival surface, into `False`, `IsM44`, a Kalmanson/FourTurn occurrence, or
a useful fixed-cardinality contradiction.**

There are two checked scratch producers of genuine 3+-center common-deletion
surfaces, but both are exact-five specializations with substantially stronger
parent data. Neither is imported by production or accepts the current
`ExactFourPostCardElevenRobustSurface`. Their direct consumers remain open.

The source, indexed Lean corpus, requested theorem-bank registries, and current
proof-blueprint state all agree on this boundary.

## Current exact-four surface

The production chain is checked through the following declarations.

1. `Problem97.ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket`
   (`lean/Erdos9796Proof/P97/ATail/CommonDeletionTwoCenter.lean:29`) records
   one deletion `q`, two distinct carrier centers, K4 survival at both, exact
   q-deleted four-point rows, and row overlap at most two.
   `nonempty_commonDeletionTwoCenterPacket` (line 50) constructs it from the
   two survival facts. This is exactly a **two-center** interface.

2. `goodOutsideSources` and `five_le_goodOutsideSources_card`
   (`ExactFourPhysicalConsumer.lean:104,369`) provide at least five good
   sources. However,
   `nonempty_exactFourPhysicalCommonDeletionIngress` (line 434) uses five
   sources only to find two distinct blocker values and then chooses **one**
   blocker unequal to `S.oppApex2`.
   `ExactFourPhysicalCommonDeletionIngress` (line 417) therefore stores only
   one `CommonDeletionTwoCenterPacket`, at that blocker and the physical
   second apex. It does not pigeonhole three blockers onto one of the two
   deletions.

3. The strongest immediate checked consumer is
   `physicalSecondApex_commonDeletion_robust_or_critical`
   (`PhysicalSecondApexCommonDeletion.lean:112`):

   ```lean
   CommonDeletionTwoCenterPacket D H deleted center S.oppApex2 →
     Nonempty (FullyDeletionRobustAt D S.oppApex2) ∨
     Nonempty (PhysicalSecondApexCriticalResidual D S)
   ```

   `nonempty_exactFourPhysicalConsumerOutcome`
   (`ExactFourPhysicalConsumer.lean:506`) reorients the critical arm to a
   swapped protected exact-four frontier. This is a checked robust/swapped
   split, not a third-center theorem or contradiction.

4. `ExactFourPostCardElevenRobustSurface`
   (`ExactFourRobustCapExpansion.lean:200`) retains the ingress, full
   second-apex deletion robustness, cap bounds, radius classification, and
   cap growth. Its current consumer
   `false_of_exactFourPostCardElevenRobustSurface`
   (`FrontierLiveClosure.lean:76`) is still an explicit `sorry`.

Thus the requested multi-center terminal would have to consume the surface in
item 4 (or prove the swapped sibling). Nothing found does so.

## Checked 3+-center producers

### Exact-five coincident-blocker three-center deletion

`CoincidentBlockerJointDeletion`
(`scratch/atail-force/unique5-coincident-direct-false/`
`CoincidentBlockerContinuation.lean:622`) assumes:

- `R : OriginalUniqueFiveCoincidentBlockerResidual F`;
- `L : CoincidentBlockerFreshCommonDeletion R`; and
- `C : CoincidentBlockerMutualOmissionCycle R L`.

It chooses one source in the exact first-apex five-class, outside two critical
shells, and stores two packets for the **same deletion**:

```lean
CommonDeletionTwoCenterPacket D H source S.oppApex1 commonBlocker
CommonDeletionTwoCenterPacket D H source S.oppApex1 freshBlocker
```

with the blockers distinct. Hence deleting `source` leaves K4 at three
distinct centers. `nonempty_coincidentBlockerJointDeletion` (line 665) is
kernel-checked: the proof uses the exact-five count and the at-most-two
intersection of each critical shell with the five-class.

The follow-up `CoincidentBlockerJointDeletion.nonempty_u5Ingress`
(`CoincidentBlockerJointU5Ingress.lean:75`) packages concrete U5 rows, but
still gives no terminal. The only `False` interface is the assumed
proposition-valued
`CoincidentBlockerJointDeletionClosingStatement` (line 783);
`false_of_jointDeletionClosingStatement` (line 794) requires that assumption
and is therefore bookkeeping, not closure.

The recorded replay exits zero with no `sorry`; printed axioms are exactly
`propext`, `Classical.choice`, and `Quot.sound`.

### Exact-five all-reverse four-center deletion

`FullParentAllReverseContinuationFourCenterDeletion`
(`scratch/atail-force/allreverse-alternative-closer/`
`ContinuationFourCenterDeletion.lean:86`) assumes the full exact-five
all-reverse parent:

- `R : FrontierCommonDeletionParentResidual F₀`;
- bi-apex and large-cap refinements `B`, `L`;
- an exact-five profile and
  `continuation : LargeCapUniqueFiveTwoCommonDeletionSources ...`; and
- `A : FullParentExactFiveAllReverseData L profile continuation`.

`nonempty_fullParentAllReverseContinuationFourCenterDeletion` (line 125)
proves that deleting `continuation.first` leaves K4 at both opposite apices,
the unused-source blocker, and a transition-predecessor blocker. The blocker
fields prove the two blockers distinct and each different from both apices.
The recorded warning-as-error replay is clean with only the three standard
axioms above.

Its audit explicitly records the next implication—four-center packet to a
co-radial occurrence or `False`—as open. No registered consumer supplies the
needed cross-support incidence, common outside pair, or aggregate geometry.

### Role-reversed production near miss

`LargeCapUniqueFiveTwoCommonDeletionSources`
(`LargeCapUniqueFiveLowHit.lean:91`) and
`exists_third_commonDeletionSource`
(`LargeCapUniqueFiveCommonDeletionNormalForm.lean:257`) give three distinct
**deletions** preserving K4 at the same two centers. This is not one deletion
surviving at three centers.

## Why known terminals do not apply

- `false_of_thirdActualCenter_selectedRow_contains_frontierPair`
  (`ThirdCenterCommonPair.lean:81`) is a genuine three-center `False`
  theorem, but assumes that all three centers bisect the same named frontier
  pair, expressed by positive membership of both frontier points in selected
  rows. Common-deletion survival supplies existential K4 rows, not that named
  pair. The companion classifiers at lines 141, 207, and 227 have the same
  interface boundary.
- `false_of_fiveCenter_twoKalmansonCore`
  (`scratch/atail-force/unique5-coincident-global-connectivity-terminal/`
  `CoincidentConnectivityScopeGuard.lean:30`) is a checked Kalmanson algebra
  terminal, but requires five specified co-radial equalities plus two strict
  cyclic inequalities. The exact-five residual forces only one of those five;
  common-deletion packets do not supply the other four or the cyclic order.
- No FourTurn declaration was found that mentions any of
  `CommonDeletionTwoCenterPacket`, `CoincidentBlockerJointDeletion`, or the
  four-center packet.
- `fullyDeletionRobustAt_of_large_class`,
  `fullyDeletionRobustAt_of_two_K4_radii`, and
  `card_le_four_mul_notRobustCenters`
  (`MinimalUniqueFourCover.lean:183,199,429`) are the nearest checked
  bounded-cardinality consequences. The last needs more than three quarters
  of the carrier to be robust for a contradiction. Survival at a fixed three
  or four centers, or robustness only at `S.oppApex2`, does not meet it.

## Requested bank and registry audit

The indexed Lean searches were run before source derivation. Exact searches
for `ExactFourPhysicalCommonDeletionIngress`,
`CommonDeletionTwoCenterPacket`, `goodOutsideSources`, and semantic
three-center/common-deletion queries found no additional terminal.

The requested Markdown/JSON registries contain no `commonDeletion` occurrence
and no Kalmanson/FourTurn candidate. Closest entries are:

- reachable/source-proved
  `RowSlotLabelPacket.allEightSlotMetricCore_of_sourceCenterEq`
  (`RVOL/P97/U1Depth5Prefix.lean:2824`), which assumes three source-center
  equalities that `RowSlotLabelPacket.sourceCenter_ne` (line 2552) actually
  forbids for a genuine packet;
- 18 source-proved but `source_reachable=false` U1 `False` consumers, each
  requiring a `RowSlotLabelPacket`, explicit source-row placements, and
  numerous named metric equalities—not a common deletion;
- legacy `three_common_equidistant_centers_eq`
  (`N9Geometry.lean:19096/19309`), which proves uniqueness of two centers from
  three shared noncollinear points, not a deletion terminal; and
- live-unimported
  `ProfileClassIncidence.completesL2FullFrom_representativeSurface`
  (`MultiCenter/Certificate/ProfileClassCompletion.lean:51`), an abstract
  finite-profile completion still missing geometric realization,
  persistence, and a U1 consumer.

This matches `docs/general-n-certificate-bank-mining-2026-07-09.md:317-340`:
the multi-center bank does not yet provide the geometric realization and
consumer needed here.

## Import reachability, cycles, and current anchor

- The production packet, physical-second-apex reducer, exact-four consumer,
  robust expansion, and `FrontierLiveClosure` are in the production import
  closure. Their checked consequence is already represented by the current
  robust/swapped exact-four split.
- Neither scratch 3+-center type has any reference under `lean/`.
  `CoincidentBlockerContinuation.lean` depends on the scratch-only
  `OriginalUniqueResidualDispatch` lane; the four-center file imports
  production `ParentExactFiveAssembler`. There is therefore no existing
  production import edge and no existing cycle. Promotion-cycle safety is
  **unassessed**, not established; in any case their exact-five indices make
  them unusable at the exact-four anchor without a new producer.
- The registry marks the U1 terminals and MultiCenter completion unimported;
  its JSON has reachability flags but no cycle proof.
- Current proof-blueprint anchors include
  `false_of_exactFourPostCardElevenRobustSurface`; the current build passes,
  but refs were stale by four declarations and the exact-four production files
  are actively modified/untracked. No fresh Lean elaboration was started
  during this audit because 14 Lean processes were already active.

**Anchor answer:** none of the located 3+-center results consumes the current
`ExactFourPostCardElevenRobustSurface` or closes its terminal. The highest
leverage missing bridge is still a source-level theorem that enriches the
exact-four ingress with prescribed cross-row incidences/cyclic order (enough
for a banked terminal), or an aggregate theorem that directly contradicts
the retained robust exact-four geometry.
