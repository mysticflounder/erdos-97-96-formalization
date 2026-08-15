# Schema 10 global theorem-bank audit

## Scope and search

Schema 10 is the direct-negation contract in `schema-v10-contract.md` (17-point,
4913 clauses): for every `b ≠ c` and valid arm, at most one selected shared
point is between the two centers and at most one is outside.  The companion
`artifacts-schema-v10/schema-v10-summary.json` records all 16 mapping/order/
deletion cases as `UNKNOWN` (SAT=0, UNSAT=0); its trust boundary is bounded exact
incidence only, with no Euclidean realization or arbitrary-cardinality lift.

The required post-CEGAR searches were run with
`nthdegree docs search --lean --agentic` for (i) a universal source theorem
forcing two coherent selected-four rows to share two points with nonalternating
cyclic placement, and (ii) a side-parametric nonhit/incidence-transfer or
aligned-retained same-cap terminal.  All configured Lean corpora were indexed
(`erdos-97-96-lean`, `p97-rvol-lean`, `formal-conjectures-lean`,
`formal-conjectures-mathlib-lean`, `erdos-unit-distance-lean`,
`erdos-97-96-formalization-lean`, `tauceti-lean`, `mathlib`).  The mandated
registries were also scanned:

* `docs/general-n-certificate-bank-mining-2026-07-09.md` (cyclic-separation
  section, lines 760--855),
* `certificates/p97_rvol_general_n_mining.{md,json}`,
* `certificates/erdos97_legacy_general_n_mining.{md,json}`, and
* `certificates/erdos_general_theorem_p97_mining.{md,json}`.

No registry entry contains `FreshThird`, `SameCap`, `nonHit`, or an equivalent
side-parametric transfer.  The cyclic-separation registry explicitly describes
an ambient-label consumer and says that a concrete row-level certificate and
finite cover are still missing.

## Indexed theorem hits (and their limits)

### Source/ingress producers

* `exists_globalK4Row_and_sourceFaithfulCriticalCover` at
  `P97/ATail/FrontierLiveClosure/TwoSourceRetainedMinimalCore.lean:742` gives a
  selected/critical four row, deletion obstruction, and cap localization for a
  single source.  It does not produce a second coherent row or a shared pair.
* `firstFiber_firstSourceHit_or_fiveCenterDeletion` and
  `firstFiber_twoAnchorHits_or_anchoredFiveCenterDeletion` at
  `P97/ATail/FirstFiberOverlapDescent.lean:386,528` are conditional hit-versus-
  deletion disjunctions.  They do not produce cyclic order or a universal
  Schema-10 arm closure.
* `exists_faithfulCarrierPattern_with_two_classes` at
  `P97/U1CarrierInjection.lean:1686` lifts two arbitrary selected classes into a
  faithful carrier pattern under global K4.  It has no FreshThird cap alignment,
  omission, or source-row producer.
* `nonHit_of_not_crossRowHit` at
  `P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean:1770` normalizes a
  non-hit into `FreshThirdCapSourceNonHit`; this is a residual-case producer,
  not an incidence-transfer-to-contradiction theorem.

### Shared-pair and cyclic consumers

* `selectedSupports_inter_eq_sources_of_mutualCrossMembership_distinctBlockers`
  at `TwoSourceFreshThirdFiber.lean:1350` proves exact support intersection
  `{source₁,source₂}` from mutual cross-membership and distinct blockers.  It is
  the strongest source-level overlap producer found, but has no cyclic order or
  nonalternating conclusion.
* `selectedFourClass_shared_pair_separated` at
  `P97/Phase3SharedPairSeparation.lean:31` consumes two rows and four support
  memberships under an injective CCW convex boundary and proves the two shared
  points are on opposite sides (one between, one outside).  This is explicitly
  the alternating placement, hence cannot discharge Schema 10's direct-negation
  branch.
