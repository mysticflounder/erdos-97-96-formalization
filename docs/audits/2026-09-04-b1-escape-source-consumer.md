# B1 escape-source consumer audit

## Scope and source state

This lane audits the requested neutral consumer
`false_of_b1EscapeSourceContext (C) : B1EscapeSourceContext C -> False`.
The lane base is commit `817fdebab32ca6002c6b55b383263d74682b4a0b`.
The current source hashes used for the recheck are:

* `B1WinningSliceOrderOutcome.lean`:
  `d6853a3439c5168f99b7d8e60b708a4fb4b4801d11ce82a2b2569f9ae3c68d97`.
* `TwoDeletionCollision.lean`:
  `483e9aeb63a93e11b2f4109f83f6ec42ca4c002dd3c91e30e15c95d4c6877603`.
* `TwoPointSelectedRowDeletionSurvival.lean`:
  `4ed08437ba1a45bf43288d95cddb3b516b66c9a43baafd6f0a115308daad1d62`.
* `TwoPointRowFreshSurvivorOrSupportCover.lean`:
  `219eee9b50a1f882b82878fbb7f8fb7cd101378a71cc58cdda3cd96edbf32dcf`.

No Lean source, downstream import, conditional wrapper, sorry, or PIQD
artifact was added by this audit.

## Indexed reuse preflight

The bounded preflight was:

```text
nthdegree docs search --corpus erdos-97-96-formalization-lean
  "false_of_b1EscapeSourceContext B1EscapeSourceContext exactFour source-context consumer B1GlobalTransportContext"
```

The index reported source `a1070d5308cbe50d5754f43ef5acdc7d9c221754`,
indexed at `2026-09-04 09:41 UTC`; that revision predates the lane base.
Relevant handles were `18WNJH` (`false_of_b1GlobalTransportContext`),
`2GTR8F` (`B1EscapeSourceContext`), and the exact-four round-trip entries
`R6KQ81`, `TE6PTK`, `J1S6GF`, `9CRRXV`, and `G6WDP4`.  The current claims
below were rechecked directly against the current source hashes above.

## Full source-context fields

`B1EscapeSourceContext` at
`B1WinningSliceOrderOutcome.lean:1550-1580` supplies the source and escape
witness, second-apex class and strict-cap membership, live-row and escape-row
membership, escape-blocker separation from the common blocker and second
apex, outside-first-apex-fiber membership, retained deletion survival, and
one directed cross omission.

The embedded `B1EscapeWitness` also supplies source inequality from the two
canonical deletions and omission from the common row.  These facts do not
state that the source is distinct from `C.u` and `C.v`, do not identify either
residual endpoint with `F.pair.q` or `F.pair.w`, and do not give a reverse
cross-row incidence.

## Exact-four producer boundary

`exists_exactFourMutualOmissionSourceContext_of_b1EscapeSourceContext` at
`TwoDeletionCollision.lean:1720-1743` is source-producing.  It feeds

```text
P.source_mem_physicalClass
P.source_mem_secondCapInterior
P.source_mem_outsideFirstApexFiber
P.survives_retained_firstApex_deletion
```

to the existing strict-cap producer and returns an auxiliary pair, a joint
deletion packet, and an `ExactFourMutualOmissionSourceContext`.  Its result
does not assert that the new joint deletion is distinct from either
`C.first` or `C.second`, does not identify its deleted source with a canonical
role, and does not provide a contradiction.

The existing exact-four consumers do not accept this output alone.
`exactFour_twoDeletion_crossOmission` at
`TwoDeletionCollision.lean:1064-1090` and
`false_of_exactFour_twoDeletion_blockerTwoCycle` at
`TwoDeletionCollision.lean:962-1062` both require two
`ExactFourMutualOmissionJointDeletion` packets for the same `u,v`, with
distinct deleted sources and distinct actual blockers.  The former returns a
directed omission and the latter consumes both directions.  The private
`false_of_b1_oneWayCrossOmission` at
`TwoDeletionCollision.lean:1553-1688` also takes two such packets and one
directed omission, but its body is open and its downstream branches include
the forbidden blocker-coincidence and survival-square leaves.  The
source-context producer above creates only one packet, so none of these is a
source-clean consumer of its output.

The Rigid-221 route is also excluded: `Rigid221Closure.lean` has open
source-context terminal declarations, and the requested lane explicitly
rejects that import path.

## Two-point survival test

