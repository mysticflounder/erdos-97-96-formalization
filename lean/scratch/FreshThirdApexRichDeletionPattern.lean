import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceClosure

/-!
# FreshThird apex-rich deletion provenance

Scratch verification of the source-faithful S6/D44 information that survives
the oriented deletion in the live six-center FreshThird boundary.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open EuclideanGeometry
open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

/-- Two radius classes about distinct centers have at most two common points.

This is the generic two-circle constraint needed when all three surviving rich
classes come from Moser apices, rather than one of the circles being a
canonical critical shell. -/
theorem selectedClass_inter_selectedClass_card_le_two_of_centers_ne
    {A : Finset ℝ²} {p q : ℝ²} {r s : ℝ}
    (hpq : p ≠ q) :
    ((SelectedClass A p r) ∩ SelectedClass A q s).card ≤ 2 := by
  classical
  by_contra hle
  have hthree :
      3 ≤ ((SelectedClass A p r) ∩ SelectedClass A q s).card := by
    omega
  rcases Finset.exists_subset_card_eq
      (s := (SelectedClass A p r) ∩ SelectedClass A q s) hthree with
    ⟨E, hEsubset, hEcard⟩
  rw [Finset.card_eq_three] at hEcard
  rcases hEcard with ⟨a, b, c, hab, hac, hbc, hEeq⟩
  have haE : a ∈ E := by simp [hEeq]
  have hbE : b ∈ E := by simp [hEeq]
  have hcE : c ∈ E := by simp [hEeq]
  have haP : a ∈ SelectedClass A p r :=
    (Finset.mem_inter.mp (hEsubset haE)).1
  have hbP : b ∈ SelectedClass A p r :=
    (Finset.mem_inter.mp (hEsubset hbE)).1
  have hcP : c ∈ SelectedClass A p r :=
    (Finset.mem_inter.mp (hEsubset hcE)).1
  have haQ : a ∈ SelectedClass A q s :=
    (Finset.mem_inter.mp (hEsubset haE)).2
  have hbQ : b ∈ SelectedClass A q s :=
    (Finset.mem_inter.mp (hEsubset hbE)).2
  have hcQ : c ∈ SelectedClass A q s :=
    (Finset.mem_inter.mp (hEsubset hcE)).2
  let pSphere : Sphere ℝ² := ⟨p, r⟩
  let qSphere : Sphere ℝ² := ⟨q, s⟩
  have hspheres : pSphere ≠ qSphere := by
    intro h
    exact hpq (congrArg (fun sphere : Sphere ℝ² => sphere.1) h)
  have haPSphere : a ∈ pSphere := by
    rw [mem_sphere]
    exact dist_self_of_mem_selectedClass haP
  have hbPSphere : b ∈ pSphere := by
    rw [mem_sphere]
    exact dist_self_of_mem_selectedClass hbP
  have hcPSphere : c ∈ pSphere := by
    rw [mem_sphere]
    exact dist_self_of_mem_selectedClass hcP
  have haQSphere : a ∈ qSphere := by
    rw [mem_sphere]
    exact dist_self_of_mem_selectedClass haQ
  have hbQSphere : b ∈ qSphere := by
    rw [mem_sphere]
    exact dist_self_of_mem_selectedClass hbQ
  have hcQSphere : c ∈ qSphere := by
    rw [mem_sphere]
    exact dist_self_of_mem_selectedClass hcQ
  rcases two_circle_common_point_eq_endpoint hspheres hab
      haPSphere hbPSphere haQSphere hbQSphere hcPSphere hcQSphere with hca | hcb
  · exact hac hca.symm
  · exact hbc hcb.symm

