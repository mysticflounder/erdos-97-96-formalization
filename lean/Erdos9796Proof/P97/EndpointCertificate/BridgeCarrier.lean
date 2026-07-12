/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.BridgeStaging

/-!
# General-`m` endpoint bridge carrier assembly (design doc §5, items L6, L7, L8)

Carrier-pattern and blocker infrastructure for the geometry → `Fin 11`
combinatorics bridge of `Problem97.isM44EndpointGeneralMResidualsExcluded`.
This module lands the dependency-ordered new lemmas L6, L7, L8 of
`docs/endpoint-generalm-bridge-design-2026-07-11.md`, importing only the
committed staging module `EndpointCertificate.BridgeStaging` (and, transitively,
the committed carrier/critical-shell machinery).

* **L6** `exists_faithfulCarrierPattern_with_class` — a public
  `FaithfulCarrierPattern` constructor prescribing exactly one selected
  four-class at a chosen carrier center (one-prescription form of the pinned
  lane's private three-class version).
* **L7** `endpointBlocker` (+ `endpointBlocker_ne`, `mem_row_endpointBlocker`,
  `endpointBlocker_eq_one_of_mem_row_one`) — the canonical-label blocker
  `labelOf ∘ centerAt ∘ pointOf`, and the assembly
  `exists_endpointBlocker_of_endpointEscapeLeft` that builds the overridden
  critical-shell system at the escaped apex and packages the `EndpointLeftShellOK`
  blocker conjuncts.
* **L8** `endpointLeft_row_one_eq` — under the L6 prescription with the escaped
  selected class, `row (patternCode L F) 1 = {7, 8, labelOf x, labelOf w}`.
-/

namespace Problem97

open scoped EuclideanGeometry InnerProductSpace

open Census554.CapSelectedGeometry
open Census554.CapSelectedCarrierBridge
open Census554.CapSelectedFiniteCode

namespace EndpointCertificate

/- ## L1b support: `labelsOf` distributes over inserting a carrier point -/

/-- The canonical-label preimage of an `insert` of a carrier point splits off
that point's label.  A pointwise consequence of `mem_labelsOf` and the
`labelOf`/`pointOf` inverse pair. -/
private theorem labelsOf_insert_of_mem
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) {y : ℝ²} (hy : y ∈ A) (T : Finset ℝ²) :
    L.toCard11Labeling.labelsOf (insert y T) =
      insert (L.labelOf y) (L.toCard11Labeling.labelsOf T) := by
  ext p
  simp only [L.toCard11Labeling.mem_labelsOf, Finset.mem_insert]
  constructor
  · rintro (hpy | hpT)
    · exact Or.inl (by rw [← hpy, L.labelOf_pointOf])
    · exact Or.inr hpT
  · rintro (hpeq | hpT)
    · exact Or.inl (by rw [hpeq, L.pointOf_labelOf hy])
    · exact Or.inr hpT

/- ## L6. One-prescription faithful carrier pattern -/

/-- (L6) A global-`K4` carrier admits a `FaithfulCarrierPattern` whose selected
class at a prescribed center `c` is a prescribed four-class `K`; every other
center is filled generically by `exists_selectedFourClass_of_globalK4`.  This is
the one-prescription (public) form of the pinned lane's private three-class
constructor. -/
theorem exists_faithfulCarrierPattern_with_class
    {A : Finset ℝ²} {c : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A) (hc : c ∈ A)
    (K : SelectedFourClass A c) :
    ∃ F : FaithfulCarrierPattern A,
      ∀ hc' : c ∈ A, (F.classAt c hc').support = K.support := by
  classical
  let classAt : ∀ z : ℝ², z ∈ A → SelectedFourClass A z :=
    fun z hz =>
      if h : z = c then h ▸ K
      else Classical.choice (exists_selectedFourClass_of_globalK4 hK4 hz)
  have hclass : ∀ hc' : c ∈ A, (classAt c hc').support = K.support := by
    intro hc'
    simp [classAt]
  rcases K.support_nonempty with ⟨q, hq⟩
  have hqClass : q ∈ (classAt c hc).support := by
    rw [hclass hc]; exact hq
  exact ⟨{
    gaugeCenter := c
    gaugeCenter_mem := hc
    classAt := classAt
    gaugeWitness := q
    gaugeWitness_mem := hqClass }, hclass⟩

/- ## Prescription transport from `v₁` to label `1` -/

