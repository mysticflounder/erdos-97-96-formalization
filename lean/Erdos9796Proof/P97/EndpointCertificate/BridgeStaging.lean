/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.GeneralMCardEleven
import Erdos9796Proof.P97.Census554.CapSelectedCarrierBridge
import Erdos9796Proof.P97.SurplusM44Packet
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# General-`m` endpoint bridge staging (design doc §5, items L1a–L5)

Staging infrastructure for the geometry → `Fin 11` combinatorics bridge of
`Problem97.isM44EndpointGeneralMResidualsExcluded`.  This module lands the
dependency-ordered new lemmas L1a, L1b, L2, L3, L4, L5 of
`docs/endpoint-generalm-bridge-design-2026-07-11.md`, importing only committed
upstream modules (no `RemovableVertexAxiom/Base`).

* **L1a** `CounterexampleData.minimal_of_smaller_false` — the leaf's
  `hMin` shape implies `CounterexampleData.Minimal`.
* **L1b** `CanonicalLabeling.labelOf` — pointwise inverse of `pointOf`.
* **L2** `SelectedFourClass.support_eq_selectedClass_of_moserCap` +
  `SelectedFourClass.k4Radius_eq_of_moserCap` — a Moser-apex selected four-class
  is the full selected class, and radii carrying four points are unique.
* **L3** `endpointLeft_no_qfree_of_mem` — deleting any pinned-class member
  destroys every K4 witness at the escaped apex.
* **L4** `endpointLeft_selectedClass_decomposition` — the escaped class is
  `interior(O1) ⊔ {x} ⊔ {w}` with `w ∈ surplusCap`.
* **L5** `row_zero_two_intS_slots` + `exists_row_zero_mem_intS_ne` — every
  `LocalRowsOK` row 0 has at least two `intS` labels, and a chooser avoiding a
  named fourth label.
-/

namespace Problem97

open scoped EuclideanGeometry InnerProductSpace

/- ## L1a. Leaf minimality glue -/

/-- The leaf's contrapositive minimality hypothesis (no strictly smaller convex
`K4` counterexample) yields `CounterexampleData.Minimal` for the datum built
from the leaf's carrier and surplus packet. -/
theorem CounterexampleData.minimal_of_smaller_false
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (S : SurplusCapPacket A)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) :
    CounterexampleData.Minimal ⟨A, hne, hconv, hK4, S⟩ := by
  intro B hBne hBconv hBK4
  by_contra hlt
  exact hMin B (not_le.mp hlt) hBne hBconv hBK4

/- ## L2. Moser-apex selected four-classes -/

/-- (L2) A `SelectedFourClass` at a Moser apex opposite a card-four short cap is
exactly the full selected class at its radius, and it contains that cap's whole
strict interior.  The full cover of the class comes from `moserCapCoreSelectorAt`
(class card `= 4`), so the four-point support already exhausts it. -/
theorem SelectedFourClass.support_eq_selectedClass_of_moserCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A) (i : Fin 3)
    (K : SelectedFourClass A (S.oppositeVertexByIndex i))
    (hcap : (S.capByIndex i).card = 4) :
    K.support = SelectedClass A (S.oppositeVertexByIndex i) K.radius ∧
      S.capInteriorByIndex i ⊆ K.support := by
  have hsub : K.support ⊆ SelectedClass A (S.oppositeVertexByIndex i) K.radius := by
    intro z hz
    exact mem_selectedClass.mpr ⟨K.support_subset_A hz, K.support_eq_radius z hz⟩
  have hcard4 : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) K.radius).card := by
    calc 4 = K.support.card := K.support_card.symm
      _ ≤ _ := Finset.card_le_card hsub
  have hcore := S.moserCapCoreSelectorAt hconv i K.radius_pos hcap hcard4
  have hcardeq :
      (SelectedClass A (S.oppositeVertexByIndex i) K.radius).card = K.support.card := by
    rw [hcore.1, K.support_card]
  have heq : K.support = SelectedClass A (S.oppositeVertexByIndex i) K.radius :=
    Finset.eq_of_subset_of_card_le hsub (le_of_eq hcardeq)
  refine ⟨heq, ?_⟩
  rw [heq]
  exact hcore.2.1

