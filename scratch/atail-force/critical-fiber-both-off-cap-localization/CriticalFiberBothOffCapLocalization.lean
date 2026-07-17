/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FirstApexCriticalFiber
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Cap localization of the both-off critical fiber

This scratch module starts from the source-faithful critical fiber forced by
a frontier common-deletion parent and the honest residual in which both
critical sources miss the retained first-apex radius class.

The common blocker is split by the full Moser cap partition.  At a Moser
vertex it is an endpoint of an adjacent ordered cap, which sharpens the usual
two-hit cap bound to one.  In a strict cap interior the usual two-hit bound is
sharp.  The resulting alternatives retain both named critical sources and
their common exact shell; no anonymous selected-row consequence is reported
as collision progress.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCriticalFiberBothOffCapLocalizationScratch

open ATailCriticalPairFrontier
open ATailFirstApexCriticalFiber
open ATailOrientedPhysicalApexIngress

attribute [local instance] Classical.propDecidable

private def transportSelectedFourClass
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    SelectedFourClass A center₂ :=
  Eq.mp (congrArg (SelectedFourClass A) hcenter) K

@[simp] private theorem transportSelectedFourClass_support
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    (transportSelectedFourClass K hcenter).support = K.support := by
  cases hcenter
  rfl

/-- The exact production critical fiber together with the honest `bothOff`
alternative of the first-apex row-hit audit. -/
structure CriticalFiberBothOff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type where
  fiber : FrontierCommonDeletionCriticalFiber R
  source₁_off_firstApexClass :
    fiber.source₁.1 ∉ SelectedClass D.A S.oppApex1 radius
  source₂_off_firstApexClass :
    fiber.source₂.1 ∉ SelectedClass D.A S.oppApex1 radius

namespace CriticalFiberBothOff

/-- The common actual blocker of the two named critical sources. -/
def commonBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : CriticalFiberBothOff R) : ℝ² :=
  H.centerAt B.fiber.source₁.1 B.fiber.source₁.2

/-- The exact common four-point support, named at the first source. -/
def commonSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : CriticalFiberBothOff R) : Finset ℝ² :=
  (H.selectedAt B.fiber.source₁.1 B.fiber.source₁.2).toCriticalFourShell.support

theorem commonSupport_card
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : CriticalFiberBothOff R) :
    B.commonSupport.card = 4 :=
  B.fiber.commonSupport_card_eq_four

theorem source₁_mem_commonSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : CriticalFiberBothOff R) :
    B.fiber.source₁.1 ∈ B.commonSupport :=
  (H.selectedAt B.fiber.source₁.1 B.fiber.source₁.2).toCriticalFourShell.q_mem_support

theorem source₂_mem_commonSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : CriticalFiberBothOff R) :
    B.fiber.source₂.1 ∈ B.commonSupport :=
  B.fiber.source₂_mem_commonSupport

theorem commonBlocker_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : CriticalFiberBothOff R) :
    B.commonBlocker ∈ D.A :=
  B.fiber.commonBlocker_mem_A

/-- The `bothOff` hypotheses are genuine metric information: neither named
source has the retained first-apex radius. -/
theorem source₁_firstApex_dist_ne_radius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : CriticalFiberBothOff R) :
    dist S.oppApex1 B.fiber.source₁.1 ≠ radius := by
  intro hdist
  apply B.source₁_off_firstApexClass
  exact mem_selectedClass.mpr ⟨B.fiber.source₁.2, hdist⟩

theorem source₂_firstApex_dist_ne_radius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : CriticalFiberBothOff R) :
    dist S.oppApex1 B.fiber.source₂.1 ≠ radius := by
  intro hdist
  apply B.source₂_off_firstApexClass
  exact mem_selectedClass.mpr ⟨B.fiber.source₂.2, hdist⟩

end CriticalFiberBothOff

