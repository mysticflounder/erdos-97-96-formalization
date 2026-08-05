# FreshThird normalized-remaining proof search (2026-08-03)

Target: `Problem97.ATailFrontierLiveClosure.false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`, [FrontierLiveClosure.lean:11324-11331](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean#L11324).  The theorem is still `by sorry`; no source-clean producer/consumer for its three constructors was found.

## What is available

* `FreshThirdCapSourceNonHit` is only the two-constructor packet `sameBlocker` and `sourceRowOmission` ([10375-10414](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean#L10375), [10462-10482](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean#L10462)).  The omission arm carries only `deleted = Q.source₁ ∨ deleted = Q.source₂`, non-membership in the cap-source selected support, and `HasNEquidistantPointsAt 4 (D.A.erase deleted.1) ...`.
* `FreshThirdCapSourceInteraction` has four constructors ([10375-10437](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean#L10375)): equal blocker, one-point deletion, distinct blocker/different caps, and same cap with an internal fiber source.  `nonHit_of_not_crossRowHit` ([10491-10508](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean#L10491)) only converts a failed hit to the two `NonHit` constructors; it proves no contradiction.
* The only source-clean fresh-third terminal is `false_of_two_freshThirdCrossRowHits_distinctCenters` ([10992-11000](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean#L10992)), which needs *both* cross-row hits and distinct centers and uses the perpendicular-bisector two-center bound.  This does not apply to either non-hit arm.
* The canonical equal-center terminal `false_of_freshThirdEqualCenter_sameCapOppIndex` (used at [11398-11404](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean#L11398)) only handles equal centers plus a same-cap interaction at `S.oppIndex1`; it cannot consume `NonHit` data or noncanonical interactions.
* The tempting enlarged-fiber consumers are not source-clean: `false_of_twoCapSources_freshOutsideFirstBlockerFiber` is itself `sorry` ([9359-9363](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean#L9359)); its swap `false_of_twoCapSources_freshOutsideSecondBlockerFiber` merely calls it ([9365-9384](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean#L9365).  The exact-row leaves it calls are also `sorry` ([12697-12732], [12740-12775]).  `false_of_twoCapSources_sameBlockerAllEndpointOmission` is source-clean ([12887-12940]) but requires the strictly stronger `FreshOutsideFirstBlockerFiber`/common-radius/mutual-cross-membership/all-endpoint-omission packet, absent from `C` and `Q`.

## Constructor audit

### `firstNonHit data secondInteraction`

The constructor is [11283-11286](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean#L11283).  Destructing `data` gives:

* `sameBlocker`: `C.firstSource` has the same actual blocker/center and selected support as `Q.source₁` (fields [10467-10473]).  This deliberately makes the first cross-row hit false.  With an arbitrary `secondInteraction`, at most one additional center on the perpendicular bisector is available; the two-center bound used by `false_of_two_freshThirdCrossRowHits_distinctCenters` needs two *new* hits, so it cannot close this branch.  No theorem turns equal-blocker-at-fresh-fiber into `False`.
* `sourceRowOmission`: only deletion survival for one of `Q.source₁/Q.source₂` in the first cap-source row is available ([10474-10482]).  This lacks the named-blocker equality, common radius, cap-interior provenance, mutual source incidence, and all-four-endpoint omission required by the first-fiber packets consumed at [12697-12813].  It therefore cannot be converted to `FreshOutsideFirstBlockerFiber` or to `false_of_twoCapSources_sameBlockerAllEndpointOmission` without a new bridge theorem.

The `secondInteraction` cases do not repair this: the distinct-cap and same-cap/internal-fiber constructors are cross-row hits but there is no second independent hit from the first source; same-blocker repeats the equal-center issue; source-row omission supplies another deletion-survival fact but no global incidence/radius bridge.

### `secondNonHit firstInteraction data`

This is the exact symmetric situation ([11287-11290]); swapping `P/Pρ` and `C.firstSource/C.secondSource` only transports the missing bridge.  The existing `FreshOutsideSecondBlockerFiber.toSwappedFirst` ([BlockerMultiplicityGeometry.lean:155-190]) applies only to an already-constructed enlarged-fiber packet, not to `FreshThirdCapSourceNonHit`.  Thus no source-clean consumer exists here either.

### `equalCrossRowCenters ...`

The equal-center constructor also stores two `FreshThirdNonCanonicalInteraction`s ([11291-11300]).  The downstream normalized-residual consumer destructs these and recurses to the same open theorem for distinct caps/non-`oppIndex1` same-cap cases ([11424-11528]); only canonical same-cap/`oppIndex1`, same-blocker, and source-row omission have checked exits.  Consequently this constructor is not source-clean closed either, though the immediate request is primarily the non-hit arms.

## Indexed-search result / blocker

`nthdegree docs search --lean` over the current corpus found only the declarations above, `nonempty_freshThirdCapSourceInteraction_of_noAlignment` ([11084-11164]), the existing same-cap terminal, and the enlarged-fiber wrappers.  Agentic search likewise returned no import-reachable theorem consuming `firstNonHit`, `secondNonHit`, or the noncanonical equal-center products.  The minimal missing bridge is a new source-faithful cap/radius/order/incidence theorem that upgrades `sameBlocker` or one-point `sourceRowOmission` to a contradiction (or to a genuinely constructed enlarged-fiber packet).  Using the `freshOutside` theorem now would be circular because its first-side consumer is an unproved `sorry`.

**Conclusion:** no concrete source-clean proof route exists from the currently imported lemmas.  The target remains a genuine load-bearing obligation; do not replace it with a wrapper, recursive self-call, or the `freshOutside` sorry theorem.
## Targeted theorem-bank/index search (2026-08-03)

The current indexed source has no consumer outside `FrontierLiveClosure.lean`
for `FreshThirdNormalizedResidualRemainingCase.firstNonHit`,
`.secondNonHit`, or `FreshThirdNonCanonicalInteraction.sameCapWithInternalFiberSource`.
The only uses are constructor normalization and recursive calls of
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` (lines
11360--11528); no checked terminal is hidden elsewhere.

The closest checked bridge is U5 extraction.  In
`U5GlobalIncidenceBasic.lean:350-353`,
`U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton`
requires
`h : HasNEquidistantPointsAt 4 (D.skeleton q) center` and returns
`∃ B, Nonempty (U5QDeletedK4Class D q center B) ∧ B.card = 4`.
The erase-center variant at lines 391--394 requires
`HasNEquidistantPointsAt 4 ((D.skeleton q).erase center) center` and gives the
same class.  A `sourceRowOmission` payload has
`HasNEquidistantPointsAt 4 (D.A.erase deleted.1) (H.centerAt source...)`; since
`D.skeleton deleted = D.A.erase deleted`, this can instantiate the erase-center
adapter with `q = deleted.1`, but it produces a row only—not `False`.

`ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary` consumes a
`FiveCenterDeletionSurvival` packet (five surviving centers for one deletion)
and mechanically extracts five U5 classes.  A single `firstNonHit`/`secondNonHit`
case supplies at most one deletion-survival witness per cap-source row, so it
does not meet this interface; the boundary module explicitly says it is a
normalization, not a contradiction.

`cross_deletion_survives_iff_not_mem_selected_support` at
`CriticalPairFrontier.lean:781-785` has exact shape
`HasNEquidistantPointsAt 4 (A.erase w) (H.centerAt q hq) ↔
w ∉ (H.selectedAt q hq).toCriticalFourShell.support`.
`crossPairDeletionSurvival_iff_selectedSupportOmission` at
`TwoCollisionGlobalProducer.lean:514-519` is just the same equivalence under
the `CrossPair...` abbreviations.  These justify the existing omission payload
but have no contradiction conclusion.

The equal-center positive constructor
`freshThirdEqualCenterExactFourRow_of_hits` (lines 10634--10642) requires both
`FreshThirdCrossRowHit`s and center equality, then yields exact support rows.
Its only checked terminal is
`false_of_freshThirdEqualCenter_sameCapOppIndex` (lines 10759+), which needs
`capIndex = S.oppIndex1`; noncanonical same-cap (`hcapIndex ≠ oppIndex1`) is
explicitly routed back to the unresolved residual theorem.

Sibling theorem-bank U5 declarations are source-proved but not an adapter to
this residual: `U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton`
and `_erase_center` in `RVOL.P97.U5GlobalIncidenceBasic` have only the generic
`HasNEquidistantPointsAt` hypotheses above and no cap/order/blocker data.
`u5AuditedBoundedSupport_hasNEquidistantPointsAt` additionally needs
`D.IsM44`, `U2Statement D`, `U5ModeA D`, `U5DangerousTriple`,
`U5SelectedCandidate`, and `U5BoundedAuditSupport`; it is not a consumer of
the FreshThird residual.  Therefore no sound source-clean adapter to `False`
was found; the missing bridge remains a new cap/radius/order/incidence lemma.
