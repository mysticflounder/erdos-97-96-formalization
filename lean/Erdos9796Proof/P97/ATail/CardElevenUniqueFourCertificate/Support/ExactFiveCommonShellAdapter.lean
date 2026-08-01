/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FirstApexUniqueRadiusResidual
import Erdos9796Proof.P97.ATail.CapApexRadiusRigidity
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.UniqueRowProducer.card_five_interior_survivor_pair
import Erdos9796Proof.P97.U1CardElevenCapProfile
import Erdos9796Proof.P97.Census554.GeometryBridge

/-!
# Exact-five common-shell card-eleven adapter

This file records source-clean geometric facts needed to transport the
card-eleven common-obstruction-center residual to the four fixed labelled
shell cases.  It contains no finite-certificate ingress.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFiniteN11ExactFiveCommonShellAdapter

open ATailCriticalPairFrontier
open FirstApexUniqueRadiusResidual
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

open Census554

/-- Reindex a cap-aware labeling by a permutation preserving the three
canonical interior-label blocks and the three apex labels. -/
private noncomputable def Card11CapLabeling.reindex
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (L : Card11CapLabeling CP frame) (σ : Equiv.Perm (Fin 11))
    (hzero : σ 0 = 0) (hone : σ 1 = 1) (htwo : σ 2 = 2)
    (hS : ∀ p, σ p ∈ Card11Labeling.capSInteriorLabels ↔
      p ∈ Card11Labeling.capSInteriorLabels)
    (hO1 : ∀ p, σ p ∈ Card11Labeling.capO1InteriorLabels ↔
      p ∈ Card11Labeling.capO1InteriorLabels)
    (hO2 : ∀ p, σ p ∈ Card11Labeling.capO2InteriorLabels ↔
      p ∈ Card11Labeling.capO2InteriorLabels) :
    Card11CapLabeling CP frame := by
  let L' : Card11Labeling M frame := {
    pointOf := fun p => L.pointOf (σ p)
    injective := L.injective.comp σ.injective
    mem_carrier := fun p => L.mem_carrier (σ p)
    carrier_surjective := by
      intro x hx
      obtain ⟨p, hp⟩ := L.carrier_surjective x hx
      obtain ⟨p', rfl⟩ := σ.surjective p
      exact ⟨p', hp⟩
    point_zero := by simpa [hzero] using L.point_zero
    point_one := by simpa [hone] using L.point_one
    point_two := by simpa [htwo] using L.point_two }
  refine {
    toCard11Labeling := L'
    surplusInterior_eq := ?_
    secondInterior_eq := ?_
    restInterior_eq := ?_ }
  · ext p
    simp only [Card11Labeling.interiorLabels,
      Card11Labeling.mem_labelsOf]
    change L.pointOf (σ p) ∈ capInteriorAt CP surplus ↔
      p ∈ Card11Labeling.capSInteriorLabels
    rw [← Card11Labeling.mem_labelsOf]
    change σ p ∈ L.toCard11Labeling.interiorLabels CP surplus ↔
      p ∈ Card11Labeling.capSInteriorLabels
    rw [L.surplusInterior_eq]
    exact hS p
  · ext p
    simp only [Card11Labeling.interiorLabels,
      Card11Labeling.mem_labelsOf]
    change L.pointOf (σ p) ∈ capInteriorAt CP second ↔
      p ∈ Card11Labeling.capO1InteriorLabels
    rw [← Card11Labeling.mem_labelsOf]
    change σ p ∈ L.toCard11Labeling.interiorLabels CP second ↔
      p ∈ Card11Labeling.capO1InteriorLabels
    rw [L.secondInterior_eq]
    exact hO1 p
  · ext p
    simp only [Card11Labeling.interiorLabels,
      Card11Labeling.mem_labelsOf]
    change L.pointOf (σ p) ∈ capInteriorAt CP frame.rest ↔
      p ∈ Card11Labeling.capO2InteriorLabels
    rw [← Card11Labeling.mem_labelsOf]
    change σ p ∈ L.toCard11Labeling.interiorLabels CP frame.rest ↔
      p ∈ Card11Labeling.capO2InteriorLabels
    rw [L.restInterior_eq]
    exact hO2 p

