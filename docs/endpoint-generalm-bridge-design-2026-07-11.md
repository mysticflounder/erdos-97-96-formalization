# Endpoint general-m bridge design (2026-07-11)

Proof design for the geometry → `Fin 11` combinatorics bridge of
`Problem97.isM44EndpointGeneralMResidualsExcluded`
(`RemovableVertexAxiom/Base.lean:9511`, hole `:9513`). Produced by a
read-only math-prover pass; every "PROVEN in Lean" below was source-read
against committed declarations. Companion docs:
`docs/audits/2026-07-11-endpoint-classifier-transport-map.md` (finite lane),
`docs/audits/2026-07-11-endpoint-generalm-representability.md` (escape
analysis).

Rigor ledger: committed facts are marked PROVEN in Lean; the new lemmas
L1–L13 are CONJECTURED-provable with the routes given (compositions of named
committed lemmas plus finite counting); the zero-residual endpoint sweep is
EMPIRICALLY VERIFIED (exact within the finite model, not Lean); the single
HEURISTIC judgment is that the Lean native classifier reproduces the probe's
zero residuals at the committed seed (Obstruction E3, gated by `#eval`).

## 0. Architecture

The committed (4,2,2) pipeline already provides:

| Stage | Committed artifact | Status |
|---|---|---|
| m=6, card 11 forcing | `surplusCap_card_eq_six_of_endpointHyps`, `card_eq_eleven_of_endpointHyps` (`GeneralMCardEleven.lean:49/:59`) | PROVEN in Lean |
| (4,2,2) boundary blocks, direct-or-mirror | `exists_boundaryBlocks_of_isM44_surplus_card_eq_six` (`CapSelectedGeometry.lean:531`) | PROVEN in Lean |
| Blocks → canonical labeling | `BoundaryBlocks.nonempty_canonicalLabeling` (`:250`): `L : CanonicalLabeling S` with `pointOf : Fin 11 → ℝ²`, interior label sets `intS/intO1/intO2`, `CanonicalHull` | PROVEN in Lean |
| Pattern from carrier | `patternCode L F` for `F : FaithfulCarrierPattern A` (`CapSelectedCarrierBridge.lean:33`) | PROVEN in Lean |
| 4 of 6 `IncidenceOK` conjuncts | `localRowsOK/rowIntersectionsOK/pairCenterCountOK/crossSeparationOK_patternCode` | PROVEN in Lean |
| Realization | `realizes_patternCode : Realizes (rowPattern (patternCode L F)) L.pointOf` (`:78`) | PROVEN in Lean |

The bridge = (i) a one-class-prescribed `F` (row 1 := the escaped class),
(ii) a blocker from the minimality `CriticalShellSystem` with one
`overrideExactSelectedClass` at the escaped apex, (iii) two new `IncidenceOK`
adapters (`Q3OK`, `CapSelectedCountsOK`) — both seed-independent, shared with
K-B-PIN, (iv) the seed production, (v) the shared closure-core consumer. No
`U3LocalizedNoQFreePacket` / dangerous-triple import is needed (simplification
vs. the pinned lane, §1.4).

Notation: v₀ := `S.oppositeVertexByIndex S.surplusIdx`, v₁ := `… S.oppIndex1`,
v₂ := `… S.oppIndex2`; T₁ := `SelectedClass A v₁ radius`,
T₂ := `SelectedClass A v₂ rho`. `L.pointOf 0/1/2 = v₀/v₁/v₂`
(`CanonicalLabeling.point_zero/one/two_eq_opposite`, PROVEN in Lean).

## 1. Construction plan (left conjunct; right is the O1↔O2 / center 1↔2 mirror)

### 1.1 Label assignment

| Label(s) | Point(s) | Pinning fact |
|---|---|---|
| 0, 1, 2 | v₀, v₁, v₂ | `point_zero/one/two_eq_opposite` (PROVEN) |
| intS = {3,4,5,6} | interior of surplus cap | `L.surplusInterior_eq` (PROVEN) |
| intO1 = {7,8} | interior of cap O1 | `L.oppInterior1_eq` (PROVEN) |
| intO2 = {9,10} | interior of cap O2 | `L.oppInterior2_eq` (PROVEN) |
| `escapee` := labelOf x | x | `endpointLeft_escapee_mem_oppInterior2` + `mem_intO2_iff_point_mem_oppInterior2` (PROVEN) |
| `fourth` := labelOf w | the unique T₁-point in the closed surplus cap | NEW L4 |
| `deleted` | chosen from `row P 0 ∩ intS`, ≠ fourth | NEW L5 |

