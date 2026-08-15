# FreshThird pinned endpoint packet: outcome audit

Read-only audit of the live source on 2026-08-13. No Lean build was run.
The current `false_of_freshThird_pinnedEndpoint_outsideSeedResidual` stops after
constructing `hfanOutcome` and `hmutualOutcome` and has `sorry` at
`TwoSourceFreshThirdResidual.lean:5717-5733`; it is not a closure proof.

## What the packet actually carries

* `FreshThirdPinnedEndpointOutsideSeedQueryPacket` is defined at
  `TwoSourceFreshThirdResidual.lean:5336-5422`. It transports the exact row,
  six-point seed overlap/cardinality, endpoint names, four strict cyclic-order
  arms, center location, two center inequalities, seed multiplicity, endpoint
  identity, source/fresh cap placement, both endpoints outside the first cap,
  and `fan`.
* `fan` is an `IndexedPinnedEndpointOutsideSeedFan`, hence carries a selected
  `Row : SelectedFourClass D.A center`, its exact `Fin 4` indexing and
  source-faithful fan, an escaping row point, and the endpoint split
  (`FreshThirdPinnedFanPacket.lean:294-305`). In the off-endpoint branch the
  selected `Row` is separate from `DRow`; in the endpoint branch only
  `Row.support = DRow.support` is added (`...:311-350`).
* `SourceFaithfulSelectedFourDeletionFan` is pointwise over every row point:
  blocker cap-interior membership, blocked deletion, then either
  center=blocker plus equal critical support plus center nonrobustness, or
  center≠blocker plus intersection cardinality at most two
  (`TriApexEndpointRetainedOmission.lean:988-1007`).
* `hrowAt` is not a fan outcome. Its four arms only say `id=qBetween` or
  `id=qOutside`, the displayed strict cyclic order, and that the named
  endpoint row has one deletion omitted, center in `rowCap`, at most two row
  points in that cap, and at least two outside it
  (`TwoSourceFreshThirdFiber.lean:153-160`, `524-548`). It says nothing about
  the identities of arbitrary fan witnesses `z,w`.

## Outcome map

### 1. Center-nonrobust arm

**Source-clean consequence.** The strongest direct result is exactly
`¬ FullyDeletionRobustAt D center`, the left disjunct of both
`nonrobustCenter_or_exists_sameCap_blockerCollision_or_crossDeletionRow`
(`TwoSourceFreshThirdResidual.lean:5104-5140`) and
`nonrobustCenter_or_exists_mutualCrossDeletionRows_of_sourceFaithfulFan`
(`...:5154-5187`). If an actual center-blocker identity is separately supplied,
`exists_nonrobustCenter_witness_of_sourceFaithfulFan` preserves its source,
cap, blocked deletion, equal support, uniqueness, and nonrobustness
(`TriApexEndpointRetainedOmission.lean:1442-1470`).

**First missing consumer antecedent.** The collision consumer
`false_of_sourceFaithfulFan_blockerCollision_nonalternating` requires
`FullyDeletionRobustAt D center` and a nonalternating cyclic-order equivalence
(`TwoSourceFreshThirdResidual.lean:5301-5328`). The packet has neither a
robustness field for this arbitrary `center` nor a theorem ruling out this arm.
The retained-first-apex robustness used elsewhere is separate context, not a
field of this packet (`...:2637-2673`).

**Weakest honest residual.** Retain the explicit nonrobust disjunct. No stronger
packet-only contradiction or center-blocker witness follows: the latter needs
the additional existential `center = H.centerAt q ...` in
`exists_nonrobustCenter_witness_of_sourceFaithfulFan`.

### 2. Same-cap blocker collision / cross-deletion-row arm

**Source-clean consequence.** The first adapter gives distinct `z,w` in the
selected row, a common blocker cap with both blocker centers in its interior,
and either equal blockers or a selected four-row at one blocker omitting the
opposite source (`...:5111-5121`). This is stronger than an anonymous
`HasNEquidistantPointsAt` result.

For equal blockers, the existing metric/cyclic adapter proves only the
alternation separation
`btw(center, blocker, z) ↔ ¬btw(center, blocker, w)`:
`selectedFourClass_actualBlockerCollision_pair_separated`
(`...:5199-5235`). The contradiction theorem additionally needs
`center ≠ blocker(z)` and the *same/nonalternating* `btw` equivalence
(`...:5261-5297`). Robustness can supply the former via
`selectedFourClass_center_ne_actualBlocker_of_fan_robust` (`...:5239-5253`),
but no packet field supplies robustness or the nonalternating order.

For the cross-deletion alternatives, the selected-row avoidance is the whole
source-clean result. No existing consumer turns merely
`∃ K, oppositeSource ∉ K.support` into `False`.

**First missing antecedent.** Collision: `FullyDeletionRobustAt D center`
and the opposite/nonalternating cyclic placement. Cross-row: an endpoint
identity/cyclic-order/cap bridge identifying the arbitrary `z,w,K` with the
retained endpoint configuration. `hrowAt` supplies order only for its named
`DRow` endpoints, not these fan witnesses.

**Weakest honest residual.** Preserve the adapter's exact common-cap
disjunction. A conditional collision consumer with the two missing inputs is
already `false_of_sourceFaithfulFan_blockerCollision_nonalternating`; proving
either missing input from this packet would be a new theorem, not a
source-clean consequence.

### 3. Mutual-cross-deletion rows

**Source-clean consequence.** The right arm of
`nonrobustCenter_or_exists_mutualCrossDeletionRows_of_sourceFaithfulFan`
gives distinct `z,w` in `Row`, mutual omission from the actual critical
supports, selected rows `Kz/Kw` witnessing both omissions, and distinct blocker
centers (`TwoSourceFreshThirdResidual.lean:5154-5187`). The underlying
cardinality argument uses only the exact four-point support and no ambient
carrier enumeration (`TriApexEndpointRetainedOmission.lean:1351-1440`).

**First missing consumer antecedent.** The available retained-apex consumer
requires `z,w ∈ SelectedClass D.A S.oppApex1 radius` and then classifies them
into retained-source/left-adjacent/right-adjacent locations
(`TwoSourceFreshThirdResidual.lean:2637-2750`). The pinned packet has no
`oppApex1`, radius, retained-class membership, or correspondence between its
`z,w` and the named endpoint row. Its cap fields concern source/fresh centers
and `DRow`/`rowCap`, not the blockers of this arbitrary pair.

**Weakest honest residual.** Preserve the full mutual omission/`Kz`/`Kw`
packet. The next useful theorem would be an explicit endpoint/retained-class
alignment bridge; it cannot be inferred from `hrowAt`, `row_cap_outside`, or
the outside-seed witness alone.

## Cross-cutting verdict

`Row.support_card = 4` and `hrowAt` justify finite extraction and the named
row's cap census, but do not identify generic fan sources. `rowCap` is not
shown equal to a fan blocker cap or `S.oppIndex1`; `freshCap ≠ S.oppIndex1`
and endpoint exclusion concern only the named source endpoints. The cyclic
order is likewise only the four named FreshThird indices. Outside-seed data
proves existence, not that an extracted `z,w` is `qOutside/qBetween`.
`center_ne_source`/`center_ne_fresh` eliminate only two explicit center
identities; they do not establish `center ≠ H.centerAt z` for all four row
points.

The only strictly smaller no-new-assumption residual justified here is a
named disjunction combining the already-proved center-nonrobust, same-cap
collision/cross-row, and mutual-cross-row adapters. The current `False` claim
requires a separate bridge for each surviving arm; no arm is closed by the
packet fields alone.