/-- (L2 corollary) At a Moser apex opposite a card-four short cap, any two
positive radii each carrying at least four ambient points coincide: both classes
contain the (nonempty) strict cap interior, forcing a shared distance. -/
theorem SelectedFourClass.k4Radius_eq_of_moserCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 4)
    {r₁ r₂ : ℝ} (hr₁ : 0 < r₁) (hr₂ : 0 < r₂)
    (hc₁ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₁).card)
    (hc₂ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₂).card) :
    r₁ = r₂ := by
  have hcore₁ := S.moserCapCoreSelectorAt hconv i hr₁ hcap hc₁
  have hcore₂ := S.moserCapCoreSelectorAt hconv i hr₂ hcap hc₂
  have hint2 : (S.capInteriorByIndex i).card = 2 :=
    S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four i hcap
  obtain ⟨p, hp⟩ : (S.capInteriorByIndex i).Nonempty := by
    rw [← Finset.card_pos, hint2]; norm_num
  have e₁ := (mem_selectedClass.mp (hcore₁.2.1 hp)).2
  have e₂ := (mem_selectedClass.mp (hcore₂.2.1 hp)).2
  exact e₁.symm.trans e₂

/- ## L1b. Pointwise label inverse -/

namespace Census554

namespace CapSelectedGeometry

namespace CanonicalLabeling