private theorem selectedFourClass_inter_cap_card_le_one_of_center_endpoint
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (i : Fin 3) {center : ℝ²} (K : SelectedFourClass D.A center)
    (hendpoint :
      center = (S.triangleByIndex i).v2 ∨
        center = (S.triangleByIndex i).v3) :
    (K.support ∩ S.capByIndex i).card ≤ 1 := by
  rcases S.capByIndex_cgn4g_capData_oriented D.convex i with
    ⟨m, L, Packet, Hside, Hord, hcap, horient⟩
  rcases hendpoint with hcenter | hcenter <;>
    rcases horient with horient | horient
  · have htransport : center = L.points (CGN.firstIndex Packet.hm) :=
      hcenter.trans horient.1.symm
    let K' : SelectedFourClass D.A
        (L.points (CGN.firstIndex Packet.hm)) :=
      transportSelectedFourClass K htransport
    have hbound :=
      CapSelectedRowCounting.selectedFourClass_inter_orderedCap_first_card_le_one
        Packet Hside Hord K'
    simpa [K', hcap] using hbound
  · have htransport : center = L.points (CGN.lastIndex Packet.hm) :=
      hcenter.trans horient.2.symm
    let K' : SelectedFourClass D.A
        (L.points (CGN.lastIndex Packet.hm)) :=
      transportSelectedFourClass K htransport
    have hbound :=
      CapSelectedRowCounting.selectedFourClass_inter_orderedCap_last_card_le_one
        Packet Hside Hord K'
    simpa [K', hcap] using hbound
  · have htransport : center = L.points (CGN.lastIndex Packet.hm) :=
      hcenter.trans horient.2.symm
    let K' : SelectedFourClass D.A
        (L.points (CGN.lastIndex Packet.hm)) :=
      transportSelectedFourClass K htransport
    have hbound :=
      CapSelectedRowCounting.selectedFourClass_inter_orderedCap_last_card_le_one
        Packet Hside Hord K'
    simpa [K', hcap] using hbound
  · have htransport : center = L.points (CGN.firstIndex Packet.hm) :=
      hcenter.trans horient.1.symm
    let K' : SelectedFourClass D.A
        (L.points (CGN.firstIndex Packet.hm)) :=
      transportSelectedFourClass K htransport
    have hbound :=
      CapSelectedRowCounting.selectedFourClass_inter_orderedCap_first_card_le_one
        Packet Hside Hord K'
    simpa [K', hcap] using hbound

private theorem commonSupport_inter_cap_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : CriticalFiberBothOff R) (i : Fin 3)
    (hcenter : B.commonBlocker ∈ S.capByIndex i) :
    (B.commonSupport ∩ S.capByIndex i).card ≤ 2 := by
  let K : SelectedFourClass D.A B.commonBlocker :=
    (H.selectedAt B.fiber.source₁.1 B.fiber.source₁.2).toSelectedFourClass
  simpa [K, CriticalFiberBothOff.commonSupport,
    CriticalSelectedFourClass.toSelectedFourClass,
    CriticalFourShell.toSelectedFourClass] using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex i K hcenter

private theorem commonSupport_inter_cap_eq_sources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : CriticalFiberBothOff R) (i : Fin 3)
    (hcenter : B.commonBlocker ∈ S.capByIndex i)
    (hsource₁ : B.fiber.source₁.1 ∈ S.capByIndex i)
    (hsource₂ : B.fiber.source₂.1 ∈ S.capByIndex i) :
    B.commonSupport ∩ S.capByIndex i =
      ({B.fiber.source₁.1, B.fiber.source₂.1} : Finset ℝ²) := by
  symm
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_inter.mpr ⟨B.source₁_mem_commonSupport, hsource₁⟩
    · have hxSource₂ : x = B.fiber.source₂.1 := Finset.mem_singleton.mp hx
      subst x
      exact Finset.mem_inter.mpr ⟨B.source₂_mem_commonSupport, hsource₂⟩
  · have hcap := commonSupport_inter_cap_card_le_two B i hcenter
    simpa [B.fiber.source_points_ne] using hcap

/-- Endpoint-blocker localization.  The cap-side shell has at most one point,
so the two distinct named collision sources cannot both lie there. -/
structure TriangleBlockerLocalization
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : CriticalFiberBothOff R) : Type where
  capIndex : Fin 3
  commonBlocker_is_endpoint :
    B.commonBlocker = (S.triangleByIndex capIndex).v2 ∨
      B.commonBlocker = (S.triangleByIndex capIndex).v3
  commonSupport_inter_cap_card_le_one :
    (B.commonSupport ∩ S.capByIndex capIndex).card ≤ 1
  three_le_commonSupport_outside_cap :
    3 ≤ (B.commonSupport \ S.capByIndex capIndex).card
  collision_source_outside_cap :
    B.fiber.source₁.1 ∉ S.capByIndex capIndex ∨
      B.fiber.source₂.1 ∉ S.capByIndex capIndex
  source₁_off_firstApexClass :
    B.fiber.source₁.1 ∉ SelectedClass D.A S.oppApex1 radius
  source₂_off_firstApexClass :
    B.fiber.source₂.1 ∉ SelectedClass D.A S.oppApex1 radius

/-- A Moser-vertex blocker is an endpoint of both adjacent caps.  The sharp
one-hit localization is therefore available simultaneously on two distinct
cap indices. -/
structure TriangleBlockerTwoCapLocalization
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : CriticalFiberBothOff R) : Type where
  first : TriangleBlockerLocalization B
  second : TriangleBlockerLocalization B
  capIndices_ne : first.capIndex ≠ second.capIndex