* `freshThird_canonicalSource_differentFreshCap_sharedPairCyclicPacket` and
  `freshThird_canonicalDifferentCap_endpointPlacement` at
  `TwoSourceCanonicalSurface.lean:933,1500` add a canonical-source/different-
  fresh-cap packet and return the same alternating placement.  Their cap,
  center-membership, and off-cap hypotheses are conditional; no theorem
  supplies those hypotheses for every surviving Schema-10 arm.
* `false_of_nonalternating_equidistant` at
  `.../IndexedSource/CyclicAlternationCore.lean:97` is a universal geometric
  consumer: given a realized injective CCW polygon, two-center shared-pair
  equalities, and a same-side (`hside`) placement, it proves `False`.  No
  FreshThird source theorem produces its realization/order hypotheses.
* `false_of_two_selected_rows_shared_late_pair` at
  `P97/ATail/CapCrossingKalmanson.lean:427` is another geometric consumer for
  an increasing quadruple whose two rows share the last pair; it has no
  FreshThird source ingress.

### Same-cap/nonhit residual consumers

* `false_of_freshThird_sameCapCrossRowAlignment` at
  `TwoSourceFreshThirdFiber.lean:525` consumes
  `FreshThirdSameCapCrossRowAlignment` and derives the same-cap two-point bound
  contradiction.  The missing direction is a producer of that alignment.
* `false_of_freshThird_firstNonHit_of_capWideAlignment` (and its symmetric
  second-nonhit theorem) at `TwoSourceFreshThirdResidual.lean:488` consume a
  normalized non-hit plus the same-cap alignment; they do not establish the
  alignment.
* `false_of_freshThird_canonicalDifferentCap_of_endpointDeletionObstructions`
  at `TwoSourceFreshThirdFiber.lean:2891` is conditional on four endpoint
  deletion obstructions and a canonical/different-cap packet.  It is a
  consumer/obstruction, not a universal producer of those obstructions.
* `false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` at
  `TwoSourceFreshThirdResidual.lean:529` remains `by sorry`; its private helper
  only handles a common-radius subcase.  This is the first load-bearing
  unresolved residual, not a theorem-bank closure.

The p97-rvol same-side hits are unrelated to FreshThird ingress:
`w_not_mem_C2_C3_of_sameSideTerminal` (`RVOL.P97.C5D3BC2LargeCapInterior`) only
excludes the companion residual from the other two caps; module
`C5D3BSameSidePacketAssembly` documents that its same-side facts are branch
case facts, and the exact-five cross-incidence terminal explicitly says its
missing producer must still come from minimality and parent geometry.

## Import reachability

The relevant source files are import-reachable in the live P97 spine:
`TwoSourceCanonicalSurface` imports `TriApexEndpointRetainedOmission`;
`TwoSourceFreshThirdFiber` imports `TwoSourceCanonicalSurface` and
`CapCrossingKalmanson`; `TwoSourceFreshThirdResidual` imports
`TwoSourceFreshThirdFiber`; and the top-level `ATail/FrontierLiveClosure.lean`
imports all three.  `Phase3SharedPairSeparation` imports `U1CarrierInjection`,
so the faithful-carrier and shared-pair consumers are available transitively.
Reachability does not change their conditional hypotheses or polarity.

## Verdict and first missing bridge

No theorem-bank hit closes Schema 10.  In particular, no source-level universal
producer was found that, for every surviving mapping/order/deletion arm, yields
either (a) two distinct coherent FreshThird selected-four rows sharing exactly
the two FreshThird points with an explicit **nonalternating** cyclic placement
and a Euclidean realization, or (b) a side-parametric transfer from every
`FreshThirdCapSourceNonHit` to `FreshThirdSameCapCrossRowAlignment` (or to an
aligned retained minimal-deletion terminal).

The first missing bridge is therefore that universal producer/transfer.  The
existing bank supplies only alternating shared-pair consumers, conditional
cap-packet/deletion obstructions, and a residual theorem still containing
`sorry`.  Consequently the external Schema-10 result remains empirical
`UNKNOWN`; no SAT/UNSAT status can be promoted to Lean closure from the current
global theorem bank.