/-- A cap-aware labeling can be reindexed inside its second three-label block
so that any prescribed enumeration of that strict interior occupies labels
`6`, `7`, and `8`. -/
theorem Card11CapLabeling.exists_pointed_secondInterior
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (L : Card11CapLabeling CP frame) {q w c : ℝ²}
    (hI : capInteriorAt CP second = {q, w, c})
    (hqw : q ≠ w) (hcq : c ≠ q) (hcw : c ≠ w) :
    ∃ L' : Card11CapLabeling CP frame,
      L'.pointOf 6 = q ∧ L'.pointOf 7 = w ∧ L'.pointOf 8 = c := by
  have hqI : q ∈ capInteriorAt CP second := by
    rw [hI]
    simp
  have hwI : w ∈ capInteriorAt CP second := by
    rw [hI]
    simp
  have hcI : c ∈ capInteriorAt CP second := by
    rw [hI]
    simp
  obtain ⟨aq, haq⟩ :=
    L.carrier_surjective q (Card11Labeling.capInteriorAt_subset CP second hqI)
  obtain ⟨aw, haw⟩ :=
    L.carrier_surjective w (Card11Labeling.capInteriorAt_subset CP second hwI)
  obtain ⟨ac, hac⟩ :=
    L.carrier_surjective c (Card11Labeling.capInteriorAt_subset CP second hcI)
  have haqBlock : aq ∈ Card11Labeling.capO1InteriorLabels := by
    rw [← L.secondInterior_eq]
    exact (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
      (haq ▸ hqI)
  have hawBlock : aw ∈ Card11Labeling.capO1InteriorLabels := by
    rw [← L.secondInterior_eq]
    exact (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
      (haw ▸ hwI)
  have hacBlock : ac ∈ Card11Labeling.capO1InteriorLabels := by
    rw [← L.secondInterior_eq]
    exact (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
      (hac ▸ hcI)
  have haqCases : aq = 6 ∨ aq = 7 ∨ aq = 8 := by
    simpa [Card11Labeling.capO1InteriorLabels] using haqBlock
  have hawCases : aw = 6 ∨ aw = 7 ∨ aw = 8 := by
    simpa [Card11Labeling.capO1InteriorLabels] using hawBlock
  have hacCases : ac = 6 ∨ ac = 7 ∨ ac = 8 := by
    simpa [Card11Labeling.capO1InteriorLabels] using hacBlock
  have haqNeAw : aq ≠ aw := by
    intro h
    apply hqw
    rw [← haq, ← haw, h]
  have haqNeAc : aq ≠ ac := by
    intro h
    apply hcq
    rw [← hac, ← haq, h]
  have hawNeAc : aw ≠ ac := by
    intro h
    apply hcw
    rw [← hac, ← haw, h]
  let build :
      ∀ σ : Equiv.Perm (Fin 11),
        σ 0 = 0 → σ 1 = 1 → σ 2 = 2 →
        (∀ p, σ p ∈ Card11Labeling.capSInteriorLabels ↔
          p ∈ Card11Labeling.capSInteriorLabels) →
        (∀ p, σ p ∈ Card11Labeling.capO1InteriorLabels ↔
          p ∈ Card11Labeling.capO1InteriorLabels) →
        (∀ p, σ p ∈ Card11Labeling.capO2InteriorLabels ↔
          p ∈ Card11Labeling.capO2InteriorLabels) →
        L.pointOf (σ 6) = q →
        L.pointOf (σ 7) = w →
        L.pointOf (σ 8) = c →
        ∃ L' : Card11CapLabeling CP frame,
          L'.pointOf 6 = q ∧ L'.pointOf 7 = w ∧ L'.pointOf 8 = c :=
    fun σ h0 h1 h2 hS hO1 hO2 h6 h7 h8 =>
      ⟨Card11CapLabeling.reindex L σ h0 h1 h2 hS hO1 hO2,
        h6, h7, h8⟩
  rcases haqCases with haq6 | haq7 | haq8 <;>
    rcases hawCases with haw6 | haw7 | haw8 <;>
      rcases hacCases with hac6 | hac7 | hac8
  all_goals
    try { exact (haqNeAw (by omega)).elim }
    try { exact (haqNeAc (by omega)).elim }
    try { exact (hawNeAc (by omega)).elim }
  · exact build (Equiv.refl (Fin 11))
      (by decide) (by decide) (by decide)
      (by intro p; rfl) (by intro p; rfl) (by intro p; rfl)
      (by simpa [haq6] using haq)
      (by simpa [haw7] using haw)
      (by simpa [hac8] using hac)
  · exact build (Equiv.swap (7 : Fin 11) 8)
      (by decide) (by decide) (by decide)
      (by decide) (by decide) (by decide)
      (by simpa [haq6] using haq)
      (by simpa [haw8] using haw)
      (by simpa [hac7] using hac)
  · exact build (Equiv.swap (6 : Fin 11) 7)
      (by decide) (by decide) (by decide)
      (by decide) (by decide) (by decide)
      (by simpa [haq7] using haq)
      (by simpa [haw6] using haw)
      (by simpa [hac8] using hac)
  · exact build
      ((Equiv.swap (7 : Fin 11) 8).trans (Equiv.swap (6 : Fin 11) 7))
      (by decide) (by decide) (by decide)
      (by decide) (by decide) (by decide)
      (by simpa [haq7] using haq)
      (by simpa [haw8] using haw)
      (by simpa [hac6] using hac)
  · exact build
      ((Equiv.swap (6 : Fin 11) 7).trans (Equiv.swap (7 : Fin 11) 8))
      (by decide) (by decide) (by decide)
      (by decide) (by decide) (by decide)
      (by simpa [haq8] using haq)
      (by simpa [haw6] using haw)
      (by simpa [hac7] using hac)
  · exact build (Equiv.swap (6 : Fin 11) 8)
      (by decide) (by decide) (by decide)
      (by decide) (by decide) (by decide)
      (by simpa [haq8] using haq)
      (by simpa [haw7] using haw)
      (by simpa [hac6] using hac)

/-- At cardinality eleven, the common obstruction center is the third
strict-interior member of the exact five-point first-apex radius class.

This is the geometric justification for placing the frontier sources and
their common blocker at labels `6`, `7`, and `8` in the fixed Census554
surface. -/
theorem commonObstructionCenter_mem_firstApexSelectedClass_of_card_eq_eleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F)
    (hcard : D.A.card = 11) :
    H.centerAt R.interior.frontier.pair.q
        R.interior.frontier.pair.q_mem_A ∈
      SelectedClass D.A S.oppApex1 radius := by
  let T : Finset ℝ² := SelectedClass D.A S.oppApex1 radius
  let I : Finset ℝ² := S.capInteriorByIndex S.oppIndex1
  have hinter :
      3 ≤ (T ∩ I).card := by
    simpa [T, I] using
      ATailUniqueRowProducerScratch.firstApex_cardFive_interior_card_ge_three
        D S R.interior.frontier.radius_pos R.class_card_eq_five
  have hIge : 3 ≤ I.card :=
    hinter.trans (Finset.card_le_card Finset.inter_subset_right)
  have hcapAdd :
      I.card + 2 = (S.capByIndex S.oppIndex1).card := by
    simpa [I] using
      ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
        S S.oppIndex1
  have hsecond5 : 5 ≤ (S.partition.capAt S.oppIndex1).card := by
    have hsecond5' : 5 ≤ (S.capByIndex S.oppIndex1).card := by
      omega
    rcases hi : S.oppIndex1 with ⟨i, hiLt⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.capByIndex, CapTriple.capAt, hi] using hsecond5'
  have hprofile :=
    capInteriorProfile_eq_332_of_card_eq_eleven
      S.triangleNonObtuse S.hCirc S.partition rfl
      (S.surplusIdx_ne_oppIndex1).symm S.surplus hsecond5 hcard
  have hIcard : I.card = 3 := by
    rcases hi : S.oppIndex1 with ⟨i, hiLt⟩
    interval_cases i <;>
      simpa [I, SurplusCapPacket.capInteriorByIndex, capInteriorAt,
        U1OppositeCapLowerBounds.interior1,
        U1OppositeCapLowerBounds.interior2,
        U1OppositeCapLowerBounds.interior3, hi] using hprofile.2.1
  have hinterCard : (T ∩ I).card = 3 := by
    apply Nat.le_antisymm
    · simpa [hIcard] using
        Finset.card_le_card (Finset.inter_subset_right :
          T ∩ I ⊆ I)
    · exact hinter
  have hinterEq : T ∩ I = I := by
    apply Finset.eq_of_subset_of_card_le Finset.inter_subset_right
    simpa [hinterCard, hIcard]
  have hcI :
      H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A ∈ I := by
    simpa [I] using R.commonObstructionCenter_mem_interior
  have hcInter :
      H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A ∈ T ∩ I := by
    simpa only [hinterEq] using hcI
  exact (Finset.mem_inter.mp hcInter).1

/-- The first opposite-cap strict interior is exactly the two frontier sources
and their common obstruction center.  This is the pointed three-element
enumeration needed to force those points to labels `6`, `7`, and `8`. -/
theorem firstOppositeInterior_eq_sources_insert_commonCenter_of_card_eq_eleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F)
    (hcard : D.A.card = 11) :
    S.capInteriorByIndex S.oppIndex1 =
      {R.interior.frontier.pair.q,
        R.interior.frontier.pair.w,
        H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A} := by
  let q : ℝ² := R.interior.frontier.pair.q
  let w : ℝ² := R.interior.frontier.pair.w
  let c : ℝ² :=
    H.centerAt R.interior.frontier.pair.q
      R.interior.frontier.pair.q_mem_A
  let I : Finset ℝ² := S.capInteriorByIndex S.oppIndex1
  have hcapAdd :
      I.card + 2 = (S.capByIndex S.oppIndex1).card := by
    simpa [I] using
      ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
        S S.oppIndex1
  have hsecond5 : 5 ≤ (S.partition.capAt S.oppIndex1).card := by
    have hsecond5' : 5 ≤ (S.capByIndex S.oppIndex1).card := by
      have hinter :
          3 ≤ (SelectedClass D.A S.oppApex1 radius ∩ I).card := by
        simpa [I] using
          ATailUniqueRowProducerScratch.firstApex_cardFive_interior_card_ge_three
            D S R.interior.frontier.radius_pos R.class_card_eq_five
      have hIge : 3 ≤ I.card :=
        hinter.trans (Finset.card_le_card Finset.inter_subset_right)
      omega
    rcases hi : S.oppIndex1 with ⟨i, hiLt⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.capByIndex, CapTriple.capAt, hi] using hsecond5'
  have hprofile :=
    capInteriorProfile_eq_332_of_card_eq_eleven
      S.triangleNonObtuse S.hCirc S.partition rfl
      (S.surplusIdx_ne_oppIndex1).symm S.surplus hsecond5 hcard
  have hIcard : I.card = 3 := by
    rcases hi : S.oppIndex1 with ⟨i, hiLt⟩
    interval_cases i <;>
      simpa [I, SurplusCapPacket.capInteriorByIndex, capInteriorAt,
        U1OppositeCapLowerBounds.interior1,
        U1OppositeCapLowerBounds.interior2,
        U1OppositeCapLowerBounds.interior3, hi] using hprofile.2.1
  have hqI : q ∈ I := by
    simpa [q, I] using (Finset.mem_inter.mp R.interior.q_mem_interior).2
  have hwI : w ∈ I := by
    simpa [w, I] using (Finset.mem_inter.mp R.interior.w_mem_interior).2
  have hcI : c ∈ I := by
    simpa [c, I] using R.commonObstructionCenter_mem_interior
  have hqne : q ≠ w := by
    simpa [q, w] using R.interior.frontier.pair.q_ne_w
  have hcneW : c ≠ w := by
    intro hcw
    have hwSupport := R.mutual_cross_membership.1
    have hcNot :=
      (H.selectedAt R.interior.frontier.pair.q
        R.interior.frontier.pair.q_mem_A).toCriticalFourShell.center_not_mem_support
    apply hcNot
    simpa [c, w, hcw] using hwSupport
  have hcneQ : c ≠ q := by
    intro hcq
    have hqSupport := R.mutual_cross_membership.2
    have hcNot :=
      (H.selectedAt R.interior.frontier.pair.w
        R.interior.frontier.pair.w_mem_A).toCriticalFourShell.center_not_mem_support
    have hcenterWq :
        H.centerAt R.interior.frontier.pair.w
          R.interior.frontier.pair.w_mem_A =
        R.interior.frontier.pair.q :=
      R.obstructionCenters_eq.symm.trans hcq
    apply hcNot
    simpa only [hcenterWq] using hqSupport
  have htripleSubset : ({q, w, c} : Finset ℝ²) ⊆ I := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact hqI
    · exact hwI
    · exact hcI
  have htripleCard : ({q, w, c} : Finset ℝ²).card = 3 := by
    have hqNot : q ∉ ({w, c} : Finset ℝ²) := by
      simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
      exact ⟨hqne, hcneQ.symm⟩
    have hwNot : w ∉ ({c} : Finset ℝ²) := by
      simpa only [Finset.mem_singleton] using hcneW.symm
    rw [Finset.card_insert_of_notMem hqNot,
      Finset.card_insert_of_notMem hwNot, Finset.card_singleton]
  have htripleEq : ({q, w, c} : Finset ℝ²) = I := by
    apply Finset.eq_of_subset_of_card_le htripleSubset
    simpa [htripleCard, hIcard]
  simpa [q, w, c, I] using htripleEq.symm

