# Source map and preflight

Status: **discovery quotient only**.  This wave asks whether the listed,
source-proved producer packets contradict the negation of the requested
FirstNonHit producer.  It is not a finite-cardinality carrier model and has no
Euclidean/Lean promotion contract.

The authoritative plan records the pure blocker/row-incidence v2 projection as
SAT and exhausted.  This wave is materially different: it adds the selected-row
deletion fan, repeated-cap outcome, retained mutual-deletion/location packet,
and the common-radius same-blocker off-shell packet.  It does not add a metric
or cyclic-order matrix.

## Exact declarations

| Quotient clause | Production declaration |
|---|---|
| selected four rows have card four; distinct centers meet in at most two | `SelectedFourClass.support_card`, `SelectedFourClass.inter_card_le_two`, `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:406,474` |
| finite carrier and actual blocker self-map, no fixed points | `CriticalShellSystem.CarrierVertex`, `blockerVertex`, `blockerVertex_ne`, same file `1211,1215,1223` |
| equal actual blocker centers imply equal exact selected supports | `ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq`, `lean/Erdos9796Proof/P97/ATail/SurvivalCover.lean:48` |
| actual blocker fiber card at most four | `actualBlockerFiber_card_le_four`, same file `86` |
| fiber image equals selected support only with explicit card-equals-four premise | `actualBlockerFiber_image_eq_selectedSupport_of_card_eq_four`, same file `118` |
| exact Q row, two distinct Q sources with equal blocker | `FreshThirdBlockerFiber`, `lean/Erdos9796Proof/P97/ATail/BlockerMultiplicityGeometry.lean:70` |
| cardinality-independent Q fiber boundary | `freshThird_qRow_exact_blocker_boundary`, `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean:1379` |
| source-faithful four-row deletion fan and strict blocker-cap assignment | `SourceFaithfulSelectedFourDeletionFan`, `sourceFaithfulDeletionFan_of_triApexAllLargeContext`, `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:988,1017`; live context bridge `triApexAllLargeContext_of_residuals`, line `847` |
| repeated-cap pair with exact five-way outcome | `exists_repeatedBlockerCap_pair_outcome`, same file `1211` |
| retained first-apex mutual deletion and three location alternatives | `exists_retainedFirstApex_mutualDeletionPair_threeLocationCases`, `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean:2333` |
| exact retained four-point support only in opposite-adjacent arm | `retainedFirstApex_selectedClass_eq_fourPoints_of_oppositeAdjacent`, same file `2386` |
| FirstNonHit two constructors and secondInteraction four constructors | `FreshThirdCapSourceNonHit`, `FreshThirdCapSourceInteraction`, `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean:2068,1980` |
| named first/second rows: equal Q center or Q intersection at most two | `freshThirdCapSourceNonHit_centerEq_or_inter_card_le_two`, `freshThirdCapSourceInteraction_centerEq_or_inter_card_le_two`, residual file `1163,1206` |
| retained/common ingress is a disjunction, not an identification | `FreshThirdAcyclicCanonicalConsumerPacket`, `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdRetainedProducer.lean:1176` |
| common-radius helper antecedent: common ingress plus both exact support equalities; consequences: Q center in canonical cap, exact two Q-row cap sources, four off-Q strict-cap carrier sources with blocker centers distinct from Q | `freshThird_commonRadius_sameBlocker_freshCenter_mem_canonicalCap`, `freshThird_commonRadius_sameBlocker_selectedShell_inter_canonicalCap_eq_sources`, `freshThird_commonRadius_sameBlocker_exists_four_capInterior_sources_off_selectedShell`, `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean:227,293,440` |
| live desired producer | `exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three`, residual file `2508` |

## Abstraction and ingress coverage

There is no `MAXN`.  The ambient `CarrierVertex D.A` remains unenumerated.
Only theorem-emitted roles are named: the four Q-support sources; first and
second named sources; the retained pair; and, in the exact common/same-blocker
subcase, four off-shell sources.  Exact rows are represented by their four
incidence slots; untracked carrier points remain opaque.  Thus SAT models lift
only to consistency of this producer interface, not to carrier or Euclidean
models.

The wave has three explicit cases: `retained`, `common`, and
`common_sameblocker`.  The last is a source-faithful refinement of `common`
that supplies the exact antecedents of the common-radius helpers.  Retained
roles are not equated with Q-support roles.  Common off-shell source membership
in a strict cap is not projected to their blocker centers.  The repeated-cap
pair uses blocker-center cap membership, while source-in-cap is a different
predicate.  Arbitrary K4 deletion witnesses are never equated with canonical
selected rows; cross deletion is represented only by the proved selected-row
omission equivalence.

## Query and promotion gate

The negated target says every tracked actual selected row whose center differs
from `qCenter` has Q-overlap at most two.  This is also the exact generic
two-circle theorem.  A SAT result is therefore an obstruction: the current
producer packets do not force a new source with three Q incidences.  Promotion
would require a source theorem yielding an actual carrier source and three
named Q-support deletion survivals/blocked incidences at that same distinct
actual center.  No finite named-role SAT result supplies that universal lift.