/-- Interior-blocker localization.  Either one named collision source is
outside the blocker's unique cap, or the two named sources exactly exhaust
the cap-side part of the common exact shell. -/
structure InteriorBlockerLocalization
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : CriticalFiberBothOff R) : Type where
  capIndex : Fin 3
  commonBlocker_mem_capInterior :
    B.commonBlocker ∈ S.capInteriorByIndex capIndex
  commonSupport_inter_cap_card_le_two :
    (B.commonSupport ∩ S.capByIndex capIndex).card ≤ 2
  two_le_commonSupport_outside_cap :
    2 ≤ (B.commonSupport \ S.capByIndex capIndex).card
  collision_source_role :
    B.fiber.source₁.1 ∉ S.capByIndex capIndex ∨
      B.fiber.source₂.1 ∉ S.capByIndex capIndex ∨
      ((B.fiber.source₁.1 ∈ S.capByIndex capIndex ∧
          B.fiber.source₂.1 ∈ S.capByIndex capIndex) ∧
        B.commonSupport ∩ S.capByIndex capIndex =
          ({B.fiber.source₁.1, B.fiber.source₂.1} : Finset ℝ²))
  source₁_off_firstApexClass :
    B.fiber.source₁.1 ∉ SelectedClass D.A S.oppApex1 radius
  source₂_off_firstApexClass :
    B.fiber.source₂.1 ∉ SelectedClass D.A S.oppApex1 radius

/-- Exhaustive full-cap localization of the honest both-off arm. -/
inductive CriticalFiberBothOffCapOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : CriticalFiberBothOff R) : Type
  | triangleBlocker (localization : TriangleBlockerTwoCapLocalization B)
  | interiorBlocker (localization : InteriorBlockerLocalization B)

private theorem nonempty_triangleBlockerLocalization_of_endpoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : CriticalFiberBothOff R) (i : Fin 3)
    (hendpoint :
      B.commonBlocker = (S.triangleByIndex i).v2 ∨
        B.commonBlocker = (S.triangleByIndex i).v3) :
    ∃ localization : TriangleBlockerLocalization B,
      localization.capIndex = i := by
  have hone : (B.commonSupport ∩ S.capByIndex i).card ≤ 1 := by
    let K : SelectedFourClass D.A B.commonBlocker :=
      (H.selectedAt B.fiber.source₁.1 B.fiber.source₁.2).toSelectedFourClass
    simpa [K, CriticalFiberBothOff.commonSupport,
      CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass] using
      selectedFourClass_inter_cap_card_le_one_of_center_endpoint
        S i K hendpoint
  have hthree : 3 ≤ (B.commonSupport \ S.capByIndex i).card := by
    have hsplit := Finset.card_sdiff_add_card_inter
      B.commonSupport (S.capByIndex i)
    have hfour := B.commonSupport_card
    omega
  have houtside :
      B.fiber.source₁.1 ∉ S.capByIndex i ∨
        B.fiber.source₂.1 ∉ S.capByIndex i := by
    by_contra hnot
    push_neg at hnot
    have hsub :
        ({B.fiber.source₁.1, B.fiber.source₂.1} : Finset ℝ²) ⊆
          B.commonSupport ∩ S.capByIndex i := by
      intro x hx
      rcases Finset.mem_insert.mp hx with rfl | hx
      · exact Finset.mem_inter.mpr ⟨B.source₁_mem_commonSupport, hnot.1⟩
      · have hxSource₂ : x = B.fiber.source₂.1 :=
          Finset.mem_singleton.mp hx
        subst x
        exact Finset.mem_inter.mpr ⟨B.source₂_mem_commonSupport, hnot.2⟩
    have htwo : 2 ≤ (B.commonSupport ∩ S.capByIndex i).card := by
      have hcard := Finset.card_le_card hsub
      simpa [B.fiber.source_points_ne] using hcard
    omega
  exact ⟨{
    capIndex := i
    commonBlocker_is_endpoint := hendpoint
    commonSupport_inter_cap_card_le_one := hone
    three_le_commonSupport_outside_cap := hthree
    collision_source_outside_cap := houtside
    source₁_off_firstApexClass := B.source₁_off_firstApexClass
    source₂_off_firstApexClass := B.source₂_off_firstApexClass }, rfl⟩

