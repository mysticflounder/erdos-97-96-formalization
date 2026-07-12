/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.CapSelectedRowCounting
import Erdos9796Proof.P97.Census554.CapSelectedFiniteCode

/-!
# General-`m` endpoint leaf, card-eleven staging infrastructure

Staging support for the spine leaf
`Problem97.isM44EndpointGeneralMResidualsExcluded`
(`RemovableVertexAxiom/Base.lean`), the `5 < S.surplusCap.card` branch of the
endpoint residual exclusions.  This module is deliberately upstream of
`Base.lean`: it imports only the committed card-eleven forcing machinery
(`CapSelectedRowCounting`) and the committed finite card-eleven pattern-code
vocabulary (`Census554.CapSelectedFiniteCode`), so it can be built and consumed
without touching the leaf's own file.

The route analysis is recorded in
`docs/audits/2026-07-11-endpoint-generalm-representability.md`.

Three groups of facts are staged here:

1. **Card-eleven forcing transport.**  Under the leaf's hypotheses the surplus
   cap has size exactly `6` and `A.card = 11`.
2. **Escape row-shape facts at card eleven.**  From a left endpoint escape at
   `S.oppIndex1`, the selected class at the opposite Moser apex is exactly four
   and interior-pinned, the escapee lands in the second opposite cap and off the
   first, and the metric conjuncts (rho as a Moser side, the first-radius
   exclusion) are exposed in Moser-apex form.
3. **Seed predicates.**  Lean versions of the finite endpoint seed shapes
   `EndpointLeftShellOK` / `EndpointRightShellOK`, mirroring the committed
   `PinnedShellOK` over the canonical `Fin 11` pattern-code vocabulary.
-/

namespace Problem97

namespace EndpointCertificate

open scoped EuclideanGeometry InnerProductSpace

/- ## 1. Card-eleven forcing transport -/

/-- Under the endpoint leaf's hypotheses (`IsM44` with `5 < surplusCap.card`),
the surplus cap has size exactly six. -/
theorem surplusCap_card_eq_six_of_endpointHyps
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hM44 : S.IsM44) (hgt : 5 < S.surplusCap.card) :
    S.surplusCap.card = 6 :=
  CapSelectedRowCounting.SurplusCapPacket.surplus_card_eq_six_of_convexIndep_K4
    S hconv hK4 hM44 hgt

/-- Under the endpoint leaf's hypotheses the ambient point set has size eleven:
the general-`m` endpoint branch is entirely a card-eleven `(6,4,4)` problem. -/
theorem card_eq_eleven_of_endpointHyps
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hM44 : S.IsM44) (hgt : 5 < S.surplusCap.card) :
    A.card = 11 :=
  CapSelectedRowCounting.SurplusCapPacket.card_eq_eleven_of_surplus_card_gt_five
    S hconv hK4 hM44 hgt

/- ## 2. Left endpoint escape row-shape facts at card eleven

All facts are stated for the left escape at `S.oppIndex1`, the shape consumed by
the first conjunct of the leaf.  The `radius`/`rho`/`x` witnesses are those of
the escape hypothesis. -/

section LeftEscape

variable {A : Finset ℝ²} (S : SurplusCapPacket A)
  {radius rho : ℝ} {x : ℝ²}

/-- (2a) The selected class at the Moser apex opposite the first non-surplus cap
is exactly four points.  Composition of `moserCapCoreSelectorAt` with the
`IsM44` cap-card-four fact at `oppIndex1`; the cardinality bound and positivity
come from the escape hypothesis. -/
theorem endpointLeft_selectedClass_card_eq_four
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) :
    (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card = 4 := by
  obtain ⟨hrad, _hrho, hcard, _hxT, _hxEsc, _hcard2, _hdx, _hshared, _hexcl⟩ := hend
  exact (S.moserCapCoreSelectorAt hconv S.oppIndex1 hrad
    hM44.oppIndex1_cap_card_eq_four hcard).1

/-- (2a) The selected class at the Moser apex opposite the first non-surplus cap
is interior-pinned: it contains the whole strict interior of that cap. -/
theorem endpointLeft_oppInterior1_subset_selectedClass
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) :
    S.capInteriorByIndex S.oppIndex1 ⊆
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius := by
  obtain ⟨hrad, _hrho, hcard, _hxT, _hxEsc, _hcard2, _hdx, _hshared, _hexcl⟩ := hend
  exact (S.moserCapCoreSelectorAt hconv S.oppIndex1 hrad
    hM44.oppIndex1_cap_card_eq_four hcard).2.1