/-- The prescription support fact, stated at the escaped apex
`S.oppositeVertexByIndex S.oppIndex1`, transports to canonical label `1` via
`point_one_eq_opposite`. -/
private theorem classAt_support_at_point_one
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A) {radius : ℝ}
    (hF : ∀ hv : S.oppositeVertexByIndex S.oppIndex1 ∈ A,
      (F.classAt (S.oppositeVertexByIndex S.oppIndex1) hv).support =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius) :
    (F.classAt (L.pointOf 1) (L.mem_carrier 1)).support =
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius := by
  have hpt : L.pointOf 1 = S.oppositeVertexByIndex S.oppIndex1 :=
    L.point_one_eq_opposite
  have gen : ∀ (z : ℝ²) (hz : z ∈ A), z = S.oppositeVertexByIndex S.oppIndex1 →
      (F.classAt z hz).support =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius := by
    intro z hz hzeq
    subst hzeq
    exact hF hz
  exact gen (L.pointOf 1) (L.mem_carrier 1) hpt

/- ## L8. Escaped row-one decomposition into labels -/

/-- (L8) Under the L6 prescription with the escaped selected class at label `1`,
the pulled-back row `1` is `{7, 8, labelOf x, labelOf w}`, where `x` is the
escapee and `w` is the surplus-cap witness of the L4 decomposition. -/
theorem endpointLeft_row_one_eq
    {A : Finset ℝ²} (S : SurplusCapPacket A) (L : CanonicalLabeling S)
    (F : FaithfulCarrierPattern A)
    {radius rho : ℝ} {x : ℝ²}
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x)
    (hF : ∀ hv : S.oppositeVertexByIndex S.oppIndex1 ∈ A,
      (F.classAt (S.oppositeVertexByIndex S.oppIndex1) hv).support =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius) :
    ∃ w, w ∈ S.surplusCap ∧
      w ≠ S.oppositeVertexByIndex S.oppIndex1 ∧ w ≠ x ∧
      row (patternCode L F) 1 = {7, 8, L.labelOf x, L.labelOf w} := by
  obtain ⟨w, hw_surplus, hw_ne_v1, hw_ne_x, hdecomp⟩ :=
    endpointLeft_selectedClass_decomposition S hconv hM44 hend
  refine ⟨w, hw_surplus, hw_ne_v1, hw_ne_x, ?_⟩
  have hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius :=
    hend.2.2.2.1
  have hxA : x ∈ A := (mem_selectedClass.mp hxT).1
  have hwSel : w ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius := by
    rw [hdecomp]; exact Finset.mem_insert_self _ _
  have hwA : w ∈ A := (mem_selectedClass.mp hwSel).1
  have hclassEq : (F.classAt (L.pointOf 1) (L.mem_carrier 1)).support =
      insert w (insert x (S.capInteriorByIndex S.oppIndex1)) := by
    rw [classAt_support_at_point_one L F hF, hdecomp]
  have hI : L.toCard11Labeling.labelsOf (S.capInteriorByIndex S.oppIndex1) = intO1 := by
    simpa only [SurplusCapPacket.oppInterior1] using L.oppInterior1_eq
  rw [row_patternCode_eq_labelsOf, hclassEq,
    labelsOf_insert_of_mem L hwA, labelsOf_insert_of_mem L hxA, hI]
  ext a
  simp only [Finset.mem_insert, Finset.mem_singleton, intO1]
  tauto

/- ## L7. The canonical-label endpoint blocker -/

/-- (L7) The canonical-label blocker of a critical-shell system: send a label to
the label of the blocker center chosen for its geometric point. -/
noncomputable def endpointBlocker
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (H : CriticalShellSystem A) (L : CanonicalLabeling S) : Label → Label :=
  fun q => L.labelOf (H.centerAt (L.pointOf q) (L.mem_carrier q))

/-- (L7) A label is never its own blocker: the blocker center lies in the
carrier with its source erased, so it is distinct from the source point. -/
theorem endpointBlocker_ne
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (H : CriticalShellSystem A) (L : CanonicalLabeling S) (q : Label) :
    endpointBlocker H L q ≠ q := by
  intro hEq
  simp only [endpointBlocker] at hEq
  have hc_mem : H.centerAt (L.pointOf q) (L.mem_carrier q) ∈ A :=
    Finset.mem_of_mem_erase
      (H.selectedAt (L.pointOf q) (L.mem_carrier q)).toCriticalFourShell.center_mem
  have hc_ne : H.centerAt (L.pointOf q) (L.mem_carrier q) ≠ L.pointOf q :=
    Finset.ne_of_mem_erase
      (H.selectedAt (L.pointOf q) (L.mem_carrier q)).toCriticalFourShell.center_mem
  apply hc_ne
  have hcong := congrArg L.pointOf hEq
  rwa [L.pointOf_labelOf hc_mem] at hcong

