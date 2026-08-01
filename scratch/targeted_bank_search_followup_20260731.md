# Targeted theorem-bank search follow-up (2026-07-31)

## Search performed

Exactly one corpus query was run:

```text
nthdegree docs search --lean --agentic "rank power finite incidence cap-source blocker coincidence exact collision rows cap profile (8,6,6)"
```

The agentic model was unavailable for this account, so `nthdegree` fell back to
ranked search.  The relevant returned hits (in rank order) were:

1. `sixCenterDeletionSurvivalPacket_of_oneSided`
   (`erdos-97-96-formalization-lean`, `ATail.FrontierLiveClosure`): a
   one-sided cap-source deletion producer yielding a six-center finite packet.
2. `false_of_capSourceThirdCanonicalRowSurface`
   (same module): the exact current cap-source terminal (still `sorry`).
3. `U1LargeCapRouteBTailLiveData`
   (`p97-rvol-lean`): unrelated U1 Route-B live-data structure.
4. `false_of_firstPair_complementaryMembership_of_blocker_mem_firstCap`
   (same module): source-clean local contradiction for complementary first-pair
   support membership when one source center lies in the first cap.
5. `firstFiber_firstSourceHit_or_fiveCenterDeletion`
   (`ATail.FirstFiberOverlapDescent`): first-fiber producer/case split.
6. `A1FiniteIncidenceRows`
   (`erdos-97-96-lean`): generated A1 exact-`P0` finite-incidence row table.
7. `false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits`
   (same module): larger exact-four/two-radius coordinator contradiction.
8. `LargeCapPCenteredT2SourceExactDangerousRowStatement`
   (`p97-rvol-lean`): U1 p-centered t2 source-row obligation.

## Applicability to the two live leaves

| hit | `false_of_crossBlockerCoincidence` | `false_of_capSourceThirdCanonicalRowSurface` | assessment |
|---|---|---|---|
| `sixCenterDeletionSurvivalPacket_of_oneSided` | indirect producer only | indirect producer only | Requires `FirstFiberCapSourceWitness` for two sources plus `TwoCapSourcesOneSidedDeletionSurvival`; returns a six-center cardinality packet, not `CrossBlockerCoincidence` or `CapSourceThirdCanonicalRowSurface`. Could supply finite-cardinality fuel only after a new bridge from the residual split. |
| `false_of_firstPair_complementaryMembership_of_blocker_mem_firstCap` | no direct match | no direct match | Exact assumptions are two first-fiber cap-source witnesses, mutual cross-membership, complementary support membership, and one source center in `S.capByIndex S.oppIndex1`. The cross-blocker leaf has only `CrossBlockerCoincidence` + `GeometricMultiplicityResidual`; the cap-source leaf has `CapSourceThirdCanonicalRowSurface` + residual. No checked adapter from either packet to this complementary branch was found. |
| `false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits` | upstream/coordinator only | upstream/coordinator only | Requires `CriticalPairFrontier F`, residual packets `R/P/B/L/N/T`, exact-four first radius, a distinct second radius with a second exact-four class, and interior-cardinality `= 2`. It is a larger coordinator and does not consume either terminal's two-argument interface. |
| `A1FiniteIncidenceRows` | no | no | Generated A1 exact-`P0` row inventory from a different namespace/case split; no `CriticalShellSystem`, `CrossBlockerCoincidence`, or cap-source witness interface. |
| `LargeCapPCenteredT2SourceExactDangerousRowStatement` / `false_of_largeCap_pCentered_t2Source_exactDangerousRow` | no | no | U1 `CounterexampleData`/`MoserTriangle`/`CapTriple`/`CriticalSourceRows` API, with surplus-cap `>4`, a second large cap, and a dangerous t2 row. It is not type-compatible with the ATAIL two-source collision leaves. |

## Additional local theorem-bank facts

The local Dumitrescu bank contains source-clean finite-incidence/power lemmas,
but they are not imported by `FrontierLiveClosure.lean` and use a separate
`Problem97.CapTriple` API:

* `Problem97.Dumitrescu.powersetCard_two_eq_cap_union` partitions
  `A.powersetCard 2` into the three intra-cap pair families plus
  `crossCapEdges`.
* `Problem97.Dumitrescu.power_mean_three_caps` and
  `power_mean_three_caps_nat` are generic three-cap power-mean inequalities.

Neither lemma supplies the retained-source/support incidence or blocker
equalities needed by either live terminal.  Thus this search found no
source-clean theorem-bank consumer that closes either leaf under its current
hypotheses; the first missing bridge remains a packet-to-terminal adapter or a
new global exclusion of the four cross-blocker equalities/cap-source surface.
