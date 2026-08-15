# FreshThird literature applicability audit (read-only)

Audit basis: the follow-up prompt, the live source interface in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean`,
and plan §§13.24.1.22-.23. No build or source/doc edit was performed.

## Verdict

No cited literature theorem supplies a SOURCE-ENTITLED producer, or a strict
reduction, from the active `FirstNonHit` hypotheses. The cited results are
downstream consumers: they can constrain a packet after cap order, chain
orientation, or a cyclic four-point configuration has already been produced.
The missing bridge is still a source-clean map from the active non-hit/fan
interface to one of those ordered metric packets.

## Live provenance boundary

- `false_of_freshThird_firstNonHit` (`.../TwoSourceFreshThirdResidual.lean:2843-2858`)
  consumes `FreshThirdAcyclicCanonicalConsumerPacket`,
  `FreshThirdCapSourceNonHit`, and `FreshThirdCapSourceInteraction`; its body
  remains `sorry`. Its comment explicitly identifies missing carrier-wide
  incidence/cap-order/metric information.
- The blocked-deletion theorems (`:2455-2533`) are landing/consumer contracts:
  a blocked triple gives selected-row overlap, and conversely. They do not
  produce the blocked set from `FirstNonHit`.
- The source-faithful fan outcomes (`:5025-5108`) produce local alternatives
  (nonrobustness, same-cap blocker collision, or mutual cross-deletion rows)
  only after a strong `SourceFaithfulSelectedFourDeletionFan` is supplied.
  The boundary-separation lemmas (`:5120-5249`) consume additional alternating
  or nonalternating order facts; the fan does not supply them.
- `FreshThirdPinnedEndpointOutsideSeedQueryPacket` (`:5251-5343`) is a
  structure requiring exact row, overlap, endpoint, cap, order, and fan fields.
  Its `ofSource` constructor (`:5345-5470`) requires the strong terminal fan
  disjunction at `:5428-5439`; it does not derive that disjunction from the
  active `FirstNonHit` interface.
- `firstCapWitnessPacket` (`:5474-5506`) is explicitly conditional on
  `2 ≤ (DRow.support ∩ S.capByIndex S.oppIndex1).card`. The accompanying
  `firstCapWitnessPacket_or_card_le_one` (`:5510-5533`) is a local downstream
  dichotomy, not a literature theorem or a lift from `FirstNonHit`.
- The packet residual (`:5543-5654`) and global residual (`:5674ff`) remain
  strong-hypothesis consumers; the former still ends in `sorry`.

## Cited leads and applicability

| Lead | Antecedent it actually needs | Live applicability |
|---|---|---|
| Nivasch--Pach--Pinchasi--Zerbib cap-witness Lemma 11 | Five points in one cap, the prescribed circular order, and two explicitly named witness relations; it then yields a strict distance inequality. | Live equal-distance rows and blocker-cap interiors do not place a selected support pair in that cap interval, prove the required side/nonseparation, or synchronize the two witnesses. Consumer only. |
| Kominers refinement cited by the prompt | Even granting the claimed ambient-witness extension, the endpoint-edge order, cap interval, side condition, and strict witness inequality still have to be instantiated. | No source theorem in the live interface supplies those facts. The prompt supplies no durable theorem identifier/URL sufficient to promote this into a producer. Consumer candidate only. |
| Aggarwal ordered distance matrices (Prop. 2/3 family) | Two convex chains or an antipodal cut, ordered indices, and oriented omitted distances; anti-Monge/forbidden-pattern conclusions follow only then. | Same-cap centers, mutual omission, and unequal omitted radii do not create the cut, chain assignment, or distance signs. No strict reduction from the live hypotheses. Consumer only. |
| Ptolemy four-point identities | Four points already known to be cyclically ordered/crossing on one circle, with the corresponding Ptolemy pairing or angle hypotheses. | A selected four-row supplies equidistance/cosphericity data, not the independently produced crossing/order packet. Consumer/infrastructure only. |
| Perpendicular-bisector uniqueness / centroid-circle route | A specified support pair and the relevant opposite-chain/apex or uniqueness hypotheses. | The row center is a metric witness from equal-distance equations, but the support pair and required chain placement are not selected. No producer. |
| Cayley--Menger / exact real-algebra certificate machinery | A finite named polynomial packet with all aliases, orientation, and source provenance already fixed. | It can certify a proposed packet; it cannot export one from `FirstNonHit`. Diagnostic/certificate consumer, not strict reduction. |

The local Kalmanson-style consumers have the same boundary: they require an
ordered support/cap packet. They are not evidence that the fan has produced
one. `freshThird_outsideSeed_blocker_capInterior` (`:4983-5014`) is a genuine
local producer of a blocker-cap label once an escaping point is already given,
but it is neither a cited literature producer nor a closure of the active
non-hit hypotheses.

## Plan consistency (§§13.24.1.22-.23)

The current wording is consistent, with §13.24.1.23 serving as the controlling
clarification. §13.24.1.22 (`docs/computational-closure-plan-2026-07-28.md:10864-10918`)
describes a source-clean constructor relative to explicitly strengthened
hypotheses and expressly says it is *not* an ingress theorem from active
`FirstNonHit`; it also says the literature items are consumers. §13.24.1.23
(`:10978-11028`) correctly records that `FreshThirdPinnedFanPacket.lean` is
untracked, that its adapter assumes a strong terminal packet, and that no
source-to-packet lift, witness synchronization, or strict descent is present.

Thus any reading of “intrinsic/source-clean packet” as an already-proved
`FirstNonHit → packet` producer would conflict with §13.24.1.23 and the live
`ofSource` signature. The plan’s “targeted-build green” note is not refreshed
here because this audit is explicitly no-build.

## Required missing antecedent

The actionable gap is one source-entitled theorem producing either (a) a
cap-ordered pair of metric witnesses with the NPPZ/Kominers side and order
facts, or (b) an antipodal two-chain distance-matrix packet with oriented
strict inequalities, from the active non-hit/fan hypotheses. Until that
theorem exists, every cited result remains a conditional consumer and no
literature-based strict reduction or direct closure is established.