/-- (2b) The escapee lies in the closed second non-surplus cap.  The escape puts
`x` in the left-adjacent closed cap of `oppIndex1`, which is the closed cap at
`oppIndex2`. -/
theorem endpointLeft_escapee_mem_capByIndex_oppIndex2
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) :
    x ∈ S.capByIndex S.oppIndex2 := by
  obtain ⟨_hrad, _hrho, _hcard, _hxT, hxEsc, _hcard2, _hdx, _hshared, _hexcl⟩ := hend
  have hxLeft := (Finset.mem_sdiff.mp hxEsc).1
  rwa [S.leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2] at hxLeft

/-- (2b) The escapee lies off the closed first non-surplus cap. -/
theorem endpointLeft_escapee_not_mem_capByIndex_oppIndex1
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) :
    x ∉ S.capByIndex S.oppIndex1 := by
  obtain ⟨_hrad, _hrho, _hcard, _hxT, hxEsc, _hcard2, _hdx, _hshared, _hexcl⟩ := hend
  have hxNot := (Finset.mem_sdiff.mp hxEsc).2
  exact fun h => hxNot (Finset.mem_union_left _ h)

/-- (2b) The escapee lies off the closed first non-surplus cap's right-adjacent
cap, i.e. it is not on the surplus cap side reached through `oppIndex1`. -/
theorem endpointLeft_escapee_not_mem_rightAdjacentCap
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) :
    x ∉ S.rightAdjacentCapByIndex S.oppIndex1 := by
  obtain ⟨_hrad, _hrho, _hcard, _hxT, hxEsc, _hcard2, _hdx, _hshared, _hexcl⟩ := hend
  have hxNot := (Finset.mem_sdiff.mp hxEsc).2
  exact fun h => hxNot (Finset.mem_union_right _ h)

/-- (2c) The escapee is on the second radius centred at the Moser apex opposite
the second non-surplus cap.  This rewrites the escape's `rightOuterVertexByIndex`
into Moser-apex form. -/
theorem endpointLeft_dist_escapee_eq_rho
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) :
    dist x (S.oppositeVertexByIndex S.oppIndex2) = rho := by
  obtain ⟨_hrad, _hrho, _hcard, _hxT, _hxEsc, _hcard2, hdx, _hshared, _hexcl⟩ := hend
  rwa [S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
    at hdx

/-- (2c) `rho` is the Moser side between the surplus apex and the apex opposite
the second non-surplus cap (`|v₀v₂|`).  Both endpoints are rewritten from the
escape's outer-vertex labels into Moser-apex form. -/
theorem endpointLeft_moserSide_eq_rho
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) :
    dist (S.oppositeVertexByIndex S.surplusIdx)
        (S.oppositeVertexByIndex S.oppIndex2) = rho := by
  obtain ⟨_hrad, _hrho, _hcard, _hxT, _hxEsc, _hcard2, _hdx, hshared, _hexcl⟩ :=
    hend
  rwa [S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx,
    S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
    at hshared

/-- (2c) First-radius exclusion: the surplus apex is not on the first radius
about the apex opposite the first non-surplus cap (`|v₀v₁| ≠ radius`). -/
theorem endpointLeft_radius_exclusion
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) :
    dist (S.oppositeVertexByIndex S.surplusIdx)
        (S.oppositeVertexByIndex S.oppIndex1) ≠ radius := by
  obtain ⟨_hrad, _hrho, _hcard, _hxT, _hxEsc, _hcard2, _hdx, _hshared, hexcl⟩ :=
    hend
  rwa [S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx]
    at hexcl

/-- The cap labelled by the surplus index is the surplus cap.  Definitional
alignment of `capByIndex` and `surplusCap`. -/
theorem capByIndex_surplusIdx_eq_surplusCap :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