/-- The exact-five common-center residual admits a cap-aware card-eleven
labeling with the two frontier sources at `6`, `7` and their common center at
`8`.  This is the concrete geometric-to-labelled handoff used by the four
canonical shell cases. -/
theorem exists_pointed_commonCenter_card11CapLabeling
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F)
    (hcard : D.A.card = 11) :
    ∃ frame :
        MultiCenter.JointCapIndexFrame S.surplusIdx S.oppIndex1,
      ∃ L : Card11CapLabeling S.partition frame,
        L.pointOf 6 = R.interior.frontier.pair.q ∧
          L.pointOf 7 = R.interior.frontier.pair.w ∧
            L.pointOf 8 =
              H.centerAt R.interior.frontier.pair.q
                R.interior.frontier.pair.q_mem_A := by
  have hsecond : S.oppIndex1 ≠ S.surplusIdx :=
    (S.surplusIdx_ne_oppIndex1).symm
  let frame := Classical.choice
    (MultiCenter.JointCapIndexFrame.nonempty_of_ne hsecond)
  have hinter :
      3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card := by
    exact
      ATailUniqueRowProducerScratch.firstApex_cardFive_interior_card_ge_three
        D S R.interior.frontier.radius_pos R.class_card_eq_five
  have hcapAdd :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex1
  have hsecond5' : 5 ≤ (S.capByIndex S.oppIndex1).card := by
    have hIge : 3 ≤ (S.capInteriorByIndex S.oppIndex1).card :=
      hinter.trans (Finset.card_le_card Finset.inter_subset_right)
    omega
  have hsecond5 : 5 ≤ (S.partition.capAt S.oppIndex1).card := by
    rcases hi : S.oppIndex1 with ⟨i, hiLt⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.capByIndex, CapTriple.capAt, hi] using hsecond5'
  obtain ⟨L⟩ :=
    Card11CapLabeling.nonempty_of_card_eq_eleven
      S.triangleNonObtuse S.hCirc S.partition rfl hsecond frame
      S.surplus hsecond5 hcard
  have hI :
      capInteriorAt S.partition S.oppIndex1 =
        {R.interior.frontier.pair.q,
          R.interior.frontier.pair.w,
          H.centerAt R.interior.frontier.pair.q
            R.interior.frontier.pair.q_mem_A} := by
    have hgeom :=
      firstOppositeInterior_eq_sources_insert_commonCenter_of_card_eq_eleven
        R hcard
    rcases hi : S.oppIndex1 with ⟨i, hiLt⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.capInteriorByIndex, capInteriorAt,
        U1OppositeCapLowerBounds.interior1,
        U1OppositeCapLowerBounds.interior2,
        U1OppositeCapLowerBounds.interior3, hi] using hgeom
  have hqw :
      R.interior.frontier.pair.q ≠ R.interior.frontier.pair.w :=
    R.interior.frontier.pair.q_ne_w
  have hcw :
      H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A ≠
        R.interior.frontier.pair.w := by
    intro hcw
    apply
      (H.selectedAt R.interior.frontier.pair.q
        R.interior.frontier.pair.q_mem_A).toCriticalFourShell.center_not_mem_support
    simpa [hcw] using R.mutual_cross_membership.1
  have hcq :
      H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A ≠
        R.interior.frontier.pair.q := by
    intro hcq
    have hcNot :=
      (H.selectedAt R.interior.frontier.pair.w
        R.interior.frontier.pair.w_mem_A).toCriticalFourShell.center_not_mem_support
    apply hcNot
    have hcenterWq :
        H.centerAt R.interior.frontier.pair.w
          R.interior.frontier.pair.w_mem_A =
        R.interior.frontier.pair.q :=
      R.obstructionCenters_eq.symm.trans hcq
    simpa only [hcenterWq] using R.mutual_cross_membership.2
  obtain ⟨L', h6, h7, h8⟩ :=
    Card11CapLabeling.exists_pointed_secondInterior L hI hqw hcq hcw
  exact ⟨frame, L', h6, h7, h8⟩

