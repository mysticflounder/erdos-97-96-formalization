/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.OrientedPhysicalApexIngress
import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover
import Erdos9796Proof.P97.Dumitrescu.L1
import Erdos9796Proof.P97.ATail.RetainedStrictInteriorPairSelector
import Erdos9796Proof.P97.ATail.LocalizedCollisionMutualOmissionCycle

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailLocalizedCollisionMutualOmissionCycle
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

/-- The perpendicular-bisector blocker rigidity argument only needs the two
sources to share some first-apex radius; that radius need not be the frontier
radius indexing `R`. -/
theorem blocker_centers_eq_of_secondRadius_mutual_cross_membership
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {frontierRadius commonRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S frontierRadius H}
    (R : FrontierCommonDeletionParentResidual F)
    {x y : ℝ²}
    (hxA : x ∈ D.A) (hyA : y ∈ D.A) (hxy : x ≠ y)
    (hxRadius : x ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hyRadius : y ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hyx : y ∈ (H.selectedAt x hxA).toCriticalFourShell.support)
    (hxy' : x ∈ (H.selectedAt y hyA).toCriticalFourShell.support) :
    H.centerAt x hxA = H.centerAt y hyA := by
  classical
  let cx := H.centerAt x hxA
  let cy := H.centerAt y hyA
  let o := S.oppApex1
  have hoA : o ∈ D.A := by
    simpa [o] using R.common.packet.center₁_mem_A
  have hcxA : cx ∈ D.A := by
    simpa [cx, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨x, hxA⟩).2
  have hcyA : cy ∈ D.A := by
    simpa [cy, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨y, hyA⟩).2
  have hcx_ne_o : cx ≠ o := by
    simpa [cx, o] using R.actualBlocker_ne_firstApex x hxA
  have hcy_ne_o : cy ≠ o := by
    simpa [cy, o] using R.actualBlocker_ne_firstApex y hyA
  by_contra hcxcy
  have hoEq : dist o x = dist o y :=
    (mem_selectedClass.mp hxRadius).2.trans
      (mem_selectedClass.mp hyRadius).2.symm
  have hcxEq : dist cx x = dist cx y := by
    exact
      (H.selectedAt x hxA).toCriticalFourShell.support_eq_radius
        x (H.selectedAt x hxA).toCriticalFourShell.q_mem_support
      |>.trans
        ((H.selectedAt x hxA).toCriticalFourShell.support_eq_radius y hyx).symm
  have hcyEq : dist cy x = dist cy y := by
    exact
      (H.selectedAt y hyA).toCriticalFourShell.support_eq_radius x hxy'
      |>.trans
        ((H.selectedAt y hyA).toCriticalFourShell.support_eq_radius
          y (H.selectedAt y hyA).toCriticalFourShell.q_mem_support).symm
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex hxA hyA hxy
  have hoFilter :
      o ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hoA, hoEq⟩
  have hcxFilter :
      cx ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hcxA, hcxEq⟩
  have hcyFilter :
      cy ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hcyA, hcyEq⟩
  have hthree :
      2 < (D.A.filter (fun z => dist z x = dist z y)).card := by
    rw [Finset.two_lt_card]
    exact ⟨o, hoFilter, cx, hcxFilter, cy, hcyFilter,
      hcx_ne_o.symm, hcy_ne_o.symm, hcxcy⟩
  omega

/-- A strict first-cap point on a radius distinct from the retained frontier
radius cannot lie in the localized collision shell.  Indeed, that shell has
only the two collision sources in the whole first cap, and both sources lie on
the retained frontier radius. -/
theorem secondRadiusInterior_disjoint_collisionShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (hρne : ρ ≠ radius) :
    (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1) =
      ∅ := by
  classical
  ext z
  constructor
  · intro hz
    exfalso
    rcases Finset.mem_inter.mp hz with ⟨hzShell, hzρInterior⟩
    rcases Finset.mem_inter.mp hzρInterior with ⟨hzρ, hzInterior⟩
    have hzPair : z ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by
      rw [← P.shell_inter_cap_eq_sources]
      exact Finset.mem_inter.mpr
        ⟨hzShell,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hzInterior⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair
    rcases hzPair with rfl | rfl
    · apply hρne
      exact (mem_selectedClass.mp hzρ).2.symm.trans
        (mem_selectedClass.mp P.source₁_mem_radius).2
    · apply hρne
      exact (mem_selectedClass.mp hzρ).2.symm.trans
        (mem_selectedClass.mp P.source₂_mem_radius).2
  · simp

/-- Every strict first-cap point on the distinct second radius has an actual
blocker different from the localized collision blocker. -/
theorem secondRadiusInterior_blocker_ne_collisionBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (hρne : ρ ≠ radius)
    {z : ℝ²} (hzA : z ∈ D.A)
    (hzρInterior :
      z ∈ SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1) :
    H.centerAt z hzA ≠
      H.centerAt P.source₁ P.source₁_mem_A := by
  intro hcenters
  have hsupportEq :
      (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support =
        (H.selectedAt z hzA).toCriticalFourShell.support := by
    rw [← uniqueFourClass_centerAt_eq_selectedAt_support H
          P.source₁ P.source₁_mem_A,
      ← uniqueFourClass_centerAt_eq_selectedAt_support H z hzA,
      hcenters]
  have hzBoth :
      z ∈
        (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex1 ρ ∩
            S.capInteriorByIndex S.oppIndex1) := by
    exact Finset.mem_inter.mpr
      ⟨hsupportEq.symm ▸
          (H.selectedAt z hzA).toCriticalFourShell.q_mem_support,
        hzρInterior⟩
  rw [secondRadiusInterior_disjoint_collisionShell P hρne] at hzBoth
  simp at hzBoth

/-- Every strict first-cap point on the distinct second radius can replace the
fresh point in a localized common-deletion packet and hence seed a
source-exact mutual-omission cycle. -/
theorem exists_secondRadiusInterior_localizedCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (hρne : ρ ≠ radius)
    {z : ℝ²}
    (hzρInterior :
      z ∈ SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1) :
    ∃ L : LocalizedCollisionCommonDeletion P,
      L.fresh = z ∧
        Nonempty (LocalizedCollisionMutualOmissionCycle P L) := by
  have hzA : z ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hzρInterior).1).1
  have hzNotShell :
      z ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support := by
    intro hzShell
    have hzBoth :
        z ∈
          (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support ∩
            (SelectedClass D.A S.oppApex1 ρ ∩
              S.capInteriorByIndex S.oppIndex1) :=
      Finset.mem_inter.mpr ⟨hzShell, hzρInterior⟩
    rw [secondRadiusInterior_disjoint_collisionShell P hρne] at hzBoth
    simp at hzBoth
  have hzNeSource₁ : z ≠ P.source₁ := by
    intro h
    apply hzNotShell
    rw [h]
    exact
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.q_mem_support
  have hzNeSource₂ : z ≠ P.source₂ := by
    intro h
    apply hzNotShell
    rw [h]
    exact P.source₂_mem_source₁_shell
  have hsurvivesBlocker :
      HasNEquidistantPointsAt 4 (D.A.erase z)
        (H.centerAt P.source₁ P.source₁_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H P.source₁_mem_A).mpr hzNotShell
  have hsurvivesFirst :
      HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex1 :=
    R.firstApexFullyDeletionRobust.survives z hzA
  have hblockerA :
      H.centerAt P.source₁ P.source₁_mem_A ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩).2
  rcases ATailCommonDeletionTwoCenter.nonempty_commonDeletionTwoCenterPacket H
      hzA R.common.packet.center₁_mem_A hblockerA
      (R.actualBlocker_ne_firstApex
        P.source₁ P.source₁_mem_A).symm
      hsurvivesFirst hsurvivesBlocker with ⟨packet⟩
  let L : LocalizedCollisionCommonDeletion P := {
    fresh := z
    fresh_mem_capInterior := (Finset.mem_inter.mp hzρInterior).2
    fresh_ne_source₁ := hzNeSource₁
    fresh_ne_source₂ := hzNeSource₂
    fresh_not_mem_shell := hzNotShell
    packet := packet }
  refine ⟨L, rfl, ?_⟩
  exact nonempty_localizedCollisionMutualOmissionCycle P L

end ATailFrontierLiveClosure
end Problem97