/-- (2a, second class) The selected class at the Moser apex opposite the second
non-surplus cap (the `rho` centre) is exactly four points.  Composition of
`moserCapCoreSelectorAt` at `oppIndex2` with the `IsM44` cap-card-four fact
there; the cardinality bound and positivity come from the escape hypothesis. -/
theorem endpointLeft_secondSelectedClass_card_eq_four
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) :
    (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho).card = 4 := by
  obtain ⟨_hrad, hrho, _hcard, _hxT, _hxEsc, hcard2, _hdx, _hshared, _hexcl⟩ := hend
  rw [S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
    at hcard2
  exact (S.moserCapCoreSelectorAt hconv S.oppIndex2 hrho
    hM44.oppIndex2_cap_card_eq_four hcard2).1

/-- (2a, second class) The `rho`-centred selected class at `oppIndex2` is
interior-pinned. -/
theorem endpointLeft_oppInterior2_subset_secondSelectedClass
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) :
    S.capInteriorByIndex S.oppIndex2 ⊆
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho := by
  obtain ⟨_hrad, hrho, _hcard, _hxT, _hxEsc, hcard2, _hdx, _hshared, _hexcl⟩ := hend
  rw [S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
    at hcard2
  exact (S.moserCapCoreSelectorAt hconv S.oppIndex2 hrho
    hM44.oppIndex2_cap_card_eq_four hcard2).2.1

/-- (2b, strict interior) The escapee lies in the strict interior of the second
non-surplus cap.  It is in the closed cap and, by the first-radius distance
facts, is neither outer Moser vertex of that cap. -/
theorem endpointLeft_escapee_mem_oppInterior2
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) :
    x ∈ S.capInteriorByIndex S.oppIndex2 := by
  obtain ⟨hrad, _hrho, _hcard, hxT, hxEsc, _hcard2, _hdx, _hshared, hexcl⟩ := hend
  have hxcap : x ∈ S.capByIndex S.oppIndex2 := by
    have hxLeft := (Finset.mem_sdiff.mp hxEsc).1
    rwa [S.leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2] at hxLeft
  have hdistFirst : dist (S.oppositeVertexByIndex S.oppIndex1) x = radius :=
    (mem_selectedClass.mp hxT).2
  have hexcl' : dist (S.oppositeVertexByIndex S.surplusIdx)
      (S.oppositeVertexByIndex S.oppIndex1) ≠ radius := by
    rwa [S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx]
      at hexcl
  have hne_right : x ≠ S.rightOuterVertexByIndex S.oppIndex2 := by
    rw [S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx]
    intro h
    apply hexcl'
    rw [dist_comm, ← h]
    exact hdistFirst
  have hne_left : x ≠ S.leftOuterVertexByIndex S.oppIndex2 := by
    rw [S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
    intro h
    rw [h, dist_self] at hdistFirst
    linarith
  exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer S.oppIndex2
    hxcap hne_right hne_left

/-- (2b, surplus disjointness) The escapee is off the surplus cap.  A strict
interior point of the second non-surplus cap lies in no other closed cap, and
the surplus cap is one such. -/
theorem endpointLeft_escapee_not_mem_surplusCap
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) :
    x ∉ S.surplusCap := by
  have hxI := endpointLeft_escapee_mem_oppInterior2 S hend
  have hnot := S.capInteriorByIndex_not_mem_capByIndex_of_ne hxI
    (S.surplusIdx_ne_oppIndex2).symm
  rwa [capByIndex_surplusIdx_eq_surplusCap S] at hnot

end LeftEscape

/- ### Right endpoint escape row-shape facts

Mechanical `O1 ↔ O2` mirror of the left-escape family, stated for the right
escape at `S.oppIndex2` (the shape consumed by the second conjunct of the leaf),
transported through the committed mirror/orientation lemmas. -/

section RightEscape

variable {A : Finset ℝ²} (S : SurplusCapPacket A)
  {radius rho : ℝ} {x : ℝ²}

/-- (2a) The selected class at the Moser apex opposite the second non-surplus cap
is exactly four points. -/
theorem endpointRight_selectedClass_card_eq_four
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x) :
    (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius).card = 4 := by
  obtain ⟨hrad, _hrho, hcard, _hxT, _hxEsc, _hcard2, _hdx, _hshared, _hexcl⟩ := hend
  exact (S.moserCapCoreSelectorAt hconv S.oppIndex2 hrad
    hM44.oppIndex2_cap_card_eq_four hcard).1

/-- (2a) The selected class at the Moser apex opposite the second non-surplus cap
is interior-pinned. -/
theorem endpointRight_oppInterior2_subset_selectedClass
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x) :
    S.capInteriorByIndex S.oppIndex2 ⊆
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius := by
  obtain ⟨hrad, _hrho, hcard, _hxT, _hxEsc, _hcard2, _hdx, _hshared, _hexcl⟩ := hend
  exact (S.moserCapCoreSelectorAt hconv S.oppIndex2 hrad
    hM44.oppIndex2_cap_card_eq_four hcard).2.1