`labelOf` = pointwise inverse of `pointOf` (Classical.choose over
`carrier_surjective`; NEW trivial L1b — no committed pointwise inverse
exists, only the finset-level `labelsOf`).

### 1.2 Rows

`P := patternCode L F` with `F` prescribing exactly one class:
`F.classAt v₁ = SelectedFourClass.ofSelectedClass hradius hcard₁`
(support = T₁; `hcard₁` = `endpointLeft_selectedClass_card_eq_four`, PROVEN);
all other centers via `Classical.choice (exists_selectedFourClass_of_globalK4 hK4 ·)`.
Then `row P ℓ = labelsOf ((F.classAt (pointOf ℓ)).support)`
(`row_patternCode_eq_labelsOf`, PROVEN).

- **Row 1** = {7, 8, escapee, fourth}: T₁ decomposition (L4) — |T₁| = 4;
  interior(O1) ⊆ T₁ (`endpointLeft_oppInterior1_subset_selectedClass`,
  PROVEN); T₁ ∖ interior(O1) ⊆ closed O2 ∪ closed S with ≤ 1 hit each
  (`moserCapCoreSelectorAt` .2.2, PROVEN); x is the O2 hit (escape conjunct 5
  + `endpointLeft_escapee_not_mem_capByIndex_oppIndex1`, PROVEN); exactly one
  further point w in closed S, w ≠ v₁. Hence
  fourth ∈ labelsOf(surplusCap) ∖ {1} = `insert 2 intS`
  (`labelsOf_surplusCap_eq_capS`, PROVEN).
- **Row 0** = arbitrary K4-class at v₀ — no prescription; any row 0 has ≥ 2
  labels in intS (L5), from which `deleted` is chosen ≠ fourth.
- **Rows 2–10**: unconstrained by the seed; `IncidenceOK` producers are
  generic in F.

### 1.3 Blocker

`D : CounterexampleData := ⟨A, hne, hconv, hK4, S⟩`, `hmin : D.Minimal` from
the leaf's `hMin` (NEW trivial L1a). Then:

1. `H₀ : CriticalShellSystem A` from
   `CounterexampleData.exists_criticalShellSystem_of_minimal hmin` (PROVEN).
2. `H := H₀.overrideExactSelectedClass (v₁-mem) hradius hcard₁ hblocked`
   (override PROVEN), where `hblocked` = the endpoint no-qfree port (NEW L3,
   mechanical mirror of `IsM44.pinnedRightSurplusResidual_no_qfree_of_mem`
   `SurplusM44Packet.lean:4710`: any ≥4-class at v₁ contains both
   interior(O1) points → same radius (k4Radius uniqueness, L2/L3) → equals
   T₁, so erasing q ∈ T₁ leaves ≤ 3).
3. `blocker ℓ := labelOf (H.centerAt (pointOf ℓ) (L.mem_carrier ℓ))` (NEW L7).

