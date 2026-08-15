# FreshThird literature/API audit

Scope: full read of `docs/solve-prompts/2026-08-13-freshthird-firstnonhit-direct-closure-pro-model-response-followup-2.md` (567 lines), plus read-only inspection of the live FreshThird imports and declarations. No Lean build was run and no source file was edited.

## Executive verdict

`FreshThirdPinnedEndpointOutsideSeedQueryPacket` is a source-data packet, not a literature-witness producer and not a contradiction. Its `fan` is consumed by the residual theorem, where the same-cap/cross-deletion dichotomies are obtained and the proof still ends in `sorry` (`TwoSourceFreshThirdResidual.lean:5479-5489`). The packet has cap memberships, cardinality splits, endpoint names, and selected-row support; it does not have a cap-ordered support pair, an antipodal two-chain cut, a strict omitted-point distance sign, a Ptolemy wrapper, or Cayley-Menger data.

## 1. Literature claims versus exact local APIs

| Prompt claim | Exact local declaration/import | Audit status |
|---|---|---|
| Cap-witness uniqueness/counting (NPPZ/Kominers line) | `Problem97.Dumitrescu.CapWitnessPair`, `capWitnessPairs`, `CapWitnessRanking`, `cap_witness_uniqueness`, `Dumitrescu/L5.lean:107-222` | A local combinatorial consumer exists, but it consumes an explicitly supplied `CapWitnessRanking`. The geometric ranking/strict witness producer is intentionally absent. This is not a source-entitled cap-witness theorem from the live packet. |
| Strict convex-boundary/Kalmanson inequality | `Problem97.CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw` and `complementary_dist_add_dist_lt_diagonal_sum_of_ccw`, `ATail/CapCrossingKalmanson.lean:240-300`; diagonal intersection at `:27-106` | Represented locally and reusable. It requires `ConvexIndep A`, an injective boundary enumeration whose image is `A`, CCW convexity, and four strictly increasing indices. The packet does not supply those four support indices/order facts. |
| Aggarwal strict anti-Monge cross-chain matrix | No local `anti-Monge`, `AntipodalBoundaryCut`, or `BoundaryTwoChainCut` declaration/import was found. | Not represented. Existing Kalmanson is a related four-boundary-point inequality, not the claimed antipodal cross-distance matrix theorem. Two equal row entries become a contradiction only after a source-produced two-chain cut and ordered indices. |
| Ptolemy for a selected four-row | The prompt cites Mathlib `EuclideanGeometry.mul_dist_add_mul_dist_eq_mul_dist_of_cospherical`, but no local Lean declaration/reference or explicit Ptolemy import was found. | External/library claim only; not a current local API. A selected row does provide equal-radius membership through `SelectedFourClass.support_eq_radius`, but Ptolemy additionally needs four distinct support points and their cyclic order. The packet does not package that order. |
| Perpendicular-bisector bound/uniqueness | `Problem97.Dumitrescu.perpBisector_apex_bound`, `Dumitrescu/L1.lean:128-131`, imported by `ATail/FirstApexInteriorPairGeometry.lean:9`; also `bisectorCenter_mem_firstApexInterior` at `:128` and `no_third_bisectorCenter_of_obstructionCenters_eq` at `:369` | Represented locally as a global carrier bound (at most two equidistant carrier points), and used in an exact-five obstruction. It is not the prompt's “at most one point on the opposite chain” theorem. The latter is neither locally declared nor source-instantiated from this packet. |
| Cayley-Menger planar constraints | No local `Cayley`, `CayleyMenger`, or `Menger` declaration/import was found. | Not represented. Existing `dist_sq_coord` and `signedArea2`/orientation machinery in the six-point obstruction is coordinate/algebraic infrastructure, not a Cayley-Menger API. |
| Exact real-algebra certificate route | `ATail/TwoTripleRowSixPointEuclideanObstruction.lean` and its `SixPointEuclideanObstruction` dependency use squared-distance coordinate identities, signed-area inequalities, and `nlinarith`. | Partially represented as a six-point algebraic consumer. The prompt's proposed 10–16-role universal packet and CM/SOS terminal are planning claims, not current source declarations. |

The live residual imports Kalmanson transitively through `TwoSourceFreshThirdFiber` and imports the six-point obstruction through `TwoTripleRowSixPointEuclideanObstruction` (`TwoSourceFreshThirdResidual.lean:7-16`). It does not import a local Ptolemy or Cayley-Menger module.

## 2. Exact missing source antecedent