/-- (L7) Every label lies in the pulled-back row at its blocker: the selected
class the pattern puts at the blocker center is exactly the chosen shell, which
contains the source. -/
theorem mem_row_endpointBlocker
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (H : CriticalShellSystem A) (L : CanonicalLabeling S)
    (F : FaithfulCarrierPattern A) (q : Label) :
    q ∈ row (patternCode L F) (endpointBlocker H L q) := by
  have hc_mem : H.centerAt (L.pointOf q) (L.mem_carrier q) ∈ A :=
    Finset.mem_of_mem_erase
      (H.selectedAt (L.pointOf q) (L.mem_carrier q)).toCriticalFourShell.center_mem
  apply (mem_row_patternCode_iff L F (endpointBlocker H L q) q).mpr
  have hpt : L.pointOf (endpointBlocker H L q) =
      H.centerAt (L.pointOf q) (L.mem_carrier q) := by
    simp only [endpointBlocker]
    exact L.pointOf_labelOf hc_mem
  have gen : ∀ (z : ℝ²) (hz : z ∈ A),
      z = H.centerAt (L.pointOf q) (L.mem_carrier q) →
      L.pointOf q ∈ (F.classAt z hz).support := by
    intro z hz hzeq
    subst hzeq
    exact H.source_mem_selectedFourClass (L.pointOf q) (L.mem_carrier q)
      (F.classAt (H.centerAt (L.pointOf q) (L.mem_carrier q)) hz)
  exact gen (L.pointOf (endpointBlocker H L q))
    (L.mem_carrier (endpointBlocker H L q)) hpt

/-- (L7) Every source on the escaped row `1` is blocked by label `1` itself,
when the shell system routes that row's exact selected class to the escaped
apex. -/
theorem endpointBlocker_eq_one_of_mem_row_one
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (H : CriticalShellSystem A) (L : CanonicalLabeling S)
    (F : FaithfulCarrierPattern A) {radius : ℝ}
    (hclass : (F.classAt (L.pointOf 1) (L.mem_carrier 1)).support =
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hoverride : ∀ z : ℝ²,
      z ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius →
      ∀ hz : z ∈ A, H.centerAt z hz = S.oppositeVertexByIndex S.oppIndex1)
    {q : Label} (hq : q ∈ row (patternCode L F) 1) :
    endpointBlocker H L q = 1 := by
  have hmem : L.pointOf q ∈ (F.classAt (L.pointOf 1) (L.mem_carrier 1)).support :=
    (mem_row_patternCode_iff L F 1 q).mp hq
  rw [hclass] at hmem
  have hc : H.centerAt (L.pointOf q) (L.mem_carrier q) =
      S.oppositeVertexByIndex S.oppIndex1 :=
    hoverride (L.pointOf q) hmem (L.mem_carrier q)
  have hpt1 : L.pointOf 1 = S.oppositeVertexByIndex S.oppIndex1 :=
    L.point_one_eq_opposite
  change L.labelOf (H.centerAt (L.pointOf q) (L.mem_carrier q)) = 1
  rw [hc, ← hpt1, L.labelOf_pointOf]