private noncomputable def moveSurplusOuterLabel
    (a : Fin 11) : Equiv.Perm (Fin 11) :=
  if a = 2 then Equiv.refl _ else Equiv.swap 3 a

private noncomputable def moveRestOuterLabel
    (b : Fin 11) : Equiv.Perm (Fin 11) :=
  if b = 0 then Equiv.refl _ else Equiv.swap 9 b

set_option maxHeartbeats 1000000 in
/-- Reindex the two outer interior blocks so that a shell point in the
surplus cap occupies `2` or `3`, and a shell point in the remaining cap
occupies `0` or `9`.  The pointed common-center labels `6`, `7`, `8` are
fixed. -/
theorem Card11CapLabeling.exists_canonical_outer_reindex
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (L : Card11CapLabeling CP frame) {a b : Fin 11}
    (ha : a ∈ ({2} ∪ Card11Labeling.capSInteriorLabels :
      Finset (Fin 11)))
    (hb : b ∈ ({0} ∪ Card11Labeling.capO2InteriorLabels :
      Finset (Fin 11))) :
    ∃ L' : Card11CapLabeling CP frame,
      (L'.pointOf 2 = L.pointOf a ∨ L'.pointOf 3 = L.pointOf a) ∧
      (L'.pointOf 0 = L.pointOf b ∨ L'.pointOf 9 = L.pointOf b) ∧
      L'.pointOf 6 = L.pointOf 6 ∧
      L'.pointOf 7 = L.pointOf 7 ∧
      L'.pointOf 8 = L.pointOf 8 := by
  let σS := moveSurplusOuterLabel a
  let σO := moveRestOuterLabel b
  let σ : Equiv.Perm (Fin 11) := σS.trans σO
  have hSfix : ∀ p ∉ Card11Labeling.capSInteriorLabels, σS p = p := by
    intro p hp
    fin_cases a <;> fin_cases p <;>
      simp [σS, moveSurplusOuterLabel, Equiv.swap_apply_def,
        Card11Labeling.capSInteriorLabels,
        Card11Labeling.capO2InteriorLabels] at ha hp ⊢
  have hOfix : ∀ p ∉ Card11Labeling.capO2InteriorLabels, σO p = p := by
    intro p hp
    fin_cases b <;> fin_cases p <;>
      simp [σO, moveRestOuterLabel, Equiv.swap_apply_def,
        Card11Labeling.capSInteriorLabels,
        Card11Labeling.capO2InteriorLabels] at hb hp ⊢
  have hzero : σ 0 = 0 := by
    rw [show σ 0 = σO (σS 0) by rfl,
      hSfix 0 (by decide), hOfix 0 (by decide)]
  have hone : σ 1 = 1 := by
    rw [show σ 1 = σO (σS 1) by rfl,
      hSfix 1 (by decide), hOfix 1 (by decide)]
  have htwo : σ 2 = 2 := by
    rw [show σ 2 = σO (σS 2) by rfl,
      hSfix 2 (by decide), hOfix 2 (by decide)]
  have hSS : ∀ p, σS p ∈ Card11Labeling.capSInteriorLabels ↔
      p ∈ Card11Labeling.capSInteriorLabels := by
    intro p
    fin_cases a <;> fin_cases p <;>
      simp [σS, moveSurplusOuterLabel, Equiv.swap_apply_def,
        Card11Labeling.capSInteriorLabels,
        Card11Labeling.capO2InteriorLabels] at ha ⊢
  have hOS : ∀ p, σO p ∈ Card11Labeling.capSInteriorLabels ↔
      p ∈ Card11Labeling.capSInteriorLabels := by
    intro p
    fin_cases b <;> fin_cases p <;>
      simp [σO, moveRestOuterLabel, Equiv.swap_apply_def,
        Card11Labeling.capSInteriorLabels,
        Card11Labeling.capO2InteriorLabels] at hb ⊢
  have hS : ∀ p, σ p ∈ Card11Labeling.capSInteriorLabels ↔
      p ∈ Card11Labeling.capSInteriorLabels := by
    intro p
    exact (hOS (σS p)).trans (hSS p)
  have hSO1 : ∀ p, σS p ∈ Card11Labeling.capO1InteriorLabels ↔
      p ∈ Card11Labeling.capO1InteriorLabels := by
    intro p
    fin_cases a <;> fin_cases p <;>
      simp [σS, moveSurplusOuterLabel, Equiv.swap_apply_def,
        Card11Labeling.capSInteriorLabels,
        Card11Labeling.capO1InteriorLabels,
        Card11Labeling.capO2InteriorLabels] at ha ⊢
  have hOO1 : ∀ p, σO p ∈ Card11Labeling.capO1InteriorLabels ↔
      p ∈ Card11Labeling.capO1InteriorLabels := by
    intro p
    fin_cases b <;> fin_cases p <;>
      simp [σO, moveRestOuterLabel, Equiv.swap_apply_def,
        Card11Labeling.capSInteriorLabels,
        Card11Labeling.capO1InteriorLabels,
        Card11Labeling.capO2InteriorLabels] at hb ⊢
  have hO1 : ∀ p, σ p ∈ Card11Labeling.capO1InteriorLabels ↔
      p ∈ Card11Labeling.capO1InteriorLabels := by
    intro p
    exact (hOO1 (σS p)).trans (hSO1 p)
  have hSO2 : ∀ p, σS p ∈ Card11Labeling.capO2InteriorLabels ↔
      p ∈ Card11Labeling.capO2InteriorLabels := by
    intro p
    fin_cases a <;> fin_cases p <;>
      simp [σS, moveSurplusOuterLabel, Equiv.swap_apply_def,
        Card11Labeling.capSInteriorLabels,
        Card11Labeling.capO2InteriorLabels] at ha ⊢
  have hOO2 : ∀ p, σO p ∈ Card11Labeling.capO2InteriorLabels ↔
      p ∈ Card11Labeling.capO2InteriorLabels := by
    intro p
    fin_cases b <;> fin_cases p <;>
      simp [σO, moveRestOuterLabel, Equiv.swap_apply_def,
        Card11Labeling.capSInteriorLabels,
        Card11Labeling.capO2InteriorLabels] at hb ⊢
  have hO2 : ∀ p, σ p ∈ Card11Labeling.capO2InteriorLabels ↔
      p ∈ Card11Labeling.capO2InteriorLabels := by
    intro p
    exact (hOO2 (σS p)).trans (hSO2 p)
  let L' := Card11CapLabeling.reindex L σ hzero hone htwo hS hO1 hO2
  refine ⟨L', ?_, ?_, ?_, ?_, ?_⟩
  · change L.pointOf (σ 2) = L.pointOf a ∨
      L.pointOf (σ 3) = L.pointOf a
    have hσ2 : σ 2 = σS 2 := by
      change σO (σS 2) = σS 2
      apply hOfix
      simp [Card11Labeling.capSInteriorLabels] at ha
      rcases ha with rfl | rfl | rfl | rfl <;>
        decide
    have hσ3 : σ 3 = σS 3 := by
      change σO (σS 3) = σS 3
      apply hOfix
      simp [Card11Labeling.capSInteriorLabels] at ha
      rcases ha with rfl | rfl | rfl | rfl <;>
        decide
    rw [hσ2, hσ3]
    simp [Card11Labeling.capSInteriorLabels] at ha
    rcases ha with rfl | rfl | rfl | rfl <;>
      simp [σS, moveSurplusOuterLabel, Equiv.swap_apply_def]
  · change L.pointOf (σ 0) = L.pointOf b ∨
      L.pointOf (σ 9) = L.pointOf b
    rw [hzero]
    have hσ9 : σ 9 = σO 9 := by
      change σO (σS 9) = σO 9
      rw [hSfix 9 (by decide)]
    rw [hσ9]
    simp [Card11Labeling.capO2InteriorLabels] at hb
    rcases hb with rfl | rfl | rfl <;>
      simp [σO, moveRestOuterLabel, Equiv.swap_apply_def]
  · change L.pointOf (σ 6) = L.pointOf 6
    change L.pointOf (σO (σS 6)) = L.pointOf 6
    rw [hSfix 6 (by decide), hOfix 6 (by decide)]
  · change L.pointOf (σ 7) = L.pointOf 7
    change L.pointOf (σO (σS 7)) = L.pointOf 7
    rw [hSfix 7 (by decide), hOfix 7 (by decide)]
  · change L.pointOf (σ 8) = L.pointOf 8
    change L.pointOf (σO (σS 8)) = L.pointOf 8
    rw [hSfix 8 (by decide), hOfix 8 (by decide)]