The smallest missing *source producer* is one genuine ordered metric-witness pair from an actual selected row, not a full fixed-cardinality geometry packet. For some `K` already present in `Packet.fan.Row` (or `DRow`), the producer must expose:

1. distinct `u,v ∈ K.support`, hence the already available equal-radius fact `dist K.center u = dist K.center v` via `K.support_eq_radius`;
2. a specific cap interval/index containing the relevant support pair, with the required strict-interior/side or non-separation facts; and
3. the boundary/cyclic order (or equivalent antipodal-chain placement) needed by the selected consumer.

The missing antecedent is therefore of the shape proposed in the prompt as `capWitnessPacket_of_pinnedEndpoint_sourceFaithfulFan` / `exists_capWitnessOrder_of_pinnedEndpoint_mutualDeletion`: from `Packet.fan.fan.sourceFaithfulFan` plus the endpoint/cap-split hypotheses, produce `Nonempty` ordered cap-witness data, or explicitly return the already-known non-robust alternative. The exact theorem signature in the prompt is not a live declaration and should not be treated as compilable API.

What the packet actually supplies is visible at `TwoSourceFreshThirdResidual.lean:5256-5345`: `orderedRow`/`orderedRowAt` are endpoint/cap-split propositions; `row_center_cap`, `row_cap_inside`, and `row_cap_outside` are membership/cardinality facts; `fan` is an indexed source-faithful deletion fan. None names two support points in a cap interval or proves their side/order relation. Mutual omission remains only `dist omitted blocker ≠ selected radius`; it does not choose `>` or `<`.

## 3. Dubious or source-unentitled claims in the prompt

- “Strict anti-Monge/Kalmanson” conflates two levels. The repository has strict Kalmanson for four increasing vertices of one strictly convex CCW boundary, but no Aggarwal antipodal-cut matrix API. The claimed equality obstruction is not available from two selected rows alone.
- The Ptolemy claim is not a local theorem/import claim. The cited Mathlib URL may contain the named theorem, but that was not verified from this checkout. Even if available transitively, the packet does not establish cyclic order of an arbitrary selected support quadruple.
- “At most once on the opposite chain” is stronger than the local `perpBisector_apex_bound ≤ 2`; it requires an explicitly defined chain cut and placement hypotheses. The current packet does not place a support pair on one chain opposite both blocker centers.
- The CM paragraph is mathematically incomplete as stated: a planar Cayley-Menger determinant is an unsigned necessary relation; it does not encode orientation, and determinant-zero alone is not sufficient for a realizable planar configuration without positivity, distinctness, and rank/PSD conditions. Signed area is separate data, not “orientation distinguished by CM.”
- The “10–16 roles” claim is a heuristic extraction budget, not a theorem. `SelectedFourClass` has four support points, but the live packet does not enumerate all selected rows/supports into a fixed bounded role packet. Arbitrary `D.A` remains arbitrary.
- “Every exact selected four-row is on one circle” is conditionally source-entitled only in the limited sense that all support points are equidistant from that row's center. It does not by itself provide the cyclic order required for Ptolemy.
- The cited literature papers/results and the prompt's “literature supplies” language are external and unverified by this repository audit. They must remain `UNVERIFIED` external inputs, not promoted Lean premises. In particular, none supplies the missing implication from two same-cap blocker centers to ordered support pairs; the prompt correctly identifies that gap.

## 4. Smallest reusable Lean adapter worth adding

Do not add another Kalmanson theorem or a fixed `Fin 17` carrier model. The smallest reusable adapter is a generic boundary-order extractor for a four-point support:

```lean
SelectedFourClass.exists_boundary_order
  (B : BoundaryIndexing A) (hA : ConvexIndep A)
  (K : SelectedFourClass A center) :
  ∃ i₀ i₁ i₂ i₃,
    i₀ < i₁ ∧ i₁ < i₂ ∧ i₂ < i₃ ∧
    ({B.boundary i₀, B.boundary i₁, B.boundary i₂, B.boundary i₃} : Finset ℝ²)
      = K.support
```

This is an adapter shape, not an existing declaration. It uses the existing `support.card = 4`, `support ⊆ A`, and `BoundaryIndexing` injective/image/CCW data. It would feed the already existing strict Kalmanson consumer and, if a verified Mathlib Ptolemy import is later added, a Ptolemy wrapper. It does not pretend to solve the source gap.

The first genuinely FreshThird-specific addition should then be the source producer described in §2: an ordered cap-witness packet for one actual row. That is the smallest missing theorem with mathematical leverage; anti-Monge, perpendicular-chain uniqueness, and CM are downstream consumers and cannot be honestly wired before it exists.