Blocker conjuncts: totality/membership via `CriticalShellSystem.blockerVertex_ne`
and `selectedFourClass_support_eq_shell` (`U1CarrierInjection.lean:1087` —
ANY `SelectedFourClass` at a chosen blocker center equals the exact shell, so
membership holds whatever F chose; Fin-11 transport of
`source_mem_blocker_row`, `GeneralCarrierBridge.lean:176`).
`∀ q ∈ row P 1, blocker q = 1` via `overrideExactSelectedClass_centerAt`
(PROVEN). `blocker deleted ≠ 1` is purely finite (deleted ∈ intS is disjoint
from row 1's label classes except `fourth`, excluded by choice).

### 1.4 Deliberate divergence from the pinned lane

The pinned lane fixes `deleted = y` first (dangerous-center machinery,
3-class carrier alignment, `overrideAt`). Here the order flips: choose row 0
first, then pick `deleted` from it — the dangerous-row machinery, four-row
carrier variant, and the audit's "blocker = apex(opp2) collision case"
dissolve. The finite predicate cannot tell the difference. HEURISTIC
fallback: if the finite lane later needs a pinned row 2 or a shaped blocker
row at `deleted`, the pinned-style alignment is available and the T₂ facts
are already staged (see E3).

## 2. Conjunct discharge

### 2.1 `IncidenceOK P` (six conjuncts)

`LocalRowsOK`, `RowIntersectionsOK`, `PairCenterCountOK`,
`CrossSeparationOK`: committed `*_patternCode` producers — PROVEN in Lean.

**Q3OK (NEW L9, [shared]).** Three empty-triple-intersection sub-conjuncts
instantiate the committed K-Q3-5 kernel
`q3_shared_interior_false_of_adjacent_selectedClass_membership`
(`Q3SharedInterior.lean:914`) at i = oppIndex2 / oppIndex1 / surplusIdx with
verified role assignments (adjacency identities: four committed as private
lemmas in CapSelectedCarrierBridge; two at `surplusIdx` are NEW trivial
copies). The three disjunctive sub-conjuncts are finite consequences of
`CrossSeparationOK` (hullIndex offset checks; `decide`-sized).

**CapSelectedCountsOK (NEW L10, [shared]).** Centers 1,2 count-1 via the
L4-style cover (any `SelectedFourClass` at v₁/v₂ = full selected class by L2;
one surplus-cap hit). Centers 3–6 count-2 via
`exists_orderedSurplusCapSix_with_selected_hitCounts`
(`CapSelectedRowCounting.lean:826`, PROVEN) + first/last pigeonhole. Label
transport via `row_inter_labelsOf_card_eq` + `labelsOf_surplusCap_eq_capS`
(PROVEN).

### 2.2 `EndpointLeftShellOK` (nine conjuncts)

| # | Conjunct | Discharger |
|---|---|---|
| 1 | `escapee ∈ intO2` | committed escape lemma + label transport (PROVEN) |
| 2 | `fourth ∈ insert 2 intS` | L4 + `labelsOf_surplusCap_eq_capS` |
| 3–4, 6 | `deleted` facts | choice via L5 |
| 5 | `row P 1 = {7,8,escapee,fourth}` | NEW L8 (L6 prescription + L4 + committed transports) |
| 7 | blocker totality/membership | NEW L7 |
| 8 | row-1 blocker = 1 | `overrideExactSelectedClass_centerAt` + L8 |
| 9 | `blocker deleted ≠ 1` | finite from 3+4+5+7 |

### 2.3 Consumption of `ClosureCoreAlternative P blocker` (twelve branches)

- Branches 1, 3–9 (equality collision cores): committed `not_realizes_of_*`
  + `realizes_patternCode` — PROVEN.
- Branch 2 (`ExactOffCircleCore`, `core.c = blocker source`): NEW L11
  [shared] — Fin-11 port of `exactAt_blocker`
  (`GeneralCarrierBridge.lean:186`).
- Branch 10 (`PerpBisectorCore`): committed
  `false_of_convexIndep_of_perpBisectorCore` — PROVEN.
- Branches 11–12 (ordered cyclic cores): NEW L12 [shared] — cyclic order →
  strict signed-area signs via `IsCcwConvexPolygon` +
  `signedArea2_pos_of_between` (`ArcBlockContiguity.lean:34`), reversed cases
  via `Realizes.reflectXAxis` + `signedArea2_reflectXAxis`
  (`EqualityCore.lean:95/:88`), closed by
  `ConvexFivePointCore.false_of_core_of_neg` /
  `ConvexRhombusCore.false_of_core_of_neg` (PROVEN).

## 3. Hull orientation

Orientation enters exactly three times; committed lemmas suffice, no new
orientation kernels:
1. Block extraction: `nonempty_canonicalLabeling` absorbs direct/mirror into
   one `CanonicalLabeling`; both branches give the same interior label
   equalities — seed production is orientation-independent.
2. `CrossSeparationOK`: committed producer already cases on `point_eq`.
3. Ordered-core consumption (L12): 4 cases collapse to 2 (direct×direct,
   reversed×mirror give the signs directly; crossed cases via reflectXAxis).

The right leaf conjunct reuses the same `L` with the committed
`endpointRight_*` family and the mirrored L3/L4 at v₂.

## 4. Obstructions

- **E1 (choice coupling)** — resolved: row 0 has ≥ 2 intS labels (L5).
- **E2 (override coherence)** — vacuous: an H₀-shell at q with center v₁ is
  an exact ≥4-class at v₁ = T₁ ∋ q by radius uniqueness; membership routes
  through `selectedFourClass_support_eq_shell` regardless.
- **E3 (classifier granularity)** — THE real upstream risk, owned by the
  finite lane: the Lean `hasPrefixCore` core set differs from the probe's;
  the `#eval` 64-placement gate must pass before the classifier theorem
  exists. If a placement fails, the natural strengthening is pinning row 2 =
  {0, 9, 10, s} — all T₂ facts already staged in GeneralMCardEleven.lean;
  L6 takes a list of prescriptions, so the bridge design does not block
  either way.
- **E4 (selected-subset vs full-class)** — resolved at Moser apices by L2;
  at v₀ (card-6 cap) no forcing exists and none is needed.
- Well-definedness: `labelOf` uses choice (noncomputable lane); blocker is
  total on all 11 labels; minimality consumed only by the blocker, convexity
  by one-hit/Q3/counting/perp-bisector, K4 by class existence + counting. No
  dependence on U1.3/U2.B or (Q)-flavored assumptions — no circularity.

## 5. Dependency-ordered new lemmas

[shared] = seed-independent, jointly discharges K-B-PIN's remaining adapter
gaps. Suggested homes: L2–L5 in `EndpointCertificate/GeneralMCardEleven.lean`;
L6–L8, L13 in a new endpoint carrier-bridge module; L9–L12 in a shared
adapter module. {{NEEDS_ADAM_INPUT}} on placement of the shared adapters:
the design suggests `Census554/` siblings, but that directory is the pinned
session's active lane — coordinate before landing shared files there, or
land under `EndpointCertificate/` and let the pinned lane import.

1. **L1a** `CounterexampleData.minimal_of_smaller_false` (trivial glue);
   **L1b** `CanonicalLabeling.labelOf` + `pointOf_labelOf`/`labelOf_pointOf`.
2. **L2 [shared]** `SelectedFourClass.support_eq_selectedClass_of_moserCap`
   (via `moserCapCoreSelectorAt`; corollary: k4Radius uniqueness at the apex).
3. **L3** `endpointLeft_no_qfree_of_mem` (+ Right mirror at v₂).
4. **L4** `endpointLeft_selectedClass_decomposition` (+ Right mirror):
   T₁ = interior(O1) ⊔ {x} ⊔ {w}, w ∈ surplusCap ∖ {v₁}.
5. **L5 [shared]** `row_zero_two_intS_slots` + deleted-chooser.
6. **L6 [shared]** `exists_faithfulCarrierPattern_with_classes` (public,
   1–3 prescribed centers; generalizes the pinned lane's private three-class
   version).
7. **L7** `endpointBlocker` def + `_ne` + `mem_row_` + `_eq_one_of_mem_row_one`.
8. **L8** `endpointLeft_row_one_eq`.
9. **L9 [shared]** `q3OK_patternCode` (+ two trivial adjacency-index lemmas).
10. **L10 [shared]** `capSelectedCountsOK_patternCode`; **L10b [shared]**
    `incidenceOK_patternCode`.
11. **L11 [shared]** `exactAt_endpointBlocker`.
12. **L12 [shared]** ordered-core sign discharge; **L12b [shared]**
    `false_of_closureCoreAlternative_of_canonical` (all twelve branches).
13. **L13** `false_of_endpointEscapeLeft_cardEleven` (+ Right mirror), then
    the leaf proof at `Base.lean:9513` = card-11 transport + blocks +
    labeling + the two consumers (finite-lane theorem
    `closureCoreAlternative_of_incidenceOK_endpointLeftShellOK` from the
    separate classifier lane).