private theorem exists_firstApex_exactFive_outer_points
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F)
    (hcard : D.A.card = 11) :
    ∃ xS xR : ℝ²,
      xS ∈ SelectedClass D.A S.oppApex1 radius ∧
      xS ∈ S.capByIndex S.surplusIdx ∧
      xR ∈ SelectedClass D.A S.oppApex1 radius ∧
      xR ∈ S.capByIndex S.oppIndex2 := by
  let T : Finset ℝ² := SelectedClass D.A S.oppApex1 radius
  let I : Finset ℝ² := S.capInteriorByIndex S.oppIndex1
  have hIeq :=
    firstOppositeInterior_eq_sources_insert_commonCenter_of_card_eq_eleven R hcard
  have hqne :
      R.interior.frontier.pair.q ≠ R.interior.frontier.pair.w :=
    R.interior.frontier.pair.q_ne_w
  have hcneW :
      H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A ≠
        R.interior.frontier.pair.w := by
    intro hcw
    apply
      (H.selectedAt R.interior.frontier.pair.q
        R.interior.frontier.pair.q_mem_A).toCriticalFourShell.center_not_mem_support
    simpa only [hcw] using R.mutual_cross_membership.1
  have hcneQ :
      H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A ≠
        R.interior.frontier.pair.q := by
    intro hcq
    have hcenterWq :
        H.centerAt R.interior.frontier.pair.w
            R.interior.frontier.pair.w_mem_A =
          R.interior.frontier.pair.q :=
      R.obstructionCenters_eq.symm.trans hcq
    apply
      (H.selectedAt R.interior.frontier.pair.w
        R.interior.frontier.pair.w_mem_A).toCriticalFourShell.center_not_mem_support
    simpa only [hcenterWq] using R.mutual_cross_membership.2
  have hIcard : I.card = 3 := by
    rw [show I =
      {R.interior.frontier.pair.q,
        R.interior.frontier.pair.w,
        H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A} by
      simpa [I] using hIeq]
    have hqNot :
        R.interior.frontier.pair.q ∉
          ({R.interior.frontier.pair.w,
            H.centerAt R.interior.frontier.pair.q
              R.interior.frontier.pair.q_mem_A} : Finset ℝ²) := by
      simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
      exact ⟨hqne, hcneQ.symm⟩
    have hwNot :
        R.interior.frontier.pair.w ∉
          ({H.centerAt R.interior.frontier.pair.q
            R.interior.frontier.pair.q_mem_A} : Finset ℝ²) := by
      simpa only [Finset.mem_singleton] using hcneW.symm
    rw [Finset.card_insert_of_notMem hqNot,
      Finset.card_insert_of_notMem hwNot, Finset.card_singleton]
  have hIsub : I ⊆ T := by
    intro x hx
    rw [show I =
      {R.interior.frontier.pair.q,
        R.interior.frontier.pair.w,
        H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A} by
      simpa [I] using hIeq] at hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · simpa [T] using (Finset.mem_inter.mp R.interior.q_mem_interior).1
    · simpa [T] using (Finset.mem_inter.mp R.interior.w_mem_interior).1
    · simpa [T] using
        commonObstructionCenter_mem_firstApexSelectedClass_of_card_eq_eleven R hcard
  have hTcard : T.card = 5 := by
    simpa [T] using R.class_card_eq_five
  have houtsideCard : (T \ I).card = 2 := by
    rw [Finset.card_sdiff_of_subset hIsub, hTcard, hIcard]
  have hsurplusOne :
      (T ∩ S.capByIndex S.surplusIdx).card ≤ 1 := by
    rcases hs : S.surplusIdx with ⟨i, hi⟩
    interval_cases i
    · simpa [T, SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1,
        SurplusCapPacket.rightAdjacentCapByIndex,
        SurplusCapPacket.capByIndex, hs] using
        S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
          D.convex S.oppIndex1 radius
    · simpa [T, SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1,
        SurplusCapPacket.rightAdjacentCapByIndex,
        SurplusCapPacket.capByIndex, hs] using
        S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
          D.convex S.oppIndex1 radius
    · simpa [T, SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1,
        SurplusCapPacket.rightAdjacentCapByIndex,
        SurplusCapPacket.capByIndex, hs] using
        S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
          D.convex S.oppIndex1 radius
  have hrestOne :
      (T ∩ S.capByIndex S.oppIndex2).card ≤ 1 := by
    rcases hs : S.surplusIdx with ⟨i, hi⟩
    interval_cases i
    · simpa [T, SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
        SurplusCapPacket.leftAdjacentCapByIndex,
        SurplusCapPacket.capByIndex, hs] using
        S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
          D.convex S.oppIndex1 radius
    · simpa [T, SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
        SurplusCapPacket.leftAdjacentCapByIndex,
        SurplusCapPacket.capByIndex, hs] using
        S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
          D.convex S.oppIndex1 radius
    · simpa [T, SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
        SurplusCapPacket.leftAdjacentCapByIndex,
        SurplusCapPacket.capByIndex, hs] using
        S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
          D.convex S.oppIndex1 radius
  have hcover :
      T \ I ⊆
        (T ∩ S.capByIndex S.surplusIdx) ∪
          (T ∩ S.capByIndex S.oppIndex2) := by
    have h :=
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
        S.oppIndex1 R.interior.frontier.radius_pos
    rcases hs : S.surplusIdx with ⟨i, hi⟩
    interval_cases i <;>
      simpa [T, I, SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
        SurplusCapPacket.leftAdjacentCapByIndex,
        SurplusCapPacket.rightAdjacentCapByIndex,
        SurplusCapPacket.capByIndex, hs, Finset.union_comm] using h
  have hsurplusPos : 0 < (T ∩ S.capByIndex S.surplusIdx).card := by
    by_contra hn
    have hz : (T ∩ S.capByIndex S.surplusIdx).card = 0 := by omega
    have hempty : T ∩ S.capByIndex S.surplusIdx = ∅ :=
      Finset.card_eq_zero.mp hz
    have hsub : T \ I ⊆ T ∩ S.capByIndex S.oppIndex2 := by
      intro x hx
      have hx' := hcover hx
      simpa [hempty] using hx'
    have := Finset.card_le_card hsub
    omega
  have hrestPos : 0 < (T ∩ S.capByIndex S.oppIndex2).card := by
    by_contra hn
    have hz : (T ∩ S.capByIndex S.oppIndex2).card = 0 := by omega
    have hempty : T ∩ S.capByIndex S.oppIndex2 = ∅ :=
      Finset.card_eq_zero.mp hz
    have hsub : T \ I ⊆ T ∩ S.capByIndex S.surplusIdx := by
      intro x hx
      have hx' := hcover hx
      simpa [hempty] using hx'
    have := Finset.card_le_card hsub
    omega
  obtain ⟨xS, hxS⟩ := Finset.card_pos.mp hsurplusPos
  obtain ⟨xR, hxR⟩ := Finset.card_pos.mp hrestPos
  exact ⟨xS, xR, (Finset.mem_inter.mp hxS).1,
    (Finset.mem_inter.mp hxS).2, (Finset.mem_inter.mp hxR).1,
    (Finset.mem_inter.mp hxR).2⟩