/-- (L1b) The pointwise inverse of `pointOf`, chosen by `carrier_surjective`
over the carrier and pinned to `0` off it.  Noncomputable (uses `Classical`). -/
noncomputable def labelOf {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (x : ℝ²) : Fin 11 :=
  if hx : x ∈ A then Classical.choose (L.carrier_surjective x hx) else 0

/-- (L1b) `pointOf` recovers a carrier point from its chosen label. -/
theorem pointOf_labelOf {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) {x : ℝ²} (hx : x ∈ A) :
    L.pointOf (L.labelOf x) = x := by
  rw [show L.labelOf x = Classical.choose (L.carrier_surjective x hx) from dif_pos hx]
  exact Classical.choose_spec (L.carrier_surjective x hx)

/-- (L1b) `labelOf` is a left inverse of `pointOf` (via carrier injectivity). -/
theorem labelOf_pointOf {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (p : Fin 11) :
    L.labelOf (L.pointOf p) = p := by
  apply L.injective
  exact pointOf_labelOf L (L.mem_carrier p)

end CanonicalLabeling

end CapSelectedGeometry

/- ## L5. Row-zero interior-slot counting -/

namespace CapSelectedFiniteCode

/-- (L5) A `LocalRowsOK` pattern's row 0 holds at least two `intS` labels.  Row 0
is a center-free four-set (so it avoids `0`), and the two one-hit bounds cap its
`capO1`/`capO2` (label sets `{2,7,8}`/`{1,9,10}` after erasing `0`) occupancy at
one apiece; the remaining slots land in `intS = {3,4,5,6}`. -/
theorem row_zero_two_intS_slots {P : PatternCode} (hLocal : LocalRowsOK P) :
    2 ≤ (row P 0 ∩ intS).card := by
  obtain ⟨hrows, hmoser, _⟩ := hLocal
  obtain ⟨hrow0card, h0notin⟩ := hrows 0
  obtain ⟨⟨hcapO1, hcapO2⟩, _, _⟩ := hmoser
  have huniv :
      (intS ∪ capO1.erase 0 ∪ capO2.erase 0 : Finset Label)
        = (Finset.univ.erase 0 : Finset Label) := by decide
  have hcover : row P 0 ⊆ intS ∪ capO1.erase 0 ∪ capO2.erase 0 := by
    rw [huniv]
    intro y hy
    rw [Finset.mem_erase]
    exact ⟨fun hy0 => h0notin (hy0 ▸ hy), Finset.mem_univ y⟩
  have hsub2 :
      row P 0 ⊆ (row P 0 ∩ intS) ∪
        ((row P 0 ∩ capO1.erase 0) ∪ (row P 0 ∩ capO2.erase 0)) := by
    intro y hy
    rcases Finset.mem_union.mp (hcover hy) with h | h
    · rcases Finset.mem_union.mp h with h | h
      · exact Finset.mem_union_left _ (Finset.mem_inter.mpr ⟨hy, h⟩)
      · exact Finset.mem_union_right _
          (Finset.mem_union_left _ (Finset.mem_inter.mpr ⟨hy, h⟩))
    · exact Finset.mem_union_right _
        (Finset.mem_union_right _ (Finset.mem_inter.mpr ⟨hy, h⟩))
  have hcardbound :
      (row P 0).card ≤ (row P 0 ∩ intS).card +
        ((row P 0 ∩ capO1.erase 0).card + (row P 0 ∩ capO2.erase 0).card) := by
    refine le_trans (Finset.card_le_card hsub2) ?_
    refine le_trans (Finset.card_union_le _ _) ?_
    exact Nat.add_le_add_left (Finset.card_union_le _ _) _
  rw [hrow0card] at hcardbound
  omega

/-- (L5 chooser) From the two-slot bound, row 0 supplies an `intS` label distinct
from any prescribed `fourth`. -/
theorem exists_row_zero_mem_intS_ne {P : PatternCode} (hLocal : LocalRowsOK P)
    (fourth : Label) : ∃ d ∈ row P 0 ∩ intS, d ≠ fourth := by
  have h2 : 2 ≤ (row P 0 ∩ intS).card := row_zero_two_intS_slots hLocal
  by_contra hcon
  push_neg at hcon
  have hsingle : row P 0 ∩ intS ⊆ {fourth} := by
    intro d hd
    rw [Finset.mem_singleton]
    exact hcon d hd
  have : (row P 0 ∩ intS).card ≤ 1 := by
    calc (row P 0 ∩ intS).card ≤ ({fourth} : Finset Label).card :=
          Finset.card_le_card hsingle
      _ = 1 := Finset.card_singleton _
  omega

end CapSelectedFiniteCode

end Census554

/- ## L3, L4. Left-escape apex facts -/

namespace EndpointCertificate

section LeftEscape

variable {A : Finset ℝ²} (S : SurplusCapPacket A)
  {radius rho : ℝ} {x : ℝ²}

/-- (L3) Under a left endpoint escape at `oppIndex1`, deleting any member of the
escaped selected class destroys every K4 witness at that apex.  Mechanical mirror
of `IsM44.pinnedRightSurplusResidual_no_qfree_of_mem`: the class has exactly four
points (`endpointLeft_selectedClass_card_eq_four`), and any competing radius with
four ambient points equals `radius` by the Moser-apex radius uniqueness (L2). -/
theorem endpointLeft_no_qfree_of_mem
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x)
    {q : ℝ²}
    (hq : q ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius) :
    ¬ HasNEquidistantPointsAt 4 (A.erase q)
      (S.oppositeVertexByIndex S.oppIndex1) := by
  intro hK4
  rcases hK4 with ⟨rho', hrho', hcardFilter⟩
  have hcardErase :
      4 ≤ (SelectedClass (A.erase q)
        (S.oppositeVertexByIndex S.oppIndex1) rho').card := by
    simpa [SelectedClass] using hcardFilter
  have hcardAmbient :
      4 ≤ (SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex1) rho').card :=
    le_trans hcardErase (Finset.card_le_card (by
      rw [selectedClass_erase_eq]
      exact Finset.erase_subset q
        (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho')))
  have hclassCard :
      (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card = 4 :=
    endpointLeft_selectedClass_card_eq_four S hconv hM44 hend
  have hrhoeq : rho' = radius :=
    SelectedFourClass.k4Radius_eq_of_moserCap S hconv S.oppIndex1
      hM44.oppIndex1_cap_card_eq_four hrho' hend.1 hcardAmbient hclassCard.ge
  subst rho'
  rw [selectedClass_erase_eq, Finset.card_erase_of_mem hq, hclassCard] at hcardErase
  omega

/-- (L4) The escaped selected class at `oppIndex1` decomposes as the strict
interior of cap `O1`, the escapee `x`, and one further surplus-cap point `w`.
The interior (two points) and `x` are distinct members; a card-four count forces a
unique fourth point `w`, and the `moserCapCoreSelectorAt` cover pins `w` to the
right-adjacent cap of `oppIndex1`, which is the surplus cap. -/
theorem endpointLeft_selectedClass_decomposition
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) :
    ∃ w, w ∈ S.surplusCap ∧
      w ≠ S.oppositeVertexByIndex S.oppIndex1 ∧ w ≠ x ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius =
        insert w (insert x (S.capInteriorByIndex S.oppIndex1)) := by
  have hrad : 0 < radius := hend.1
  have hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card :=
    hend.2.2.1
  have hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius :=
    hend.2.2.2.1
  have hxEsc : x ∈ S.leftAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪ S.rightAdjacentCapByIndex S.oppIndex1) :=
    hend.2.2.2.2.1
  have hT4 : (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card = 4 :=
    endpointLeft_selectedClass_card_eq_four S hconv hM44 hend
  have hintsub :
      S.capInteriorByIndex S.oppIndex1 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius :=
    endpointLeft_oppInterior1_subset_selectedClass S hconv hM44 hend
  have hint2 : (S.capInteriorByIndex S.oppIndex1).card = 2 :=
    S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four S.oppIndex1
      hM44.oppIndex1_cap_card_eq_four
  have hx_not_cap1 : x ∉ S.capByIndex S.oppIndex1 :=
    endpointLeft_escapee_not_mem_capByIndex_oppIndex1 S hend
  have hx_notin_int1 : x ∉ S.capInteriorByIndex S.oppIndex1 :=
    fun h => hx_not_cap1 (S.capInteriorByIndex_subset_capByIndex S.oppIndex1 h)
  have hx_leftAdj : x ∈ S.leftAdjacentCapByIndex S.oppIndex1 :=
    (Finset.mem_sdiff.mp hxEsc).1
  -- The three known members and their cardinality.
  have hsub3 :
      insert x (S.capInteriorByIndex S.oppIndex1) ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius := by
    intro z hz
    rcases Finset.mem_insert.mp hz with h | h
    · exact h ▸ hxT
    · exact hintsub h
  have hcard_ins3 :
      (insert x (S.capInteriorByIndex S.oppIndex1)).card = 3 := by
    rw [Finset.card_insert_of_notMem hx_notin_int1, hint2]
  -- A fourth point exists.
  obtain ⟨w, hwT, hwnot⟩ :
      ∃ w ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius,
        w ∉ insert x (S.capInteriorByIndex S.oppIndex1) := by
    by_contra hcon
    push_neg at hcon
    have hsub : SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius ⊆
        insert x (S.capInteriorByIndex S.oppIndex1) := fun z hz => hcon z hz
    have := Finset.card_le_card hsub
    rw [hT4, hcard_ins3] at this
    omega
  have hw_ne_x : w ≠ x :=
    fun h => hwnot (by rw [h]; exact Finset.mem_insert_self x _)
  have hw_not_int1 : w ∉ S.capInteriorByIndex S.oppIndex1 :=
    fun h => hwnot (Finset.mem_insert_of_mem h)
  have hw_ne_v1 : w ≠ S.oppositeVertexByIndex S.oppIndex1 := by
    intro h
    have hdist : dist (S.oppositeVertexByIndex S.oppIndex1) w = radius :=
      (mem_selectedClass.mp hwT).2
    rw [h, dist_self] at hdist
    linarith
  have hfinal :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius =
        insert w (insert x (S.capInteriorByIndex S.oppIndex1)) := by
    refine (Finset.eq_of_subset_of_card_le ?_ ?_).symm
    · intro z hz
      rcases Finset.mem_insert.mp hz with h | h
      · exact h ▸ hwT
      · exact hsub3 h
    · rw [Finset.card_insert_of_notMem hwnot, hcard_ins3, hT4]
  -- `w` is the right-adjacent (surplus-cap) hit.
  have hw_surplus : w ∈ S.surplusCap := by
    have hw_sdiff :
        w ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius \
          S.capInteriorByIndex S.oppIndex1 :=
      Finset.mem_sdiff.mpr ⟨hwT, hw_not_int1⟩
    have hw_cover :=
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps S.oppIndex1 hrad hw_sdiff
    rcases Finset.mem_union.mp hw_cover with hwleft | hwright
    · exfalso
      have hxleftmem :
          x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
            S.leftAdjacentCapByIndex S.oppIndex1 :=
        Finset.mem_inter.mpr ⟨hxT, hx_leftAdj⟩
      have h2le :
          1 < (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
            S.leftAdjacentCapByIndex S.oppIndex1).card :=
        Finset.one_lt_card.mpr ⟨x, hxleftmem, w, hwleft, Ne.symm hw_ne_x⟩
      have hle1 :=
        (S.moserCapCoreSelectorAt hconv S.oppIndex1 hrad
          hM44.oppIndex1_cap_card_eq_four hcard).2.2.1
      omega
    · have hw_in_rightAdj : w ∈ S.rightAdjacentCapByIndex S.oppIndex1 :=
        Finset.mem_of_mem_inter_right hwright
      have hright_eq :
          S.rightAdjacentCapByIndex S.oppIndex1 = S.surplusCap := by
        have h1 := S.rightAdjacentCapByIndex_leftAdjacentIndex S.surplusIdx
        rw [← S.oppIndex1_eq_leftAdjacentIndex_surplusIdx] at h1
        rw [h1]
        exact capByIndex_surplusIdx_eq_surplusCap S
      rw [← hright_eq]
      exact hw_in_rightAdj
  exact ⟨w, hw_surplus, hw_ne_v1, hw_ne_x, hfinal⟩

end LeftEscape

end EndpointCertificate

end Problem97
