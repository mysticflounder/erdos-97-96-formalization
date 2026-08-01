# TwoSourceExactCollisionRowsTerminal sibling audit (2026-07-31)

Scope: current `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`,
lines 7397--11189 (the complete
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal`
namespace).  This is a source audit; no production files were edited.

## Literal `sorry` inventory

There are exactly two literal `sorry`s in the namespace:

| line | declaration | classification |
|---:|---|---|
| 7452--7456 | `false_of_crossBlockerCoincidence` | **direct load-bearing terminal**.  Its comment says the global exclusion for four cross-blocker equalities and the retained geometric-multiplicity residual; the theorem body is `by sorry`. |
| 7491--7495 | `false_of_capSourceThirdCanonicalRowSurface` | **direct load-bearing terminal**.  Its comment calls it the common cap-eight cap-source/blocker-multiplicity packet and the consolidated cardinality-sharp target; the body is `by sorry`. |

No other declaration in this namespace contains a literal `sorry`, `admit`, or
declared axiom.

## Transitive status and adapters

`#print axioms` (run against the current import) reports `sorryAx` for the two
terminals above and for these compatibility adapters, all of which have
source-clean proof terms but consume one of the two terminals:

* `false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow`
* `false_of_capSource_freshThirdBlockerFiber`
* `false_of_twoCapSources_oneSidedDeletionSurvival`
* `false_of_twoCapSources_firstFiber`
* `false_of_freshCanonicalRowOverride`
* `false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`
* `false_of_capSource_freshOutsideFirstBlockerFiber_alignedSingletonRadius`
* `false_of_capSource_freshOutsideFirstBlockerFiber_alignedRadii`
* `false_of_capSource_freshOutsideFirstBlockerFiber`
* `false_of_capSource_freshOutsideSecondBlockerFiber`

These are not independent obligations.  The source comments explicitly label
them “Compatibility …” and route to
`false_of_capSourceThirdCanonicalRowSurface` (or, for the override route, to
`false_of_capSource_freshThirdBlockerFiber`, hence the same terminal).

All other public siblings queried with `#print axioms` are kernel/source closed
relative to the ordinary Lean axioms (`propext`, `Classical.choice`,
`Quot.sound`; no `sorryAx`).  Thus none of those siblings closes either direct
terminal transitively.

## Existing consumers of source-closed siblings

Current-file consumers (line numbers in `FrontierLiveClosure.lean`) include:

* `firstFiber_shell_eq_explicitFour` (7622 via the imported descent theorem;
  10185 local use);
* `secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber` (11094);
* `commonCollisionEndpointOmission_or_complementaryMembership` (9237);
* `false_of_equalBlockers_complementaryMembership` (9247);
* `mutualCrossMembership_or_oneSidedDeletionSurvival` (9232);
* `blockerVertex_eq_one_of_mutualPair_of_selectedRow_contains_sources` (8363);
* `exists_blockerCenter_mem_capInteriorByIndex` (8449, 8451, 10141, 10180);
* `exists_mutualBlockerCapIndices_same_only_first` (8680);
* `false_of_firstPair_complementaryMembership_of_blocker_mem_firstCap`
  (8686, 8694);
* `exists_mutualBlockerCapIndices_distinct_otherCaps` (8890);
* `false_of_twoCapSources_mutualCrossMembership_distinctBlockers` (9250);
* `exists_selectedRow_escape_criticalTripleShellSeed` (10016);
* `firstFiber_globalRow_inter_firstShell_card_le_two` (10238);
* `firstFiber_globalRow_sdiff_firstShell_card_ge_two` (10266).

The following source/kernel-closed siblings currently have no consumer in this
namespace (or only their declaration):

`false_of_freshThird_sameCapCrossRowAlignment`,
`selectedSupports_inter_eq_sources_of_mutualCrossMembership_distinctBlockers`,
`sourceDeletionSurvival_or_blockerVertex_eq_mutualPair`,
`false_of_twoCapSources_complementaryMembership`,
`sixCenterDeletionSurvivalPacket_of_oneSided`,
`exists_criticalRow_escape_or_fullyDeletionRobust_criticalTripleShellSeed`,
`exists_globalK4Row_and_sourceFaithfulCriticalCover`,
`firstFiber_sourceFaithfulCriticalCover_eq_firstShell`, and
`exists_two_firstFiber_globalRow_points_outside_firstShell`.

The compatibility adapter
`false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow` and the
legacy `false_of_freshCanonicalRowOverride` likewise have no current-file
consumer; they remain transitively `sorryAx` because their bodies call the
common terminal (directly or through the fresh-third adapter).

Bottom line: the live proof frontier has two and only two direct load-bearing
`sorry` producers.  Source-closed siblings provide checked infrastructure and
some have consumers, but no source-closed sibling is a replacement consumer
that discharges either producer.  The live global coordinator immediately
outside this namespace consumes both terminals at lines 11347--11370
(`false_of_capSourceThirdCanonicalRowSurface` and
`false_of_crossBlockerCoincidence`), so each direct `sorry` is on-spine.