/-- (2a, second class) The `rho`-centred selected class at `oppIndex1` is exactly
four points. -/
theorem endpointRight_secondSelectedClass_card_eq_four
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x) :
    (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho).card = 4 := by
  obtain ⟨_hrad, hrho, _hcard, _hxT, _hxEsc, hcard2, _hdx, _hshared, _hexcl⟩ := hend
  rw [S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
    at hcard2
  exact (S.moserCapCoreSelectorAt hconv S.oppIndex1 hrho
    hM44.oppIndex1_cap_card_eq_four hcard2).1

/-- (2a, second class) The `rho`-centred selected class at `oppIndex1` is
interior-pinned. -/
theorem endpointRight_oppInterior1_subset_secondSelectedClass
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x) :
    S.capInteriorByIndex S.oppIndex1 ⊆
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho := by
  obtain ⟨_hrad, hrho, _hcard, _hxT, _hxEsc, hcard2, _hdx, _hshared, _hexcl⟩ := hend
  rw [S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
    at hcard2
  exact (S.moserCapCoreSelectorAt hconv S.oppIndex1 hrho
    hM44.oppIndex1_cap_card_eq_four hcard2).2.1

/-- (2b) The escapee lies in the closed first non-surplus cap. -/
theorem endpointRight_escapee_mem_capByIndex_oppIndex1
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x) :
    x ∈ S.capByIndex S.oppIndex1 := by
  obtain ⟨_hrad, _hrho, _hcard, _hxT, hxEsc, _hcard2, _hdx, _hshared, _hexcl⟩ := hend
  have hxRight := (Finset.mem_sdiff.mp hxEsc).1
  rwa [S.rightAdjacentCapByIndex_oppIndex2_eq_capByIndex_oppIndex1] at hxRight

/-- (2b) The escapee lies off the closed second non-surplus cap. -/
theorem endpointRight_escapee_not_mem_capByIndex_oppIndex2
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x) :
    x ∉ S.capByIndex S.oppIndex2 := by
  obtain ⟨_hrad, _hrho, _hcard, _hxT, hxEsc, _hcard2, _hdx, _hshared, _hexcl⟩ := hend
  have hxNot := (Finset.mem_sdiff.mp hxEsc).2
  exact fun h => hxNot (Finset.mem_union_left _ h)

/-- (2b) The escapee lies off the second cap's left-adjacent cap. -/
theorem endpointRight_escapee_not_mem_leftAdjacentCap
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x) :
    x ∉ S.leftAdjacentCapByIndex S.oppIndex2 := by
  obtain ⟨_hrad, _hrho, _hcard, _hxT, hxEsc, _hcard2, _hdx, _hshared, _hexcl⟩ := hend
  have hxNot := (Finset.mem_sdiff.mp hxEsc).2
  exact fun h => hxNot (Finset.mem_union_right _ h)

/-- (2c) The escapee is on the second radius centred at the Moser apex opposite
the first non-surplus cap. -/
theorem endpointRight_dist_escapee_eq_rho
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x) :
    dist x (S.oppositeVertexByIndex S.oppIndex1) = rho := by
  obtain ⟨_hrad, _hrho, _hcard, _hxT, _hxEsc, _hcard2, hdx, _hshared, _hexcl⟩ := hend
  rwa [S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
    at hdx

/-- (2c) `rho` is the Moser side between the surplus apex and the apex opposite
the first non-surplus cap (`|v₀v₁|`). -/
theorem endpointRight_moserSide_eq_rho
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x) :
    dist (S.oppositeVertexByIndex S.surplusIdx)
        (S.oppositeVertexByIndex S.oppIndex1) = rho := by
  obtain ⟨_hrad, _hrho, _hcard, _hxT, _hxEsc, _hcard2, _hdx, hshared, _hexcl⟩ :=
    hend
  rwa [S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx,
    S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
    at hshared

/-- (2c) First-radius exclusion: the surplus apex is not on the first radius
about the apex opposite the second non-surplus cap (`|v₀v₂| ≠ radius`). -/
theorem endpointRight_radius_exclusion
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x) :
    dist (S.oppositeVertexByIndex S.surplusIdx)
        (S.oppositeVertexByIndex S.oppIndex2) ≠ radius := by
  obtain ⟨_hrad, _hrho, _hcard, _hxT, _hxEsc, _hcard2, _hdx, _hshared, hexcl⟩ :=
    hend
  rwa [S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx]
    at hexcl

