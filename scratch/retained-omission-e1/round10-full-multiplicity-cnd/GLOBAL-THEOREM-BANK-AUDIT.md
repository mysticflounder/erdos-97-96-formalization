# Round10 global theorem-bank audit

Date: 2026-08-02

## Verdict

**NO-GO.** Round10 supplies eleven authenticated bounded Z3 `unsat` results,
but no source-faithful Lean producer, finite certificate, or direct terminal
for the live fresh-third normalized residual.  The remaining target is still
the explicit `sorry` at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:9740`:
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`.

## Round10 artifacts and trust boundary

The run directory is
`scratch/retained-omission-e1/round10-full-multiplicity-cnd/artifacts/20260802T202236.997745Z-caplocal-pid44841`.
Its `source_authentication.json` records schema version 10, target
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`,
and the following hashes:

* `base_schema_sha256=504a9589b5d4ce92300f6ff75b16afa1184d95e22075c926c42c3907f8f99b02`;
* `base_script_sha256=1974fe5de33d50105157c45e84df2a021fe4ba632df4aa6f62d5f66d894a9f06`;
* `script_sha256=7f6a46221eb48d22dd33836b1d07f637e1e9fb6cb9b99df4b7c099163f0eaef7`;
* `uv_lock_sha256=a942a01001ddeeb51124fc84740bc6ae5b6221fdda605a83509a3cff1bef399c`.

All eleven `fresh_DDD_k*_d*_f*` result files are `unsat`, produced by Z3
4.16.0 (seed 20802).  The cases are
`k0/d1/f2`, `k0/d1/f3`, `k1/d0/f2`, `k1/d0/f3`, `k1/d2/f0`, `k1/d2/f3`,
`k2/d1/f0`, `k2/d1/f3`, `k2/d3/f0`, `k3/d2/f0`, and `k3/d2/f1`.
These are external solver outcomes only: no DRAT/LRAT object, Lean theorem,
or kernel/axiom audit is present.  They must remain discovery evidence, not
closure or a generalized DDD theorem.

## Live residual and already-checked branches

The source-clean normalization remains:

* `freshThirdNormalizedResidualCase_of_crossRowResidual` routes a failed
  two-hit packet to `firstNonHit`, `secondNonHit`, or `equalCrossRowCenters`;
* `FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit` exposes only
  `sameBlocker` or `sourceRowOmission` data;
* `false_of_two_freshThirdCrossRowHits_distinctCenters` closes the distinct
  center two-hit arm;
* `freshThirdEqualCenterExactFourRow_of_hits` and
  `commonCollisionEndpointOmission_of_equalCenterHits` construct the positive
  equal-center exact-four-row/endpoint-omission packet;
* `false_of_equalBlockers_complementaryMembership` (line 8529) is a terminal
  only after mutual cross-membership, equal actual blockers, and complementary
  membership are already supplied.  It does not prove those hypotheses from
  the normalized residual.

The residual theorem at line 9740 has no proof.  Its coordinator
`false_of_twoCapSources_freshThirdBlockerFiber_residual` is source-clean only
because it calls that open theorem; this is not a kernel closure.

## Global bank and indexed-Lean search

Checked the three required theorem-bank registries:

* `certificates/p97_rvol_general_n_mining.json`;
* `certificates/erdos97_legacy_general_n_mining.json`;
* `certificates/erdos_general_theorem_p97_mining.json`.

Searches for `FreshThird`, `normalized_residual`, `crossRow`, `nonHit`,
`equalCenter`, `sourceRowOmission`, `complementaryMembership`, and
`collisionEndpoint` found no reusable declaration matching the live packet.
`nthdegree docs search --lean` over the current and `p97-rvol` corpora likewise
returned only unrelated U1/U5 row-slot, omission, and generic carrier facts.
No sibling source file contains a FreshThird adapter.

The closest source-proved candidates are all mismatched:

| declaration | source/status | missing bridge |
|---|---|---|
| `Problem97.U1LargeCapRouteBTailMetricResidualTarget.false_of_twoLargeCaps_pCentered_t2Source` | `p97-rvol/lean/RVOL/P97/U1LargeCapRouteBTail.lean:2499`, source-proved and reachable | Requires MEC/MoserTriangle/CapTriple and a fixed `U1Depth5.CriticalSourceRows` packet; FreshThird supplies none. |
| `Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction` | `p97-rvol/lean/RVOL/P97/U1TwoLargeCapObstruction.lean:77`, source-proved but unimported | Fixed five-point metric equalities; no adapter from either non-hit or equal-center row. |
| `Problem97.U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_erase_center` | `p97-rvol/lean/RVOL/P97/U5GlobalIncidenceBasic.lean:391`, source-proved/reachable | Produces a generic deleted U5 class from deletion survival, not `False` and not a FreshThird cap-source packet. |
| `Problem97.u5_qcritical_chain_right_radius_metric_incompatibility` | `p97-rvol/lean/RVOL/P97/U5QCriticalTQpT0N2AdjacentMetric.lean:38`, source-proved/reachable | Needs a fixed seven-point radius/chain system and inequalities absent from the residual. |
| `Problem97.U5QCriticalTripleClass.rank_two_mixed_exact_equidistant_incompatibility` | `p97-rvol/lean/RVOL/P97/U5QCriticalRankTwoMixed.lean:411`, source-proved/reachable | Needs `U5DangerousTriple` and several `U5QDeletedK4Class` incidence witnesses, not generated here. |
| `Problem97.u5_qcritical_two_no_p_right_exact_selected_qcritical_metric_incompatibility` | `p97-rvol/lean/RVOL/P97/U5QCriticalTwoNoPRightExactSelectedQCritical.lean:121`, source-proved/reachable | Fixed six-point metric equalities; no theorem maps the FreshThird fields to them. |

The local private two-center cap lemma and public six-point Euclidean
obstructions were also checked.  Their same-cap pair, convex-order, and
selected-row hypotheses are stronger/different than the equal-center,
same-blocker, and source-row-omission constructors.

## Evidence classification and recommendation

* **Kernel:** only the existing source-clean routers and distinct-center
  terminal; normalized residual remains open.
* **Source:** registry declarations above are source-proved in sibling code,
  with no import/adapter into this target.
* **Conditional:** equal-center exact-row and common-endpoint-omission packets
  are positive data, not contradictions.
* **External:** all eleven Round10 Z3 `unsat` results.

Keep the Round10 JSON and encoding artifacts as authenticated external data.
Do not promote them, their DDD labels, or any selector relation into a Lean
theorem bank.  The next valid closure step is a source-clean consumer for one
of the normalized `sameBlocker`/`sourceRowOmission` or equal-center residual
leaves, with an explicit bridge proving its required incidence and metric
hypotheses.