/-- Erasing a point outside a fixed region does not change the part of any
selected radius class lying in that region. -/
theorem selectedClass_erase_inter_card_eq_of_not_mem
    {A : Finset ℝ²} {deleted center : ℝ²} {r : ℝ}
    {region : Finset ℝ²} (hdeleted : deleted ∉ region) :
    (SelectedClass (A.erase deleted) center r ∩ region).card =
      (SelectedClass A center r ∩ region).card := by
  apply congrArg Finset.card
  rw [selectedClass_erase_eq]
  ext x
  simp only [Finset.mem_inter, Finset.mem_erase]
  constructor
  · rintro ⟨⟨_, hxClass⟩, hxRegion⟩
    exact ⟨hxClass, hxRegion⟩
  · rintro ⟨hxClass, hxRegion⟩
    exact ⟨⟨fun hxeq => hdeleted (hxeq ▸ hxRegion), hxClass⟩, hxRegion⟩

/-- S6/D44 cap-interior provenance after deleting a point from a different
indexed cap.  Unlike generic deletion robustness, this keeps both the radius
labels and the exact opposite-cap incidence. -/
def OppositeCapRichDeletionInteriorPattern
    (A : Finset ℝ²) (S : SurplusCapPacket A) (i : Fin 3)
    (deleted : ℝ²) : Prop :=
  (∃ r : ℝ, 0 < r ∧
      4 ≤ (SelectedClass (A.erase deleted)
        (S.oppositeVertexByIndex i) r ∩ S.capInteriorByIndex i).card) ∨
    (∃ r₁ r₂ : ℝ, 0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
      2 ≤ (SelectedClass (A.erase deleted)
        (S.oppositeVertexByIndex i) r₁ ∩ S.capInteriorByIndex i).card ∧
      2 ≤ (SelectedClass (A.erase deleted)
        (S.oppositeVertexByIndex i) r₂ ∩ S.capInteriorByIndex i).card)

theorem oppositeCapRichDeletionInteriorPattern_of_otherCapDeletion
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    {i j : Fin 3} {deleted : ℝ²}
    (hdeleted : deleted ∈ S.capInteriorByIndex j) (hji : j ≠ i)
    (hrich : ApexRichClassStructure A (S.oppositeVertexByIndex i)) :
    OppositeCapRichDeletionInteriorPattern A S i deleted := by
  have hdeletedCap : deleted ∉ S.capByIndex i :=
    S.capInteriorByIndex_not_mem_capByIndex_of_ne hdeleted hji
  have hdeletedInterior : deleted ∉ S.capInteriorByIndex i := by
    intro hmem
    exact hdeletedCap (S.capInteriorByIndex_subset_capByIndex i hmem)
  rcases oppositeCapRichClassInteriorPattern_of_apexRichClassStructure
      S hconv i hrich with ⟨r, hr, hcard⟩ |
        ⟨r₁, r₂, hr₁, hr₂, hradii, hcard₁, hcard₂⟩
  · left
    refine ⟨r, hr, ?_⟩
    rwa [selectedClass_erase_inter_card_eq_of_not_mem hdeletedInterior]
  · right
    refine ⟨r₁, r₂, hr₁, hr₂, hradii, ?_, ?_⟩
    · rwa [selectedClass_erase_inter_card_eq_of_not_mem hdeletedInterior]
    · rwa [selectedClass_erase_inter_card_eq_of_not_mem hdeletedInterior]

/-- Coupled S6/D44 provenance after a deletion from another cap.  In the S6
arm the same radius has five surviving carrier points and four surviving
strict-cap points.  In the D44 arm both two-point strict-cap slices survive,
and at least one of their two full four-point radius classes survives intact. -/
def OppositeCapRichDeletionCoupledPattern
    (A : Finset ℝ²) (S : SurplusCapPacket A) (i : Fin 3)
    (deleted : ℝ²) : Prop :=
  (∃ r : ℝ, 0 < r ∧
      5 ≤ (SelectedClass (A.erase deleted)
        (S.oppositeVertexByIndex i) r).card ∧
      4 ≤ (SelectedClass (A.erase deleted)
        (S.oppositeVertexByIndex i) r ∩ S.capInteriorByIndex i).card) ∨
    (∃ r₁ r₂ : ℝ, 0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
      2 ≤ (SelectedClass (A.erase deleted)
        (S.oppositeVertexByIndex i) r₁ ∩ S.capInteriorByIndex i).card ∧
      2 ≤ (SelectedClass (A.erase deleted)
        (S.oppositeVertexByIndex i) r₂ ∩ S.capInteriorByIndex i).card ∧
      (4 ≤ (SelectedClass (A.erase deleted)
          (S.oppositeVertexByIndex i) r₁).card ∨
        4 ≤ (SelectedClass (A.erase deleted)
          (S.oppositeVertexByIndex i) r₂).card))

