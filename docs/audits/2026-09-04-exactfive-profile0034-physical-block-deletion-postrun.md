# Profile 0034 physical block-deletion postrun

Date: 2026-09-04

## Outcome

The authenticated PIQD/Z3 campaign reduced both fixed radius branches to the
same eight retained groups. The selected LT and GT formulas are byte-for-byte
the same 48-assertion QF_NRA system, and each returned a custody-valid raw
`UNSAT` result. The shared system contains four strict supporting-edge blocks
and four source-row equalities. It contains neither the radius branch nor the
source-strict comparison.

This is a concrete common geometric obstruction and is strong enough to start
a Lean theorem. It is not a minimal core: the deletion process stopped when a
remaining singleton probe was unresolved, so no claim that all eight groups
are necessary is made.

## Custody

- Lane: `exactfive-hard-source-swap-profile0034-physical-block-deletion-piqd-20260904`
- Run: `run-0005`
- Execution commit: `373fb457ccf0565a3d95cb6eb2952807fabff4f0`
- Run-manifest file hash: `f323eb8971dda4cb326a0910b6a5a6e0622a54c6207e7f5beee95640fe40af9e`
- Run-manifest self-hash: `5d22048cc8618d178980222073ee0ffc432b9e9ea99ce515bf27d14024a0e9c5`
- Launch file hash: `9a33f09b319d5b4139357475ba3d8db04594885eb532decbd7e25b51c0e37056`
- Launch self-hash: `b48486c3382c162ce7dd19ee50b968e5aafa15a2168d25e83960dd4b81efe072`
- Terminal file hash: `b57c389e46f5b23adc4b6bd1c7e8056bb6ca3eed25b66933e0ab143a27129047`
- Terminal self-hash: `e389129fc08420de819ba94d2e1eb2cada434604447f5414fb828a61c56e9c40`
- Queries: 64 fresh, unique, closed Z3 sessions; one solve per session
- Independent postrun audit: passed

The immutable verifier checked all 64 query records. The independent audit
recomputed the manifest, launch, terminal, result, system, and journal hashes;
checked session lifecycle and source custody; and confirmed that both selected
physical journals have hash
`145c725971e9eed706e19aca36768c73842047ead6c33dacdb47040d09307786`.

## Results

The campaign recorded 19 custody-valid UNSAT probes, one exactly replayed SAT
probe, 38 SAT probes whose algebraic readback remained unresolved, and six
UNKNOWN probes. It accepted a deletion only on a custody-valid UNSAT result.

Both branches retained:

- `edge-index-00`: `U -> p`;
- `edge-index-01`: `p -> s`;
- `edge-index-03`: `a -> d`;
- `edge-index-04`: `d -> c2`;
- `source-row-equality-00`: `dist O a = dist O d`;
- `source-row-equality-01`: `dist O a = dist O p`;
- `source-row-equality-03`: `dist U O = dist U s`;
- `source-row-equality-05`: `dist c2 O = dist c2 a`.

The authenticated cyclic order is

```text
U, p, s, a, d, c2, q, O, y, x, v, t, u.
```

The final retained-set hash is
`b87f28e24a17ce52e7f9b45b761730befa82807937b49152b04247f0306130e9`.
The selected GT solve took 16,358 ms and the selected LT solve took 15,662 ms.
Their daemon result digest is also the same, which independently confirms that
the submitted formulas coincide.

## Completed-wave theorem mine

The new candidate is a branch-free equilateral-frame boundary obstruction on
the seven named vertices `U,p,s,a,d,c2,O`, with the four edge conditions and
four metric equalities listed above. Its intended consumer is the exact-five
hard-source-swap profile router, whose downstream live consumer is
`false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence`.

The repository Lean corpus was searched at source revision `373fb457c`.
Nearby banks include `FivePointEuclideanObstruction`,
`KalmansonRadiusOrderReversal`, and the A/B/H/I/J schemas in
`KalmansonFourEqualitySchemas`. None has this three-center equality pattern
with the fixed equilateral row. The first missing item is therefore the new
geometric obstruction itself, followed by a source-backed adapter from a live
hard-source packet to this ordered role placement. The profile computation
does not supply that adapter and remains diagnostic.

## Next action

Formalize the common geometric obstruction at the boundary/metric layer, using
the weakest signed-area hypotheses extracted from the retained supporting-edge
blocks. In parallel, reduce the 48 physical assertions at assertion granularity
through PIQD so the Lean statement does not carry unused side conditions. Once
the low-level lemma builds, add the source adapter only where the hard-source
packet proves this role order; do not treat profile 0034 as complete source
coverage.

All live-source completeness, core minimality, source realization, all-profile
execution, Lean ingress, live closure, promotion, and theorem claims remain
false.
