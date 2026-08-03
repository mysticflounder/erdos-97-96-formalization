# Residual-route audit (R2)

## Verdict

No source-clean proof of `false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual` is available from the current imports.  The theorem remains a direct load-bearing `sorry` at `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:9738` and is called unchanged by `false_of_twoCapSources_freshThirdBlockerFiber_residual` (~11163), then by the fresh-third core.

## Exact input and existing normalization

The leaf receives `C : TwoCapSourceThirdCanonicalRowSurface`, `Q : FreshThirdBlockerFiber`, both positive interactions, and `hresidual : FreshThirdNormalizedResidualCase`.  The residual normalizer (`freshThirdNormalizedResidualCase_of_crossRowResidual`, ~9219) gives exactly three arms:

1. `firstNonHit` — the first interaction normalizes to `FreshThirdCapSourceNonHit`;
2. `secondNonHit` — the analogous second-source packet;
3. `equalCrossRowCenters` — both cross-row hits and equal cap-source centers.

The positive distinct-center/both-hit arm is already closed by `false_of_two_freshThirdCrossRowHits_distinctCenters` (~9430) and is removed before this leaf.

## Route matrix / missing producer

* **First/second non-hit.** `FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit` (~9180) leaves only:
  * `sameBlocker`: source center/support equals `Q.source₁` row; no contradiction consumer exists.
  * `sourceRowOmission`: one `Q` source is absent from the source row and `HasNEquidistantPointsAt 4` survives deletion; no generic omission-to-False producer/terminal exists.  The analogous deletion equivalence only rewrites membership and does not close this packet.
  The `sameCapWithInternalFiberSource` interaction is not eliminated by this normalization; only the outside-both-sources same-cap alignment theorem is source-clean.

* **Equal-center both-hit.** `freshThirdEqualCenterExactFourRow_of_hits` (~9267) proves both selected supports are the same exact four-point row `{C.firstSource, C.secondSource, Q.source₁, Q.source₂}`.  `commonCollisionEndpointOmission_of_equalCenterHits` (~9398) then closes the complementary-membership subcase and exposes the honest residue `CommonCollisionEndpointOmission`.  There is no consumer proving this residue contradictory.  It cannot be promoted to the stronger all-four-endpoint/shell-cap packet needed by `false_of_twoCapSources_sameBlockerAllEndpointOmission`; that theorem requires additional equal-blocker, common-radius, endpoint-omission, and shell/cap-intersection hypotheses.

The existing `false_of_twoCapSources_freshOutsideFirstBlockerFiber` (~8050) is itself `sorry`; invoking it would not be source-clean and would recurse through the wrong interface.

## Import and bank audit

Current imports contain the finite-row, deletion-boundary, Kalmanson, two-center localization, and perpendicular-bisector ingredients used by the checked normalizers, but no FreshThird residual producer.  The mandatory theorem-bank inventories (`certificates/p97_rvol_general_n_mining.{md,json}`, `certificates/erdos97_legacy_general_n_mining.{md,json}`, `certificates/erdos_general_theorem_p97_mining.md`) contain no matching declaration; indexed Lean search likewise found no bridge.  Scratch probes V21/V22/V23/V25 and the latest global-bank audit report only `UNKNOWN`/empirical finite data, with no universal Lean ingress.

## Trust boundary

This audit used source inspection and theorem-bank/scratch searches only.  No Lean/Lake build, solver, kernel, or certificate verification was run.  Therefore the shortest honest route is to add a new source-clean producer/terminal for the non-hit deletion/same-blocker packets or for `CommonCollisionEndpointOmission`; absent that, the target must remain open.
