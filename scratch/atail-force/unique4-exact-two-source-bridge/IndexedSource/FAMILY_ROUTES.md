# IndexedSource: p5 exact-two source valuation — family route map

Date: 2026-07-23. Lane owner: session c188f5d9 (anchor note "p5 exact-two
indexed-source valuation"). Companion lane: 019f9077 owns the trimmed
certificate (materializer) half.

## Target

For the selected p5 formula `p5.greedy-family-largest-seed0.json`
(18 retained families, 9,412 retained core clauses, 616 dense variables),
define the source valuation of every dense atom from the live
direct-or-mirror p5 exact-two packet
(`nonempty_p5DirectBoundaryPacket_or_mirror` in
`../../unique4-exact-two-occurrence/CardElevenExactTwoBoundaryPackets.lean`)
and prove satisfaction of every clause instance each retained family can
emit. The retained core subset of each family is a subset of the full
family instance set, so universally quantified per-family lemmas subsume
every authenticated retained clause; per-clause instantiation after the
trimmed certificate lands is mechanical.

No solver-selected row assignment is assumed anywhere: every atom value is
derived from packet fields.

## Dense atoms (616)

Extracted from `exact_four_outer.py::encode` (n = 11, opp1_card = 5) and
verified against `p5.input-core-map.json` named literals:

- `m_c_p` (110): selected-row membership, c ≠ p, both in 0..10.
- `eq_c_l_r` (495): complete-radius equality, unordered `{l,r}` stored as
  `l < r`, `c ∉ {l,r}`.
- `class_p` (11): membership in the distinguished first-apex class.

## Index layout (p5 = (5,5,4) aligned profile)

From the encoder with `opp1_card = 5`:

```text
first_apex     = 0    (= S.oppApex1; packet boundary_zero)
second_apex    = 4
surplus_vertex = 8
surplus cap          = {0,1,2,3,4}   cap_index 0
first opposite cap   = {4,5,6,7,8}   cap_index 1
second opposite cap  = {8,9,10,0}    cap_index 2
first-opposite strict = {5,6,7}
```

`closed_caps` metadata insertion order fixes cap_index 0/1/2 =
surplus/first_opposite/second_opposite
(`exact_four_outer.py:838`, consumed by
`run_direct_overlay_with_own_cap.py::add_own_cap_bounds`).

## Valuation

Direct packet `Q : P5DirectBoundaryPacket R profile distribution`
(boundary `b := Q.core.boundary`, pattern `F := Q.core.carrierPattern`):

- `m c p`   := `b p ∈ (F.classAt (b c) _).support`
- `eq c l r` := `dist (b c) (b l) = dist (b c) (b r)`
- `class p` := `b p ∈ SelectedClass D.A S.oppApex1 radius`

Mirror packet: identical definitions after reindexing every atom index
through `ρ(i) = -i` on `Fin 11` (`ρ(0) = 0` keeps the first apex fixed;
`ρ` maps the encoder's direct cap layout onto the mirror boundary's cap
layout and swaps forward/reflected schema orientations).

## Families and proof routes

Retained-core clause counts in parentheses (sum = 9,412). "Emittable set"
is the full loop range in the encoder; we prove satisfaction on the full
set.

1. `radius_partition_transitivity` (3,194 of 3,960)
   Emitter: `exact_four_outer.py:271-279`. Per center c and triple
   l<m<r of non-center points, three clauses of the form
   `eq(c,l,m) ∧ eq(c,m,r) → eq(c,l,r)` (all three directions).
   Route: transitivity/symmetry of real equality of `dist`. Pure logic.

2. `row_at_least_4` (997 of 1,320)
   Emitter: `add_exactly_k(row members at c, 4)` at_least half: for every
   7-subset T of the 10 non-center points, `⋁_{p ∈ T} m(c,p)`.
   Route: pigeonhole. `(F.classAt (b c)).support` has card 4, is a subset
   of carrier ∖ {center}; boundary is injective with image the carrier, so
   exactly 4 of the 10 non-center indices satisfy `m c ·`; a 7-subset of a
   10-set whose complement has 3 elements meets every 4-element subset.

3. `selected_row_subset_radius_class` (459 of 495)
   Emitter: `m(c,l) ∧ m(c,r) → eq(c,l,r)`.
   Route: classAt equidistance field (all support points share one radius
   from the center).

4. `mutual_triangle_cross_center_radius_transport` (416 of 990)
   Emitter (`exact_four_outer.py:304-310`): for distinct a, mid, bc:
   `m(a,mid) ∧ m(a,bc) ∧ m(mid,a) ∧ m(mid,bc) → eq(bc,a,mid)`.
   Route: dist symmetry + two equidistance applications:
   d(bc,a) = d(a,bc) = d(a,mid) = d(mid,a) = d(mid,bc) = d(bc,mid).

5. `full_class_cyclic_alternation` (1,307 of 1,320)
   Emitter (`exact_four_outer.py:331-339`): for centers l < r and points
   p < q (all distinct), when NOT ((l<p<r) XOR (l<q<r)):
   `¬eq(l,p,q) ∨ ¬eq(r,p,q)`.
   Route: production `Problem97` lemmas in
   `lean/Erdos9796Proof/P97/ATail/TwoCenterBisectorParity.lean` — the four
   non-alternating arrangements map exactly onto:
   - p < q < l < r → `false_of_two_centers_equidistant_pair_after` (L53)
   - l < p < q < r → `false_of_two_centers_equidistant_pair_split` (L112)
   - p < l < r < q → `false_of_two_centers_equidistant_pair_enclosed` (L74)
   - l < r < p < q → `false_of_two_centers_equidistant_pair_before` (L134)
   All take `phi : Fin A.card → ℝ²` + inj/image/ccw + ConvexIndep; use the
   RKD `cardBoundary`/`toCardIndex` bridge pattern for Fin 11 ↔ Fin A.card.

6. `first_apex_not_in_own_class` (1 of 1)
   Emitter: `¬class(0)`.
   Route: `SelectedClass` members lie at distance `radius > 0` from
   `S.oppApex1`; `b 0 = S.oppApex1` (packet `boundary_zero`);
   `dist x x = 0`.

7. `first_apex_row_eq_class` (20 of 22)
   Emitter: `m(0,p) ↔ class(p)` (two implications per point).
   Route: packet `firstApex_row_eq` : classAt(oppApex1).support =
   SelectedClass; `b 0 = S.oppApex1`.

8. `exact_two_strict_hits_at_least_2` (3 of 3)
   Emitter: at-least-2-of-3 over `class` on strict positions {5,6,7}:
   `class(i) ∨ class(j)` for each pair {i,j} ⊂ {5,6,7}.
   Route: `ExactTwoBoundaryCore.strictHitIndices_card_eq_two` (exactly two
   strict-hit boundary indices) + a cap-arc lemma that the strict
   first-opposite interior positions of the direct aligned boundary are
   exactly {5,6,7}. If two of the three were non-members, ≤ 1 hit remains
   — contradiction with card = 2.

9. `exact_two_left_adjacent_hit_at_least_1` (1 of 1)
   Emitter: `⋁_{p ∈ {0..4}} class(p)`.
   Route: distribution left-adjacent-closed-cap hit count = 1 (nonzero) +
   cap-arc lemma (surplus cap = positions {0..4}).

10. `exact_two_right_adjacent_hit_at_least_1` (1 of 1)
    Emitter: `⋁_{p ∈ {8,9,10,0}} class(p)`.
    Route: same with right adjacent closed cap = positions {8,9,10,0}.

11–13. `selected_row_endpoint_own_cap_at_most_one_{0,1,2}` (12+12+6)
    Emitter (`run_direct_overlay_with_own_cap.py:66-73`): for cap k with
    endpoint centers (0: {0,4}, 1: {4,8}, 2: {8,0}) and each pair {p,q} of
    other cap positions: `¬m(c,p) ∨ ¬m(c,q)`.
    Route: `Problem97.CapSelectedRowCounting.
    selectedFourClass_inter_orderedCap_first_card_le_one` /
    `..._last_card_le_one`. RESOLVED plumbing:
    `S.capByIndex_cgn4g_capData_oriented hconv i`
    (`SurplusM44Packet/Shard01.lean:704`) yields
    `⟨m, L, Packet : CGN.MecCapPacket A L, Hside, Hord, hcap, horient⟩`
    with `hcap : Finset.univ.image L.points = S.capByIndex i` and
    `horient` identifying `L.points (firstIndex/lastIndex Packet.hm)`
    with `(S.triangleByIndex i).v2/v3` (either order). Recipe: transport
    `K : SelectedFourClass A center` along the endpoint equality
    (inline one-liner `h ▸ K`; the `transportSelectedFourClass` helpers
    in production are all `private`), apply the endpoint lemma, rewrite
    via `hcap`. Complete worked example (private, scratch):
    `critical-fiber-both-off-cap-localization/
    CriticalFiberBothOffCapLocalization.lean:144-190`. Remaining task-#3
    detail: identify boundary apexes (b 0/b 4/b 8 direct; ρ-images
    mirror) with `(S.triangleByIndex i).v2/v3` per cap.

14–16. `selected_row_own_cap_at_most_two_{0,1,2}` (12+12+2)
    Emitter: for cap k, every center c in the cap, every triple of other
    cap positions: `¬m(c,p₁) ∨ ¬m(c,p₂) ∨ ¬m(c,p₃)`.
    Route: `Problem97.CapSelectedRowCounting.
    selectedFourClass_inter_capByIndex_card_le_two`.

17. `seeded_full_linear_kalmanson_cut` (895)
    Emitter (`run_seeded_full_linear_cegar.py::add_seed_cuts`): for each of
    the 4 records in `kalmanson_row_instance_schemas_seeded_v3.json`
    (role counts 8, 6, 6, 6), every increasing embedding
    (`itertools.combinations`) of roles into 0..10, forward and reflected
    `(k-1-·)` orientations: clause `⋁ ¬m(cᵢ,pᵢ)` over the record's
    membership pairs.
    Route: the all-true assignment of any instance is an
    `orientedSchemaAt` occurrence; refute with the bound consumers
    (`ExactTwoSchemaDecoder`):
    - `false_of_p4OrientedSchemaAt` ← corrected-owncap-p4-four-k2
    - `false_of_p5FourRowOrientedSchemaAt` ← corrected-owncap-p5-two-k1-two-k2
    - `false_of_p5TriangleAOrientedSchemaAt` ← corrected-unseeded-p5-six-role-k2-triangle
    - `false_of_p5TriangleBOrientedSchemaAt` ← corrected-p5-six-role-k2-triangle-block-reflected
    `orientedSchemaAt` covers exactly the increasing schema and its linear
    reflection — the same two orientations the runner emits.

18. `verified_kalmanson_order_schema_cut` (2,062)
    Emitter (`exact_four_outer.py:743-757`): for each schema in the
    kernel-only Kalmanson bank (10 schemas), every increasing embedding,
    forward and reflected orientations: clause `⋁ ¬m(cᵢ,pᵢ)`.
    Route: `RetainedKalmansonDecoder.false_of_retainedOccurrence` (18
    schema/orientation constructors — the reduced p5 core retains exactly
    those); reflected-only schemas 5 and 8 additionally need the
    MirrorSchema58 normalized consumers on the mirror branch.
    NOTE: the decoder covers the RETAINED (schema, orientation) pairs
    only. Satisfaction lemmas for this family are therefore quantified
    over the retained instance set, not the full emittable set — the
    non-retained orientations are absent from the core, hence never
    needed by composition.

## Mirror branch

The mirror valuation evaluates CNF index `i` at boundary position
`ρ(i) = -i mod 11` of the (CCW) mirror packet boundary `b'`. Cap arcs pull
back to the direct layout: `ρ({0..4}) = {7,8,9,10,0}` (mirror surplus),
`ρ({4..8}) = {3,4,5,6,7}` (mirror first opposite), `ρ({8,9,10,0}) =
{0,1,2,3}` (mirror second opposite); apexes `ρ(0)=0`, `ρ(4)=7`, `ρ(8)=3`.

**Wraparound resolution (Kalmanson transport).** `ρ` is not monotone on
linear tuples (an increasing embedding containing index 0 pulls back with
a wraparound: `ρ(0)=0` stays smallest while the rest reverse — a
rotation-composed reversal, not `reflectSchema`). Factor `ρ` instead as

```text
ρ(i) = ρ'(i) + 1 mod 11,   ρ'(i) = 10 - i  (strict linear reversal)
```

and evaluate against the shifted boundary `c := b' ∘ (· + 1)`, which is
still CCW/injective/image-A by the existing cyclic-shift lemmas
(`isCcwConvexPolygon_cyclicShift`, `injective_cyclicShift`,
`image_univ_cyclicShift` — already used in
`CardElevenExactTwoBoundaryPackets.lean`). Then
`b'(ρ i) = c(ρ' i)` definitionally, and `ρ'` reverses EVERY increasing
tuple strictly, with no case split:

- retained forward-`σ` clause at embedding T ↦ `reflectSchema σ`
  occurrence at the reversed tuple `(10-t_{k-1} < … < 10-t_0)` on `c`;
- retained reflected clause ↦ normalized-`σ` occurrence on `c`
  (`reflectSchema` is an involution on the fixed schema lists — provable
  by `decide`/`rfl` per schema).

Consequences:
- family 18 mirror coverage: retained forward schemas (0,1,2,3,4,6,7,9)
  use the decoder's REFLECTED constructors; retained reflected schemas use
  the NORMALIZED constructors; schemas 5/8 (retained reflected-only) need
  normalized consumers absent from the decoder — supplied exactly by
  `MirrorSchema58.false_of_schemaFive_normalized_at` /
  `false_of_schemaEight_normalized_at` (generic in the boundary, so they
  accept `c`). This matches MirrorSchema58's "Remaining ingress" note.
- family 17 mirror coverage: `orientedSchemaAt` terminals already cover
  both orientations — no new consumers.
- family 5 (cyclic alternation): the linear XOR side condition is
  invariant under simultaneous `ρ'`-reversal of centers and points, so the
  same bisector lemma applies to `c` with transformed indices.
- cap/exact-two/own-cap families: use the mirror cap-position lemmas
  directly on `b'` at `ρ`-images (no orientation content).

## Kalmanson terminal inventory (survey complete)

Namespaces: RKD = `Problem97.RetainedKalmansonDecoderScratch`,
ETSD = `Problem97.ATailUniqueFourExactTwoSchemaDecoderScratch`,
MS58 = `Problem97.P5MirrorSchema58Scratch`.

- `patternCode boundary hmem F center point =
   decide (boundary point ∈ (F.classAt (boundary center) (hmem center)).support)`
  (ETSD:41-46, simp lemma `patternCode_eq_true_iff` ETSD:48). The m-atom
  valuation is DEFINED as this membership so Kalmanson wiring is free.
- `schemaAt P targets schema = schema.all fun m => P targets[m.1]! targets[m.2]!`
  (ETSD:123-126); `orientedSchemaAt = schemaAt σ || schemaAt (reflectSchema |targets| σ)`
  (ETSD:128-131); `reflectSchema k σ = σ.map fun m => (k-1-m.1, k-1-m.2)`
  (ETSD:116-118).
- RKD `RetainedOccurrence` (RKD:910-947): 18 constructors
  (`schemaNNormalized`/`schemaNReflected` for N ∈ {0,1,2,3,4,6,7,9};
  `schema5Reflected`, `schema8Reflected` only), consumed by
  `false_of_retainedOccurrence` (RKD:951): hypotheses
  `ConvexIndep A, A.card = 11, boundary, hmem, injective, image, ccw, F`.
  Role tuples: RKD-local `OrderedFour/Five/Six/Seven/Eight` (strict `<`
  chains + `.values`).
- ETSD oriented terminals (for family 17), each taking ETSD-local
  `OrderedSix`/`OrderedEight`:
  `false_of_p4OrientedSchemaAt` (`p4FourEndpointK2Schema`, 8 roles),
  `false_of_p5FourRowOrientedSchemaAt` (`p5TwoK1TwoK2Schema`, 6),
  `false_of_p5TriangleAOrientedSchemaAt` (`p5TriangleASchema`, 6),
  `false_of_p5TriangleBOrientedSchemaAt` (`p5TriangleBSchema`, 6).
  Schema lists match the seeded bank records' membership pairs exactly
  (verified: record row_instances flatten-sort to the ETSD constants).
- MS58 `false_of_schemaFive_normalized_at` (RKD `OrderedFive`, `schema5`),
  `false_of_schemaEight_normalized_at` (RKD `OrderedEight`, `schema8`) —
  generic in boundary; packet-level
  `P5MirrorBoundaryPacket.false_of_normalizedSchema58Occurrence` fixes
  boundary = `Q.core.boundary` (unshifted; for the shifted-boundary
  transport use the generic `_at` forms).
- CAUTION: RKD and ETSD each define their own `OrderedSix`/`OrderedEight`;
  they are not defeq. Pick per terminal.

## Boundary/packet inventory (survey complete)

All in `Problem97.ATailUniqueFourAlignedP5BoundaryScratch`
(`scratch/atail-force/unique4-aligned-p5-occurrence/AlignedP5BoundaryPacket.lean`)
unless noted.

- `DirectAlignedBoundary` (L282): apex lemmas `boundary_zero` (0 =
  oppApex1, L427), `boundary_four` (4 = oppApex2, L441), `boundary_eight`
  (8 = surplus apex `S.oppositeVertexByIndex S.surplusIdx`, L455);
  interior membership `boundary_surplusInteriorIndex_mem` (indices 1,2,3 ∈
  capInteriorByIndex surplusIdx, L469),
  `boundary_firstOppositeInteriorIndex_mem` (5,6,7 ∈ capInterior oppIndex1,
  L484), `boundary_secondOppositeInteriorIndex_mem` (9,10 ∈ capInterior
  oppIndex2, L500); shared `boundary_injective`/`boundary_ccw`/
  `boundary_image` (L396/401/407).
- `MirrorAlignedBoundary` (L520): apexes `boundary_zero` (0 = oppApex1,
  L578), `boundary_three` (3 = surplus apex, L592), `boundary_seven`
  (7 = oppApex2, L606); interiors: mirror surplus {8,9,10} (L721), mirror
  first-opp {4,5,6} (L736), mirror second-opp {1,2} (L752). Mirror caps:
  second_opp {0,1,2,3}, first_opp {3..7}, surplus {7,8,9,10,0} — exactly
  `ρ` of the direct layout (ρ(4)=7, ρ(8)=3). ✓
- Closed-cap BLOCK image lemmas (`surplusClosedIndices_image` etc.,
  L1130/1170/1210 direct, L1456/1418/1384 mirror) live on the ≥3-arm
  packet wrappers `AlignedP5BoundaryPacket`/`AlignedP5MirrorBoundaryPacket`,
  NOT on the bare boundary structures the exact-two packets use — re-derive
  locally from the apex + interior lemmas if needed.
- `FaithfulCarrierPattern` (production,
  `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1391`): `classAt : ∀
  center ∈ A → SelectedFourClass A center`. `SelectedFourClass`
  (same file L405): `support ⊆ A`, `support.card = 4`, `radius_pos`,
  `support_eq_radius`, `center_not_mem`. `ofSelectedClass` (L425),
  `inter_card_le_two` (L479).
- `SelectedClass A s d = A.filter (dist s · = d)`; simp `mem_selectedClass`
  (`WitnessPacketInterface.lean:53/56`).
- `ExactTwoStrictHitDistribution`
  (`unique4-class-cap-distribution/UniqueFourClassCapDistribution.lean:68`,
  Prop): `strict_hit_eq_two` (∩ capInteriorByIndex oppIndex1 card = 2),
  `left_adjacent_hit_eq_one` (∩ leftAdjacentCapByIndex oppIndex1 = 1),
  `right_adjacent_hit_eq_one` (∩ rightAdjacentCapByIndex oppIndex1 = 1).
  RESOLVED (Shard01.lean:922/930, verified s=0 case): `leftAdjacentCapByIndex
  oppIndex1 = capByIndex oppIndex2 = oppCap2` and `rightAdjacentCapByIndex
  oppIndex1 = capByIndex surplusIdx = surplusCap` — the Lean left/right
  naming is CROSSED relative to the encoder's (encoder left adjacent =
  surplus cap {0..4} ← Lean `right_adjacent_hit_eq_one`; encoder right
  adjacent = second opp cap {8,9,10,0} ← Lean `left_adjacent_hit_eq_one`).