The new theorem
`two_point_row_deletion_survival` at
`TwoPointSelectedRowDeletionSurvival.lean:37-114` requires all of

```text
hOA                         distinguished point in D.A
hsA                         selected-row source in D.A
htA                         target source in D.A
hpq                         endpoint inequality
hp, hq                      both endpoints in the selected row at s
hOeq                        distinguished-point equidistance
hsource_center_ne           centerAt s differs from O
ht_outside                  target source omitted from that selected row
ht_center_ne                target center differs from O
```

The intended names are `A := D.A`, `H := lateFirstApexSystem C.R`,
`O := S.oppApex1`, endpoints `C.R.interior_q` and
`C.R.interior_w`, and target `P.source` (or `P.escape.source`).  The residual
fields do provide endpoint inequality and equidistance to `S.oppApex1` via
their first-apex class memberships, and `P.escapeBlocker_ne_apex` supplies
the target-center inequality when the target is `P.source`.

The remaining premises are not available from the named packet:

* If `s := C.R.interior_q`, membership of `C.R.interior_w` in the selected
  row at `s` is absent.  `source_mem_escapeRow` instead concerns the row at
  the target source.
* If `s` is the common canonical row, membership of both residual endpoints
  in that row is absent.
* `source_mem_outsideFirstApexFiber` is complement membership in an actual
  blocker fiber anchored by `F.pair.q`; `ht_outside` is omission from a
  selected support.  The current packet has no source-clean bridge between
  those predicates.
* `OriginalUniqueFourResidual` stores `interior_q` and `interior_w` as first
  apex-class points but has no fields identifying them with `F.pair.q` and
  `F.pair.w`.  Existing survival adapters that use those identifications
  state them explicitly at `B1WinningSliceOrderOutcome.lean:2445-2499`.

Thus the two-point theorem does not reduce the source-context consumer to
outside-first-apex-fiber membership.  It stops at the missing canonical-row
support/omission bridge, before any contradiction can be formed.

## Current fresh-survivor split

The current source also contains
`two_point_row_fresh_survivor_or_support_cover` at
`TwoPointRowFreshSurvivorOrSupportCover.lean:27-110`, together with its
boundary-normalized variant below it.  This theorem uses the same explicit
selected-row endpoint hypotheses `hp` and `hq`, the same target omission
premise, and a universal `hcenter_ne` premise.  It adds a finite cover `U`
and eight four-equidistant-center hypotheses, then returns either a fresh
five-center survival branch or the support-cover alternative.

It therefore does not supply the missing B1 premises: its `hp`, `hq`,
`hcenter_ne`, and `halias` arguments must already be proved before the
source-context packet can use the theorem.  Its conclusion is a fresh
five-center packet or a finite support cover, not `False` for
`B1EscapeSourceContext`.  The first residual remains the missing second
joint-deletion packet or a source-clean terminal for the single packet,
described below.

## Smallest missing residual / consumer

The smallest first missing edge is either a source-clean terminal consuming
one `ExactFourMutualOmissionJointDeletion` together with its
`ExactFourMutualOmissionSourceContext`, or a source-clean producer of a second
distinct joint-deletion packet for the same `u,v`.  The current
`exists_exactFourMutualOmissionSourceContext_of_b1EscapeSourceContext`
provides only the first packet.  Consequently
`exactFour_twoDeletion_crossOmission` and the private
`false_of_b1_oneWayCrossOmission` cannot be reached from it: both need the
second packet, plus the packet distinctness and blocker-distinctness facts.
The checked bidirectional theorem also cannot be applied because
`B1EscapeSourceContext.cross_omission` supplies only one direction and
`source_not_mem_commonRow` supplies omission rather than the reverse
incidence.

Either missing edge must provide exact hypotheses that turn the single
source-context packet into one of the two existing source-clean four-center
terminal inputs, or produce the second packet, without using
`Rigid221Closure`, the coordinator, the blocker-coincidence leaf, or the
survival-square leaf.  No such residual or consumer is present in the current
source.  Consequently the requested
`false_of_b1EscapeSourceContext` was not formalized, and no new module was
created solely to carry an unproved conditional.

## Handoff

The source-clean reduction is the existing exact-four producer through
`exists_exactFourMutualOmissionSourceContext_of_b1EscapeSourceContext`; its
first missing edge is either a source-clean terminal for that single packet
and source context or a producer of a second distinct packet for the same
`u,v`.  The two-point survival route is separately blocked by the listed
canonical-row premises.