theorem oppositeCapRichDeletionCoupledPattern_of_otherCapDeletion
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    {i j : Fin 3} {deleted : ℝ²}
    (hdeleted : deleted ∈ S.capInteriorByIndex j) (hji : j ≠ i)
    (hrich : ApexRichClassStructure A (S.oppositeVertexByIndex i)) :
    OppositeCapRichDeletionCoupledPattern A S i deleted := by
  have hdeletedCap : deleted ∉ S.capByIndex i :=
    S.capInteriorByIndex_not_mem_capByIndex_of_ne hdeleted hji
  have hdeletedInterior : deleted ∉ S.capInteriorByIndex i := by
    intro hmem
    exact hdeletedCap (S.capInteriorByIndex_subset_capByIndex i hmem)
  rcases hrich with ⟨r, hr, hsix⟩ |
      ⟨r₁, r₂, hr₁, hr₂, hradii, hfour₁, hfour₂⟩
  · left
    refine ⟨r, hr, selectedClass_erase_card_ge_of_succ_le hsix, ?_⟩
    have hinterior :=
      S.selectedClass_capInteriorByIndex_card_ge_card_sub_two hconv i hr
    rw [selectedClass_erase_inter_card_eq_of_not_mem hdeletedInterior]
    omega
  · right
    have hinterior₁ :=
      S.selectedClass_capInteriorByIndex_card_ge_two hconv i hr₁ hfour₁
    have hinterior₂ :=
      S.selectedClass_capInteriorByIndex_card_ge_two hconv i hr₂ hfour₂
    refine ⟨r₁, r₂, hr₁, hr₂, hradii, ?_, ?_, ?_⟩
    · rwa [selectedClass_erase_inter_card_eq_of_not_mem hdeletedInterior]
    · rwa [selectedClass_erase_inter_card_eq_of_not_mem hdeletedInterior]
    · by_cases hdeleted₁ :
          deleted ∈ SelectedClass A (S.oppositeVertexByIndex i) r₁
      · right
        have hdeleted₂ :
            deleted ∉ SelectedClass A (S.oppositeVertexByIndex i) r₂ := by
          intro hmem
          apply hradii
          exact (mem_selectedClass.mp hdeleted₁).2.symm.trans
            (mem_selectedClass.mp hmem).2
        rwa [selectedClass_erase_card_eq_of_not_mem hdeleted₂]
      · left
        rwa [selectedClass_erase_card_eq_of_not_mem hdeleted₁]

/-- Radius-provenance-preserving form of rich-apex deletion survival.

In the S6 arm, deleting one point leaves five points at the same radius.  In
the D44 arm, the deleted point cannot lie on both distinct concentric circles,
so one of the two four-point classes survives intact. -/
def ApexRichDeletionPattern
    (A : Finset ℝ²) (deleted apex : ℝ²) : Prop :=
  (∃ r : ℝ, 0 < r ∧
      5 ≤ (SelectedClass (A.erase deleted) apex r).card) ∨
    (∃ r₁ r₂ : ℝ, 0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
      (4 ≤ (SelectedClass (A.erase deleted) apex r₁).card ∨
        4 ≤ (SelectedClass (A.erase deleted) apex r₂).card))