- Own-cap counting (`lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean`):
  `selectedFourClass_inter_capByIndex_card_le_two` (L257: SurplusCapPacket
  + ConvexIndep + center ∈ capByIndex i → (K.support ∩ capByIndex i).card
  ≤ 2); endpoint forms `selectedFourClass_inter_orderedCap_first_card_le_one`
  (L171) / `_last_card_le_one` (L213) need `CGN.MecCapPacket A L` +
  `MinorCapSideHypotheses` + `StrictCapOrder` + K centered at the ordered
  cap's first/last point. RESOLVED: `S.capByIndex_cgn4g_capData_oriented
  D.convex i` (SurplusM44Packet/Shard01.lean:704) yields ⟨m, L, Packet,
  Hside, Hord, hcap : univ.image L.points = S.capByIndex i, horient⟩ with
  `horient` locating triangle v2/v3 at the ordered cap's first/last point;
  re-center K via `classAt_support_congr` + `boundary_endpoint_eq` /
  `mirror_boundary_endpoint_eq` (demonstrated in
  `DirectCapFamilies.endpoint_row_inter_cap_card_le_one` and its mirror
  clone).
- Reindexing: `card11BoundaryReflection : Equiv.Perm (Fin 11)`
  (`Census554/SeparationMirror.lean:36`, i ↦ -i, fixes 0). Cyclic shifts:
  `isCcwConvexPolygon_cyclicShift` / `injective_cyclicShift` /
  `image_univ_cyclicShift` (`ConvexCyclicOrder/Basic.lean:196/212/219`).
- `nonempty_p5DirectBoundaryPacket_or_mirror`
  (`CardElevenExactTwoBoundaryPackets.lean:476`); packet structures
  `P5DirectBoundaryPacket` (L425) / `P5MirrorBoundaryPacket` (L437) with
  `orientedBoundary` (Direct/MirrorAlignedBoundary), `core :
  ExactTwoBoundaryCore R distribution`, `boundary_eq`.
- `ExactTwoBoundaryCore` fields: boundary, injective, ccw, image = D.A,
  `boundary_zero = S.oppApex1`, `carrierPattern : FaithfulCarrierPattern
  D.A`, `firstApex_mem`, `firstApex_row_eq : (classAt oppApex1).support =
  SelectedClass D.A S.oppApex1 radius`; `strictHitIndices` +
  `strictHitIndices_card_eq_two`.

## Composition seam (for the 019f9077 lane)

This module exposes per-family satisfaction lemmas keyed by
`DenseAtom`-level interpretations. When
`p5-largest.trimmed-certificate.json` + the authenticated occurrence map
exist, each trimmed clause's named literals (family + parameters) select
one satisfaction lemma instance; the Boolean assignment for the UNSAT
theorem is `fun v => decide (interp (atomOf v))` under
`Classical.propDecidable`. No field of this module depends on the trim:
trimmed core ⊆ retained set ⊆ proven set (family 18 proven on the
retained set).
