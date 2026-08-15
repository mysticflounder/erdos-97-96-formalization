# FreshThird motif-bank pass (2026-08-08)

Scope: post-CEGAR cross-deletion motif scan, general-`n` theorem-bank search, and provenance check against `FrontierLiveClosure/TwoSourceFreshThirdResidual.lean`. No production edits.

## Diagnostic anchor

The scan artifact is `scratch/p97-consumer-first/freshthird_cross_deletion_motif_scan_20260808.results.md`. It records 576 structural branches, 576 SAT/0 UNKNOWN, 42 motif witnesses, and 536 branches without a two-center/two-shared-point nonalternating motif (missing fields are dominated by insufficient shared support). The task brief reports a newer 571 SAT/5 UNKNOWN and approximately 41 witnesses; this report treats the artifact as the auditable snapshot and does not infer universal coverage from returned models.

## Strongest general-`n` consumers

1. **Direct cut-independent consumer (strongest match):**
   `Problem97.ATailFrontierLiveClosure.false_of_selectedClass_and_row_shared_pair_nonalternating`,
   [TwoSourceFreshThirdFiber.lean:285](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean:285).
   It accepts arbitrary finite `A`, a `BoundaryIndexing A`, distinct centers `ic,id`, distinct points `ix,iy`, a positive selected radius class at `ic` of cardinality at least four, an exact selected row at `id` containing both points, and a same-open-arc (`btw`) equivalence. It trims the large class via `exists_selectedFourClass_preserving_pair` (line 199) and invokes the cut-independent consumer `false_of_freshThirdSharedPairNonalternationPacket` (line 250). No fixed ambient cardinality appears.

2. **Ordered-cut adapter:**
   `false_of_two_selected_middle_rows_shared_endpoint_pair`,
   [CapCrossingKalmanson.lean:834](../../lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean:834).
   Ambient-cardinality generic (`Fin carrier.card`), but requires `ia < ib < ic < id` and two exact rows sharing the endpoint pair. This is a narrower ordered realization of the same bisector contradiction.

3. **Four-row directed-omission producer:**
   `exists_mutualCrossDeletion_pair_of_sourceFaithfulFan_no_centerBlocker`,
   [TriApexEndpointRetainedOmission.lean:1270](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:1270).
   For an arbitrary finite carrier and an exact four-row, a source-faithful deletion fan plus no center-blocker yields two mutually omitted sources, deletion survival at both blocker centers, and distinct blocker centers. The only finite enumeration is `Fin 4`; it is not an exact-11 theorem.

4. **Cross-deletion/distinct-blocker producer:**
   `crossDeletion_survives_of_distinct_selectedRow_blockers`,
   [TriApexEndpointRetainedOmission.lean:1144](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:1144), together with
   `cross_deletion_survives_iff_not_mem_selected_support` and
   `blocker_centers_ne_of_not_mem_other_selected_support`,
   [CriticalPairFrontier.lean:781](../../lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean:781) and :833.
   These are ambient-set generic and convert blocker-shell omission into deletion survival/distinct centers; they do not themselves produce two shared shell points.

5. **Branch-specific alternation producer:**
   `endpointFresh_sharedBlocker_pair_alternates`,
   [TriApexEndpointRetainedOmission.lean:2710](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:2710), with exact pair collapse from `endpointFresh_commonSupport_inter_firstApexRow_eq_pair_of_sharedBlocker` (:2323) / `endpointFresh_criticalShell_inter_frontierRadiusClass_eq_pair_of_sharedBlocker` (:2495). This supplies the *alternating* (non-contradictory) side in a specialized EndpointFresh shared-blocker branch, not a universal FreshThird producer.

## Bank/registry result

The required registries (`docs/general-n-certificate-bank-mining-2026-07-09.md`, `certificates/p97_rvol_general_n_mining.{md,json}`, `certificates/erdos97_legacy_general_n_mining.{md,json}`, `certificates/erdos_general_theorem_p97_mining.{md,json}`) contain no exact FreshThird motif declaration. Their useful general-`n` inventory is aggregate: the July report counts 761 source instances/712 shapes and states that the finite-bank families still lack a geometric realization/persistence bridge; the RVOL report lists 2,148 candidates (2,143 source-proved), with 88 U5GlobalIncidence metric-point consumers and 18 unimported U1 source-unit consumers. JSON name search found no matches for the FreshThird declarations above.

## Reachability and cleanliness

`TwoSourceFreshThirdResidual.lean` imports `TwoSourceFreshThirdFiber`, `TwoSourceTripleShellEscape`, and `TwoSourceFreshThirdRetainedProducer`; the project root imports the residual through `FrontierLiveClosure.lean`. `TwoSourceFreshThirdFiber` imports `TwoSourceCanonicalSurface`, which imports `TriApexEndpointRetainedOmission`; thus the listed consumers/producers are import-reachable from the residual route and are not exact-11-only. However, the route is not source-clean globally: `TwoSourceFreshThirdFiber.lean:779`, `TwoSourceFreshThirdResidual.lean:1168,1184,1260,1296,3474`, and multiple lines in `TriApexEndpointRetainedOmission.lean` still contain `sorry`. The listed theorem bodies themselves are non-`sorry` at their declaration sites, but transitive `sorryAx` closure must be audited before promotion.

## First missing bridge

The strongest exact candidate is the direct consumer in (1). The first missing source-level bridge is a **universal producer** from the FreshThird cross-deletion data to its packet:

```
distinct actual blocker centers + two distinct shared shell points
  -> selected class at one center has card >= 4 (or an exact four-row preserving the pair)
  -> exact row at the other center contains both points
  -> a BoundaryIndexing order proves the same `btw` side (nonalternation)
```

The current scan only exhibits this packet in a small subset of returned models; the majority fail at shared-support or two-center production. A model witness is therefore not a universal producer, and the corrected motif-free query must be consumed by an alternate branch (likely the four-row omission/deletion-survival producer in (3)), not promoted as closure.