theorem apexRichDeletionPattern_of_apexRichClassStructure
    {A : Finset ℝ²} {deleted apex : ℝ²}
    (hrich : ApexRichClassStructure A apex) :
    ApexRichDeletionPattern A deleted apex := by
  rcases hrich with
      ⟨r, hr, hsix⟩ | ⟨r₁, r₂, hr₁, hr₂, hradiiNe, hfour₁, hfour₂⟩
  · exact Or.inl
      ⟨r, hr, selectedClass_erase_card_ge_of_succ_le hsix⟩
  · refine Or.inr ⟨r₁, r₂, hr₁, hr₂, hradiiNe, ?_⟩
    by_cases hdeleted₁ : deleted ∈ SelectedClass A apex r₁
    · right
      have hdeleted₂ : deleted ∉ SelectedClass A apex r₂ := by
        intro h
        apply hradiiNe
        exact (mem_selectedClass.mp hdeleted₁).2.symm.trans
          (mem_selectedClass.mp h).2
      rw [selectedClass_erase_card_eq_of_not_mem hdeleted₂]
      exact hfour₂
    · left
      rw [selectedClass_erase_card_eq_of_not_mem hdeleted₁]
      exact hfour₁

/-- The three rich Moser apices retain their S6/D44 provenance after one
common deletion. -/
def TriApexRichDeletionPattern
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (deleted : ℝ²) : Prop :=
  ApexRichDeletionPattern D.A deleted S.oppApex1 ∧
    ApexRichDeletionPattern D.A deleted S.oppApex2 ∧
    ApexRichDeletionPattern D.A deleted S.surplusApex

theorem triApexRichDeletionPattern_of_residual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (deleted : ℝ²) :
    TriApexRichDeletionPattern S deleted := by
  exact
    ⟨apexRichDeletionPattern_of_apexRichClassStructure T.oppApex1_rich,
      apexRichDeletionPattern_of_apexRichClassStructure T.oppApex2_rich,
      apexRichDeletionPattern_of_apexRichClassStructure T.surplusApex_rich⟩

/-- The two cap-interior-rich apex patterns wholly outside the first opposite
cap survive a deletion from that first cap without any loss. -/
def OffFirstCapRichDeletionInteriorPattern
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (deleted : ℝ²) : Prop :=
  OppositeCapRichDeletionInteriorPattern D.A S S.oppIndex2 deleted ∧
    OppositeCapRichDeletionInteriorPattern D.A S S.surplusIdx deleted

theorem offFirstCapRichDeletionInteriorPattern_of_residual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    {deleted : ℝ²}
    (hdeleted : deleted ∈ S.capInteriorByIndex S.oppIndex1) :
    OffFirstCapRichDeletionInteriorPattern S deleted := by
  constructor
  · apply oppositeCapRichDeletionInteriorPattern_of_otherCapDeletion
      S D.convex hdeleted S.oppIndex1_ne_oppIndex2
    simpa only [oppositeVertexByIndex_oppIndex2] using T.oppApex2_rich
  · apply oppositeCapRichDeletionInteriorPattern_of_otherCapDeletion
      S D.convex hdeleted S.surplusIdx_ne_oppIndex1.symm
    simpa only [oppositeVertexByIndex_surplusIdx] using T.surplusApex_rich

/-- Coupled full-class/cap-slice provenance at both apices outside the first
opposite cap. -/
def OffFirstCapRichDeletionCoupledPattern
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (deleted : ℝ²) : Prop :=
  OppositeCapRichDeletionCoupledPattern D.A S S.oppIndex2 deleted ∧
    OppositeCapRichDeletionCoupledPattern D.A S S.surplusIdx deleted