/-- (L7 assembly) Under a left endpoint escape at `oppIndex1`, build the
overridden critical-shell system at the escaped apex and expose the two
`EndpointLeftShellOK` blocker conjuncts for the pulled-back pattern.  The
minimality datum comes from the leaf's contrapositive hypothesis; the escaped
apex is blocked by `endpointLeft_no_qfree_of_mem`. -/
theorem exists_endpointBlocker_of_endpointEscapeLeft
    {A : Finset ℝ²} (S : SurplusCapPacket A) (L : CanonicalLabeling S)
    {radius rho : ℝ} {x : ℝ²}
    (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hM44 : S.IsM44)
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    (F : FaithfulCarrierPattern A)
    (hF : ∀ hv : S.oppositeVertexByIndex S.oppIndex1 ∈ A,
      (F.classAt (S.oppositeVertexByIndex S.oppIndex1) hv).support =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius) :
    ∃ blocker : Label → Label,
      (∀ q, blocker q ≠ q ∧ q ∈ row (patternCode L F) (blocker q)) ∧
      (∀ q, q ∈ row (patternCode L F) 1 → blocker q = 1) := by
  classical
  have hmin := CounterexampleData.minimal_of_smaller_false hne hconv hK4 S hMin
  have hcenter : S.oppositeVertexByIndex S.oppIndex1 ∈ A :=
    S.oppositeVertexByIndex_mem S.oppIndex1
  have hradius : 0 < radius := hend.1
  have hcard : (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card = 4 :=
    endpointLeft_selectedClass_card_eq_four S hconv hM44 hend
  have hblocked : ∀ z : ℝ²,
      z ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius →
      ¬ HasNEquidistantPointsAt 4 (A.erase z)
        (S.oppositeVertexByIndex S.oppIndex1) :=
    fun z hz => endpointLeft_no_qfree_of_mem S hconv hM44 hend hz
  obtain ⟨H₀⟩ := CounterexampleData.exists_criticalShellSystem_of_minimal hmin
  have H₀' : CriticalShellSystem A := H₀
  refine ⟨endpointBlocker (H₀'.overrideExactSelectedClass hcenter hradius hcard hblocked) L,
    fun q => ⟨endpointBlocker_ne _ L q, mem_row_endpointBlocker _ L F q⟩, ?_⟩
  intro q hq
  refine endpointBlocker_eq_one_of_mem_row_one _ L F
    (classAt_support_at_point_one L F hF) ?_ hq
  intro z hz hzA
  exact H₀'.overrideExactSelectedClass_centerAt hcenter hradius hcard hblocked hzA hz

/- ## L3, L4 right mirrors. Right-escape apex facts at `oppIndex2` -/

section RightEscape

variable {A : Finset ℝ²} (S : SurplusCapPacket A)
  {radius rho : ℝ} {x : ℝ²}

/-- (L3 right mirror) Under a right endpoint escape at `oppIndex2`, deleting any
member of the escaped selected class destroys every K4 witness at that apex.
`O1 ↔ O2` mirror of `endpointLeft_no_qfree_of_mem`: the class has exactly four
points (`endpointRight_selectedClass_card_eq_four`), and any competing radius
with four ambient points equals `radius` by Moser-apex radius uniqueness (L2). -/
theorem endpointRight_no_qfree_of_mem
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x)
    {q : ℝ²}
    (hq : q ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius) :
    ¬ HasNEquidistantPointsAt 4 (A.erase q)
      (S.oppositeVertexByIndex S.oppIndex2) := by
  intro hK4
  rcases hK4 with ⟨rho', hrho', hcardFilter⟩
  have hcardErase :
      4 ≤ (SelectedClass (A.erase q)
        (S.oppositeVertexByIndex S.oppIndex2) rho').card := by
    simpa [SelectedClass] using hcardFilter
  have hcardAmbient :
      4 ≤ (SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex2) rho').card :=
    le_trans hcardErase (Finset.card_le_card (by
      rw [selectedClass_erase_eq]
      exact Finset.erase_subset q
        (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho')))
  have hclassCard :
      (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius).card = 4 :=
    endpointRight_selectedClass_card_eq_four S hconv hM44 hend
  have hrhoeq : rho' = radius :=
    SelectedFourClass.k4Radius_eq_of_moserCap S hconv S.oppIndex2
      hM44.oppIndex2_cap_card_eq_four hrho' hend.1 hcardAmbient hclassCard.ge
  subst rho'
  rw [selectedClass_erase_eq, Finset.card_erase_of_mem hq, hclassCard] at hcardErase
  omega

/-- (L4 right mirror) The escaped selected class at `oppIndex2` decomposes as the
strict interior of cap `O2`, the escapee `x`, and one further surplus-cap point
`w`.  `O1 ↔ O2` mirror of `endpointLeft_selectedClass_decomposition`: the
interior (two points) and `x` are distinct members; a card-four count forces a
unique fourth point `w`, and the `moserCapCoreSelectorAt` cover pins `w` to the
left-adjacent cap of `oppIndex2`, which is the surplus cap. -/
theorem endpointRight_selectedClass_decomposition
    (hconv : ConvexIndep A) (hM44 : S.IsM44)
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x) :
    ∃ w, w ∈ S.surplusCap ∧
      w ≠ S.oppositeVertexByIndex S.oppIndex2 ∧ w ≠ x ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius =
        insert w (insert x (S.capInteriorByIndex S.oppIndex2)) := by
  have hrad : 0 < radius := hend.1
  have hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius).card :=
    hend.2.2.1
  have hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius :=
    hend.2.2.2.1
  have hxEsc : x ∈ S.rightAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪ S.leftAdjacentCapByIndex S.oppIndex2) :=
    hend.2.2.2.2.1
  have hT4 : (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius).card = 4 :=
    endpointRight_selectedClass_card_eq_four S hconv hM44 hend
  have hintsub :
      S.capInteriorByIndex S.oppIndex2 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius :=
    endpointRight_oppInterior2_subset_selectedClass S hconv hM44 hend
  have hint2 : (S.capInteriorByIndex S.oppIndex2).card = 2 :=
    S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four S.oppIndex2
      hM44.oppIndex2_cap_card_eq_four
  have hx_not_cap2 : x ∉ S.capByIndex S.oppIndex2 :=
    endpointRight_escapee_not_mem_capByIndex_oppIndex2 S hend
  have hx_notin_int2 : x ∉ S.capInteriorByIndex S.oppIndex2 :=
    fun h => hx_not_cap2 (S.capInteriorByIndex_subset_capByIndex S.oppIndex2 h)
  have hx_rightAdj : x ∈ S.rightAdjacentCapByIndex S.oppIndex2 :=
    (Finset.mem_sdiff.mp hxEsc).1
  have hsub3 :
      insert x (S.capInteriorByIndex S.oppIndex2) ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius := by
    intro z hz
    rcases Finset.mem_insert.mp hz with h | h
    · exact h ▸ hxT
    · exact hintsub h
  have hcard_ins3 :
      (insert x (S.capInteriorByIndex S.oppIndex2)).card = 3 := by
    rw [Finset.card_insert_of_notMem hx_notin_int2, hint2]
  obtain ⟨w, hwT, hwnot⟩ :
      ∃ w ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius,
        w ∉ insert x (S.capInteriorByIndex S.oppIndex2) := by
    by_contra hcon
    push_neg at hcon
    have hsub : SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius ⊆
        insert x (S.capInteriorByIndex S.oppIndex2) := fun z hz => hcon z hz
    have := Finset.card_le_card hsub
    rw [hT4, hcard_ins3] at this
    omega
  have hw_ne_x : w ≠ x :=
    fun h => hwnot (by rw [h]; exact Finset.mem_insert_self x _)
  have hw_not_int2 : w ∉ S.capInteriorByIndex S.oppIndex2 :=
    fun h => hwnot (Finset.mem_insert_of_mem h)
  have hw_ne_v2 : w ≠ S.oppositeVertexByIndex S.oppIndex2 := by
    intro h
    have hdist : dist (S.oppositeVertexByIndex S.oppIndex2) w = radius :=
      (mem_selectedClass.mp hwT).2
    rw [h, dist_self] at hdist
    linarith
  have hfinal :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius =
        insert w (insert x (S.capInteriorByIndex S.oppIndex2)) := by
    refine (Finset.eq_of_subset_of_card_le ?_ ?_).symm
    · intro z hz
      rcases Finset.mem_insert.mp hz with h | h
      · exact h ▸ hwT
      · exact hsub3 h
    · rw [Finset.card_insert_of_notMem hwnot, hcard_ins3, hT4]
  have hw_surplus : w ∈ S.surplusCap := by
    have hw_sdiff :
        w ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius \
          S.capInteriorByIndex S.oppIndex2 :=
      Finset.mem_sdiff.mpr ⟨hwT, hw_not_int2⟩
    have hw_cover :=
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps S.oppIndex2 hrad hw_sdiff
    rcases Finset.mem_union.mp hw_cover with hwleft | hwright
    · have hw_in_leftAdj : w ∈ S.leftAdjacentCapByIndex S.oppIndex2 :=
        Finset.mem_of_mem_inter_right hwleft
      have hleft_eq :
          S.leftAdjacentCapByIndex S.oppIndex2 = S.surplusCap := by
        have h1 := S.leftAdjacentCapByIndex_rightAdjacentIndex S.surplusIdx
        rw [← S.oppIndex2_eq_rightAdjacentIndex_surplusIdx] at h1
        rw [h1]
        exact capByIndex_surplusIdx_eq_surplusCap S
      rw [← hleft_eq]
      exact hw_in_leftAdj
    · exfalso
      have hxrightmem :
          x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius ∩
            S.rightAdjacentCapByIndex S.oppIndex2 :=
        Finset.mem_inter.mpr ⟨hxT, hx_rightAdj⟩
      have h2le :
          1 < (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius ∩
            S.rightAdjacentCapByIndex S.oppIndex2).card :=
        Finset.one_lt_card.mpr ⟨x, hxrightmem, w, hwright, Ne.symm hw_ne_x⟩
      have hle1 :=
        (S.moserCapCoreSelectorAt hconv S.oppIndex2 hrad
          hM44.oppIndex2_cap_card_eq_four hcard).2.2.2
      omega
  exact ⟨w, hw_surplus, hw_ne_v2, hw_ne_x, hfinal⟩

end RightEscape

end EndpointCertificate

end Problem97