private theorem fin3_eq_of_ne_two {a b c d : Fin 3}
    (hab : a ≠ b) (hca : c ≠ a) (hcb : c ≠ b)
    (hda : d ≠ a) (hdb : d ≠ b) :
    c = d := by
  fin_cases a <;> fin_cases b <;> fin_cases c <;> fin_cases d <;>
    simp_all

/-- The exact-five residual produces the finite Census554 shell surface:
the selected cube at label `1` lies in the exact shell, and that shell is one
of the four canonical `{0/9, 2/3, 6, 7, 8}` cases. -/
theorem exists_card11SelectedCube_with_canonical_firstApex_exactFive_shell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F)
    (hcard : D.A.card = 11) :
    ∃ frame : MultiCenter.JointCapIndexFrame S.surplusIdx S.oppIndex1,
      ∃ L : Card11CapLabeling S.partition frame,
        ∃ C : Card11SelectedCube L,
          L.pointOf 6 = R.interior.frontier.pair.q ∧
          L.pointOf 7 = R.interior.frontier.pair.w ∧
          L.pointOf 8 =
            H.centerAt R.interior.frontier.pair.q
              R.interior.frontier.pair.q_mem_A ∧
          C.cube 1 ⊆
            L.toCard11Labeling.labelsOf
              (SelectedClass D.A S.oppApex1 radius) ∧
          (L.toCard11Labeling.labelsOf
              (SelectedClass D.A S.oppApex1 radius) =
                ({0, 2, 6, 7, 8} : Finset (Fin 11)) ∨
            L.toCard11Labeling.labelsOf
              (SelectedClass D.A S.oppApex1 radius) =
                ({9, 2, 6, 7, 8} : Finset (Fin 11)) ∨
            L.toCard11Labeling.labelsOf
              (SelectedClass D.A S.oppApex1 radius) =
                ({0, 3, 6, 7, 8} : Finset (Fin 11)) ∨
            L.toCard11Labeling.labelsOf
              (SelectedClass D.A S.oppApex1 radius) =
                ({9, 3, 6, 7, 8} : Finset (Fin 11))) := by
  obtain ⟨frame, L₀, h06, h07, h08⟩ :=
    exists_pointed_commonCenter_card11CapLabeling R hcard
  obtain ⟨xS, xR, hxST, hxSCap, hxRT, hxRCap⟩ :=
    exists_firstApex_exactFive_outer_points R hcard
  have hinter :
      3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card := by
    exact
      ATailUniqueRowProducerScratch.firstApex_cardFive_interior_card_ge_three
        D S R.interior.frontier.radius_pos R.class_card_eq_five
  have hIge : 3 ≤ (S.capInteriorByIndex S.oppIndex1).card :=
    hinter.trans (Finset.card_le_card Finset.inter_subset_right)
  have hcapAdd :
      (S.capInteriorByIndex S.oppIndex1).card + 2 =
        (S.capByIndex S.oppIndex1).card :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two S S.oppIndex1
  have hsecond5 : 5 ≤ (S.partition.capAt S.oppIndex1).card := by
    have hsecond5' : 5 ≤ (S.capByIndex S.oppIndex1).card := by omega
    rcases hi : S.oppIndex1 with ⟨i, hiLt⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.capByIndex, CapTriple.capAt, hi] using hsecond5'
  have hprofile :=
    capProfile_eq_554_of_card_eq_eleven
      S.triangleNonObtuse S.hCirc S.partition rfl
      (S.surplusIdx_ne_oppIndex1).symm S.surplus hsecond5 hcard
  have hrest : frame.rest = S.oppIndex2 := by
    exact
      fin3_eq_of_ne_two S.surplusIdx_ne_oppIndex1
        frame.rest_ne_surplus frame.rest_ne_second
        S.surplusIdx_ne_oppIndex2.symm S.oppIndex1_ne_oppIndex2.symm
  obtain ⟨a, haPoint⟩ :=
    L₀.carrier_surjective xS ((mem_selectedClass.mp hxST).1)
  obtain ⟨b, hbPoint⟩ :=
    L₀.carrier_surjective xR ((mem_selectedClass.mp hxRT).1)
  have hcenter₀ : L₀.pointOf 1 = S.oppApex1 := by
    rw [L₀.point_one]
    rcases hs : S.surplusIdx with ⟨i, hi⟩
    interval_cases i <;>
      simp [apexAt, SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppIndex1, hs]
  have hxSNe : xS ≠ S.oppApex1 := by
    intro h
    have hd := (mem_selectedClass.mp hxST).2
    rw [h, dist_self] at hd
    linarith [R.interior.frontier.radius_pos]
  have hxRNe : xR ≠ S.oppApex1 := by
    intro h
    have hd := (mem_selectedClass.mp hxRT).2
    rw [h, dist_self] at hd
    linarith [R.interior.frontier.radius_pos]
  have haLabels :
      a ∈ ({2} ∪ Card11Labeling.capSInteriorLabels :
        Finset (Fin 11)) := by
    have haCap :
        a ∈ L₀.toCard11Labeling.labelsOf
          (S.partition.capAt S.surplusIdx) := by
      apply (Card11Labeling.mem_labelsOf L₀.toCard11Labeling).mpr
      rw [← Card11SelectedCube.capByIndex_eq_capAt S]
      simpa only [haPoint] using hxSCap
    rw [L₀.labelsOf_surplusCap_eq_capS
      (S.surplusIdx_ne_oppIndex1).symm hprofile.1] at haCap
    have haNe : a ≠ 1 := by
      intro ha
      subst a
      apply hxSNe
      simpa [hcenter₀] using haPoint.symm
    simp [Census554.capS, Card11Labeling.capSInteriorLabels] at haCap ⊢
    aesop
  have hbLabels :
      b ∈ ({0} ∪ Card11Labeling.capO2InteriorLabels :
        Finset (Fin 11)) := by
    have hbCap :
        b ∈ L₀.toCard11Labeling.labelsOf
          (S.partition.capAt frame.rest) := by
      apply (Card11Labeling.mem_labelsOf L₀.toCard11Labeling).mpr
      rw [← Card11SelectedCube.capByIndex_eq_capAt S, hrest]
      simpa only [hbPoint] using hxRCap
    rw [L₀.labelsOf_restCap_eq_capO2
      (hprofile.2.2 frame.rest frame.rest_ne_surplus
        frame.rest_ne_second)] at hbCap
    have hbNe : b ≠ 1 := by
      intro hb
      subst b
      apply hxRNe
      simpa [hcenter₀] using hbPoint.symm
    simp [Census554.capO2, Card11Labeling.capO2InteriorLabels] at hbCap ⊢
    aesop
  obtain ⟨L, hSpos, hRpos, h6fix, h7fix, h8fix⟩ :=
    Card11CapLabeling.exists_canonical_outer_reindex L₀ haLabels hbLabels
  have h6 : L.pointOf 6 = R.interior.frontier.pair.q :=
    h6fix.trans h06
  have h7 : L.pointOf 7 = R.interior.frontier.pair.w :=
    h7fix.trans h07
  have h8 :
      L.pointOf 8 =
        H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A :=
    h8fix.trans h08
  let T : Finset ℝ² := SelectedClass D.A S.oppApex1 radius
  have hTsub : T ⊆ D.A := by
    intro x hx
    exact (mem_selectedClass.mp hx).1
  have hlabelsCard :
      (L.toCard11Labeling.labelsOf T).card = 5 := by
    rw [Card11Labeling.labelsOf_card_eq L.toCard11Labeling hTsub]
    simpa [T] using R.class_card_eq_five
  have hshell :
      L.toCard11Labeling.labelsOf T =
          ({0, 2, 6, 7, 8} : Finset (Fin 11)) ∨
        L.toCard11Labeling.labelsOf T =
          ({9, 2, 6, 7, 8} : Finset (Fin 11)) ∨
        L.toCard11Labeling.labelsOf T =
          ({0, 3, 6, 7, 8} : Finset (Fin 11)) ∨
        L.toCard11Labeling.labelsOf T =
          ({9, 3, 6, 7, 8} : Finset (Fin 11)) := by
    rcases hSpos with hS2 | hS3 <;> rcases hRpos with hR0 | hR9
    · left
      symm
      apply Finset.eq_of_subset_of_card_le
      · intro p hp
        simp only [Finset.mem_insert, Finset.mem_singleton] at hp
        rcases hp with rfl | rfl | rfl | rfl | rfl <;>
          apply (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
        · simpa only [T, hR0, hbPoint] using hxRT
        · simpa only [T, hS2, haPoint] using hxST
        · simpa [T, h6] using
            (Finset.mem_inter.mp R.interior.q_mem_interior).1
        · simpa [T, h7] using
            (Finset.mem_inter.mp R.interior.w_mem_interior).1
        · simpa [T, h8] using
            commonObstructionCenter_mem_firstApexSelectedClass_of_card_eq_eleven R hcard
      · simp [hlabelsCard]
    · right; left
      symm
      apply Finset.eq_of_subset_of_card_le
      · intro p hp
        simp only [Finset.mem_insert, Finset.mem_singleton] at hp
        rcases hp with rfl | rfl | rfl | rfl | rfl <;>
          apply (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
        · simpa only [T, hR9, hbPoint] using hxRT
        · simpa only [T, hS2, haPoint] using hxST
        · simpa [T, h6] using
            (Finset.mem_inter.mp R.interior.q_mem_interior).1
        · simpa [T, h7] using
            (Finset.mem_inter.mp R.interior.w_mem_interior).1
        · simpa [T, h8] using
            commonObstructionCenter_mem_firstApexSelectedClass_of_card_eq_eleven R hcard
      · simp [hlabelsCard]
    · right; right; left
      symm
      apply Finset.eq_of_subset_of_card_le
      · intro p hp
        simp only [Finset.mem_insert, Finset.mem_singleton] at hp
        rcases hp with rfl | rfl | rfl | rfl | rfl <;>
          apply (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
        · simpa only [T, hR0, hbPoint] using hxRT
        · simpa only [T, hS3, haPoint] using hxST
        · simpa [T, h6] using
            (Finset.mem_inter.mp R.interior.q_mem_interior).1
        · simpa [T, h7] using
            (Finset.mem_inter.mp R.interior.w_mem_interior).1
        · simpa [T, h8] using
            commonObstructionCenter_mem_firstApexSelectedClass_of_card_eq_eleven R hcard
      · simp [hlabelsCard]
    · right; right; right
      symm
      apply Finset.eq_of_subset_of_card_le
      · intro p hp
        simp only [Finset.mem_insert, Finset.mem_singleton] at hp
        rcases hp with rfl | rfl | rfl | rfl | rfl <;>
          apply (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
        · simpa only [T, hR9, hbPoint] using hxRT
        · simpa only [T, hS3, haPoint] using hxST
        · simpa [T, h6] using
            (Finset.mem_inter.mp R.interior.q_mem_interior).1
        · simpa [T, h7] using
            (Finset.mem_inter.mp R.interior.w_mem_interior).1
        · simpa [T, h8] using
            commonObstructionCenter_mem_firstApexSelectedClass_of_card_eq_eleven R hcard
      · simp [hlabelsCard]
  let C : Card11SelectedCube L :=
    Card11SelectedCube.ofGlobalK4 L D.K4
  have hcenter : L.pointOf 1 = S.oppApex1 := by
    rw [L.point_one]
    rcases hs : S.surplusIdx with ⟨i, hi⟩
    interval_cases i <;>
      simp [apexAt, SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppIndex1, hs]
  have hcubeSub :
      C.cube 1 ⊆ L.toCard11Labeling.labelsOf T := by
    intro p hp
    apply (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
    have hpSupport : L.pointOf p ∈ (C.classAt 1).support :=
      (C.mem_cube_iff).mp hp
    have hsupportSub :
        (C.classAt 1).support ⊆
          SelectedClass D.A S.oppApex1 (C.classAt 1).radius := by
      intro x hx
      rw [mem_selectedClass]
      exact ⟨(C.classAt 1).support_subset_A hx,
        by simpa [hcenter] using (C.classAt 1).support_eq_radius x hx⟩
    have hfour :
        4 ≤ (SelectedClass D.A S.oppApex1 (C.classAt 1).radius).card := by
      simpa [(C.classAt 1).support_card] using
        Finset.card_le_card hsupportSub
    have hradius :
        (C.classAt 1).radius = radius :=
      R.unique_fourClass_radius (C.classAt 1).radius
        (C.classAt 1).radius_pos hfour
    rw [show T = SelectedClass D.A S.oppApex1 radius by rfl,
      mem_selectedClass]
    exact ⟨(C.classAt 1).support_subset_A hpSupport,
      by simpa [hcenter, hradius] using
        (C.classAt 1).support_eq_radius (L.pointOf p) hpSupport⟩
  refine ⟨frame, L, C, h6, h7, h8, ?_, ?_⟩
  · simpa [T] using hcubeSub
  · simpa [T] using hshell

end ATailFiniteN11ExactFiveCommonShellAdapter
end Problem97