theorem offFirstCapRichDeletionCoupledPattern_of_residual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    {deleted : ℝ²}
    (hdeleted : deleted ∈ S.capInteriorByIndex S.oppIndex1) :
    OffFirstCapRichDeletionCoupledPattern S deleted := by
  constructor
  · apply oppositeCapRichDeletionCoupledPattern_of_otherCapDeletion
      S D.convex hdeleted S.oppIndex1_ne_oppIndex2
    simpa only [oppositeVertexByIndex_oppIndex2] using T.oppApex2_rich
  · apply oppositeCapRichDeletionCoupledPattern_of_otherCapDeletion
      S D.convex hdeleted S.surplusIdx_ne_oppIndex1.symm
    simpa only [oppositeVertexByIndex_surplusIdx] using T.surplusApex_rich

namespace TwoSourceExactCollisionRowsTerminal

section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)

/-- The exact six-center boundary, retaining which source was deleted and the
S6/D44 provenance that survives at all three apex centers. -/
abbrev TwoCapSourcesSixCenterRichExactRowsBoundary
    (source source' : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  (SixCenterDeletionExactRowsBoundary (H := H) source'
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex
        (H.centerAt source.1 source.2) ∧
      TriApexRichDeletionPattern S source'.1) ∨
    (SixCenterDeletionExactRowsBoundary (H := H) source
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex
        (H.centerAt source'.1 source'.2) ∧
      TriApexRichDeletionPattern S source.1)

/-- Source-clean upgrade of the live exact-row boundary.  This adds no finite
carrier bound and does not choose an exact-five route: it only preserves the
original rich-apex constructor through the already chosen deletion. -/
theorem twoCapSourcesSixCenterRichExactRowsBoundary_of_boundary
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hboundary :
      TwoCapSourcesSixCenterExactRowsBoundary
        (H := H) P Pρ source source') :
    TwoCapSourcesSixCenterRichExactRowsBoundary
      (H := H) P Pρ source source' := by
  rcases hboundary with hleft | hright
  · exact Or.inl
      ⟨hleft, triApexRichDeletionPattern_of_residual T source'.1⟩
  · exact Or.inr
      ⟨hright, triApexRichDeletionPattern_of_residual T source.1⟩

/-- Strongest source-clean scratch normalization currently available for the
six-center constructor: besides exact rows and surviving S6/D44 radii, it
records that the cap-interior witnesses at the other two apices survive the
first-cap deletion unchanged. -/
abbrev TwoCapSourcesSixCenterCapRichExactRowsBoundary
    (source source' : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  (SixCenterDeletionExactRowsBoundary (H := H) source'
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex
        (H.centerAt source.1 source.2) ∧
      TriApexRichDeletionPattern S source'.1 ∧
      OffFirstCapRichDeletionCoupledPattern S source'.1) ∨
    (SixCenterDeletionExactRowsBoundary (H := H) source
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex
        (H.centerAt source'.1 source'.2) ∧
      TriApexRichDeletionPattern S source.1 ∧
      OffFirstCapRichDeletionCoupledPattern S source.1)

theorem twoCapSourcesSixCenterCapRichExactRowsBoundary_of_boundary
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsource : source.1 ∈ S.capInteriorByIndex S.oppIndex1)
    (hsource' : source'.1 ∈ S.capInteriorByIndex S.oppIndex1)
    (hboundary :
      TwoCapSourcesSixCenterExactRowsBoundary
        (H := H) P Pρ source source') :
    TwoCapSourcesSixCenterCapRichExactRowsBoundary
      (H := H) P Pρ source source' := by
  rcases hboundary with hleft | hright
  · exact Or.inl
      ⟨hleft, triApexRichDeletionPattern_of_residual T source'.1,
        offFirstCapRichDeletionCoupledPattern_of_residual T hsource'⟩
  · exact Or.inr
      ⟨hright, triApexRichDeletionPattern_of_residual T source.1,
        offFirstCapRichDeletionCoupledPattern_of_residual T hsource⟩

end

end TwoSourceExactCollisionRowsTerminal

end ATailFrontierLiveClosure
end Problem97