/-- (2b, strict interior) The escapee lies in the strict interior of the first
non-surplus cap. -/
theorem endpointRight_escapee_mem_oppInterior1
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x) :
    x ∈ S.capInteriorByIndex S.oppIndex1 := by
  obtain ⟨hrad, _hrho, _hcard, hxT, hxEsc, _hcard2, _hdx, _hshared, hexcl⟩ := hend
  have hxcap : x ∈ S.capByIndex S.oppIndex1 := by
    have hxRight := (Finset.mem_sdiff.mp hxEsc).1
    rwa [S.rightAdjacentCapByIndex_oppIndex2_eq_capByIndex_oppIndex1] at hxRight
  have hdistFirst : dist (S.oppositeVertexByIndex S.oppIndex2) x = radius :=
    (mem_selectedClass.mp hxT).2
  have hexcl' : dist (S.oppositeVertexByIndex S.surplusIdx)
      (S.oppositeVertexByIndex S.oppIndex2) ≠ radius := by
    rwa [S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx]
      at hexcl
  have hne_right : x ≠ S.rightOuterVertexByIndex S.oppIndex1 := by
    rw [S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
    intro h
    rw [h, dist_self] at hdistFirst
    linarith
  have hne_left : x ≠ S.leftOuterVertexByIndex S.oppIndex1 := by
    rw [S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx]
    intro h
    apply hexcl'
    rw [dist_comm, ← h]
    exact hdistFirst
  exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer S.oppIndex1
    hxcap hne_right hne_left

/-- (2b, surplus disjointness) The escapee is off the surplus cap. -/
theorem endpointRight_escapee_not_mem_surplusCap
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x) :
    x ∉ S.surplusCap := by
  have hxI := endpointRight_escapee_mem_oppInterior1 S hend
  have hnot := S.capInteriorByIndex_not_mem_capByIndex_of_ne hxI
    (S.surplusIdx_ne_oppIndex1).symm
  rwa [capByIndex_surplusIdx_eq_surplusCap S] at hnot

end RightEscape

/- ## 3. Endpoint seed predicates

Finite seed shapes over the committed canonical `Fin 11` pattern-code
vocabulary, mirroring `Census554.CapSelectedFiniteCode.PinnedShellOK`.  The
escaped row replaces the pinned row `{0, 7, 8, pinSource}` with the
Moser-apex-excluding escaped row; the surplus-apex (center `0`) deleted-source
row and the critical-shell blocker conditions carry over verbatim. -/

open Census554.CapSelectedFiniteCode

/-- Left endpoint seed: escaped row `{7, 8, escapee, fourth}` at center `1` with
`escapee ∈ intO2`, `fourth ∈ {2} ∪ intS`, `deleted ∈ intS`, `fourth ≠ deleted`,
`deleted` on the surplus-apex row (center `0`), plus the `PinnedShellOK` blocker
conditions.  The Moser apex `0` is forced out of the escaped row. -/
def EndpointLeftShellOK (P : PatternCode) (blocker : Label → Label)
    (escapee fourth deleted : Label) : Prop :=
  escapee ∈ intO2 ∧
    fourth ∈ insert 2 intS ∧
    deleted ∈ intS ∧
    fourth ≠ deleted ∧
    row P 1 = {7, 8, escapee, fourth} ∧
    deleted ∈ row P 0 ∧
    (∀ q, blocker q ≠ q ∧ q ∈ row P (blocker q)) ∧
    (∀ q, q ∈ row P 1 → blocker q = 1) ∧
    blocker deleted ≠ 1

/-- Right endpoint seed: the `O1 ↔ O2` mirror of `EndpointLeftShellOK`.  Escaped
row `{9, 10, escapee, fourth}` at center `2` with `escapee ∈ intO1`,
`fourth ∈ {1} ∪ intS`, `deleted ∈ intS`, `fourth ≠ deleted`, `deleted` on the
surplus-apex row (center `0`), plus the mirrored blocker conditions at center
`2`. -/
def EndpointRightShellOK (P : PatternCode) (blocker : Label → Label)
    (escapee fourth deleted : Label) : Prop :=
  escapee ∈ intO1 ∧
    fourth ∈ insert 1 intS ∧
    deleted ∈ intS ∧
    fourth ≠ deleted ∧
    row P 2 = {9, 10, escapee, fourth} ∧
    deleted ∈ row P 0 ∧
    (∀ q, blocker q ≠ q ∧ q ∈ row P (blocker q)) ∧
    (∀ q, q ∈ row P 2 → blocker q = 2) ∧
    blocker deleted ≠ 2

end EndpointCertificate

end Problem97