private theorem nonempty_triangleBlockerLocalization
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : CriticalFiberBothOff R)
    (htriangle : B.commonBlocker ∈ S.triangle.verts) :
    Nonempty (TriangleBlockerTwoCapLocalization B) := by
  rcases S.mem_triangle_verts_cases htriangle with h | h | h
  · rcases nonempty_triangleBlockerLocalization_of_endpoint B 1
        (Or.inr (by
          simpa [SurplusCapPacket.triangleByIndex] using h)) with
      ⟨first, hfirst⟩
    rcases nonempty_triangleBlockerLocalization_of_endpoint B 2
        (Or.inl (by
          simpa [SurplusCapPacket.triangleByIndex] using h)) with
      ⟨second, hsecond⟩
    exact ⟨⟨first, second, by
      rw [hfirst, hsecond]
      decide⟩⟩
  · rcases nonempty_triangleBlockerLocalization_of_endpoint B 0
        (Or.inl (by
          simpa [SurplusCapPacket.triangleByIndex] using h)) with
      ⟨first, hfirst⟩
    rcases nonempty_triangleBlockerLocalization_of_endpoint B 2
        (Or.inr (by
          simpa [SurplusCapPacket.triangleByIndex] using h)) with
      ⟨second, hsecond⟩
    exact ⟨⟨first, second, by
      rw [hfirst, hsecond]
      decide⟩⟩
  · rcases nonempty_triangleBlockerLocalization_of_endpoint B 0
        (Or.inr (by
          simpa [SurplusCapPacket.triangleByIndex] using h)) with
      ⟨first, hfirst⟩
    rcases nonempty_triangleBlockerLocalization_of_endpoint B 1
        (Or.inl (by
          simpa [SurplusCapPacket.triangleByIndex] using h)) with
      ⟨second, hsecond⟩
    exact ⟨⟨first, second, by
      rw [hfirst, hsecond]
      decide⟩⟩

private theorem nonempty_interiorBlockerLocalization
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : CriticalFiberBothOff R) (i : Fin 3)
    (hinterior : B.commonBlocker ∈ S.capInteriorByIndex i) :
    Nonempty (InteriorBlockerLocalization B) := by
  have hcenter : B.commonBlocker ∈ S.capByIndex i :=
    S.capInteriorByIndex_subset_capByIndex i hinterior
  have htwoCap : (B.commonSupport ∩ S.capByIndex i).card ≤ 2 :=
    commonSupport_inter_cap_card_le_two B i hcenter
  have htwoOutside : 2 ≤ (B.commonSupport \ S.capByIndex i).card := by
    have hsplit := Finset.card_sdiff_add_card_inter
      B.commonSupport (S.capByIndex i)
    have hfour := B.commonSupport_card
    omega
  have hrole :
      B.fiber.source₁.1 ∉ S.capByIndex i ∨
        B.fiber.source₂.1 ∉ S.capByIndex i ∨
        ((B.fiber.source₁.1 ∈ S.capByIndex i ∧
            B.fiber.source₂.1 ∈ S.capByIndex i) ∧
          B.commonSupport ∩ S.capByIndex i =
            ({B.fiber.source₁.1, B.fiber.source₂.1} : Finset ℝ²)) := by
    by_cases hsource₁ : B.fiber.source₁.1 ∈ S.capByIndex i
    · by_cases hsource₂ : B.fiber.source₂.1 ∈ S.capByIndex i
      · exact Or.inr (Or.inr ⟨⟨hsource₁, hsource₂⟩,
          commonSupport_inter_cap_eq_sources B i hcenter hsource₁ hsource₂⟩)
      · exact Or.inr (Or.inl hsource₂)
    · exact Or.inl hsource₁
  exact ⟨{
    capIndex := i
    commonBlocker_mem_capInterior := hinterior
    commonSupport_inter_cap_card_le_two := htwoCap
    two_le_commonSupport_outside_cap := htwoOutside
    collision_source_role := hrole
    source₁_off_firstApexClass := B.source₁_off_firstApexClass
    source₂_off_firstApexClass := B.source₂_off_firstApexClass }⟩

/-- Strongest checked full-cap/MEC localization of the both-off critical
fiber.  It retains both exact-radius failures and splits the common blocker
into the endpoint and strict-interior cap regimes. -/
theorem nonempty_criticalFiberBothOffCapOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : CriticalFiberBothOff R) :
    Nonempty (CriticalFiberBothOffCapOutcome B) := by
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem
      B.commonBlocker_mem_A with htriangle | ⟨i, hinterior⟩
  · exact ⟨CriticalFiberBothOffCapOutcome.triangleBlocker
      (nonempty_triangleBlockerLocalization B htriangle).some⟩
  · exact ⟨CriticalFiberBothOffCapOutcome.interiorBlocker
      (nonempty_interiorBlockerLocalization B i hinterior).some⟩

#print axioms CriticalFiberBothOff.source₁_firstApex_dist_ne_radius
#print axioms CriticalFiberBothOff.source₂_firstApex_dist_ne_radius
#print axioms nonempty_criticalFiberBothOffCapOutcome

end ATailCriticalFiberBothOffCapLocalizationScratch
end Problem97
