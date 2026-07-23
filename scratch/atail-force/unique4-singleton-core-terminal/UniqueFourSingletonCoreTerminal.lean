/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourClassCapDistribution
import UniqueFourMulticenterOccurrence

/-!
# Outside-pair ingress from the exact-four singleton core

The singleton output of the source-faithful global-deletion split installs one
complete critical four-shell at a strict physical cap center.  A selected row
centered in a cap contains at most two points of that cap, so this installed
row contains two distinct carrier points outside the cap.

This is the terminal-grade part of the singleton output.  A second distinct
actual blocker center in the same cap whose row contains the extracted pair
is immediately impossible by ordered-cap uniqueness.  The source split does
not presently produce that repeated-row occurrence.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourSingletonCoreTerminalScratch

open ATAILStageOneMinimalDeletionCore
open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourGlobalCouplingScratch
open ATailUniqueFourLateChoiceTerminalScratch
open ATailUniqueFourMulticenterOccurrenceScratch

attribute [local instance] Classical.propDecidable

/-- Full source provenance for the singleton output, strengthened by a named
outside pair in its installed actual critical row. -/
structure SingletonCoreOutsidePairIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (Q : ExactTwoStrictHitDistribution R) : Type where
  center : ℝ²
  center_mem_A : center ∈ D.A
  capIndex : Fin 3
  center_mem_capInterior : center ∈ S.capInteriorByIndex capIndex
  deleted : Finset ℝ²
  deleted_nonempty : deleted.Nonempty
  deleted_subset_protected : deleted ⊆ protectedDeletionSet R
  deletion_blocked :
    ¬ HasNEquidistantPointsAt 4 (D.A \ deleted) center
  deletion_minimal : ∀ source ∈ deleted,
    HasNEquidistantPointsAt 4 (D.A \ (deleted.erase source)) center
  core : MinimalDeletionCore D.A deleted center
  deleted_card_eq_one : deleted.card = 1
  source : ℝ²
  source_mem_deleted : source ∈ deleted
  source_mem_A : source ∈ D.A
  source_mem_protected : source ∈ protectedDeletionSet R
  shell : CriticalSelectedFourClass D.A source center
  blocks :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase source) center
  installedSystem : CriticalShellSystem D.A
  installedSystem_eq :
    installedSystem = (lateFirstApexSystem R).overrideAt shell blocks
  installed_centerAt :
    installedSystem.centerAt source source_mem_A = center
  installed_support_eq_shell :
    (installedSystem.selectedAt source source_mem_A).toCriticalFourShell.support =
      shell.toCriticalFourShell.support
  outside₁ : ℝ²
  outside₂ : ℝ²
  outside_ne : outside₁ ≠ outside₂
  outside₁_mem_A : outside₁ ∈ D.A
  outside₂_mem_A : outside₂ ∈ D.A
  outside₁_not_mem_cap : outside₁ ∉ S.capByIndex capIndex
  outside₂_not_mem_cap : outside₂ ∉ S.capByIndex capIndex
  outside₁_mem_installedRow :
    outside₁ ∈
      (installedSystem.selectedAt source source_mem_A).toCriticalFourShell.support
  outside₂_mem_installedRow :
    outside₂ ∈
      (installedSystem.selectedAt source source_mem_A).toCriticalFourShell.support
  center_equidistant_outsidePair :
    dist center outside₁ = dist center outside₂

namespace SingletonCoreOutsidePairIngress

/-- The singleton source is still one of the protected original roles: it is
either in the exact first-apex class or is a physical Moser vertex. -/
theorem source_mem_firstClass_or_triangle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {Q : ExactTwoStrictHitDistribution R}
    (P : SingletonCoreOutsidePairIngress R Q) :
    P.source ∈ SelectedClass D.A S.oppApex1 radius ∨
      P.source ∈ S.triangle.verts := by
  exact Finset.mem_union.mp P.source_mem_protected

/-- Complete-radius lock at the installed singleton center.  Every selected
K4 row there has exactly the singleton shell's support; choosing another
four-subset cannot create extra placement flexibility on this arm. -/
theorem selectedRow_support_eq_shell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {Q : ExactTwoStrictHitDistribution R}
    (P : SingletonCoreOutsidePairIngress R Q)
    (K : SelectedFourClass D.A
      (P.installedSystem.centerAt P.source P.source_mem_A)) :
    K.support = P.shell.toCriticalFourShell.support := by
  exact
    (P.installedSystem.selectedFourClass_support_eq_shell
      P.source P.source_mem_A K).trans P.installed_support_eq_shell

end SingletonCoreOutsidePairIngress

/-- A singleton minimal-deletion core at a strict cap center contains a named
outside pair in its installed complete critical row. -/
theorem nonempty_singletonCoreOutsidePairIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (Q : ExactTwoStrictHitDistribution R)
    {center : ℝ²} {k : Fin 3} {V : Finset ℝ²}
    (hcenterA : center ∈ D.A)
    (hcenterInterior : center ∈ S.capInteriorByIndex k)
    (hVne : V.Nonempty)
    (hVsub : V ⊆ protectedDeletionSet R)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (D.A \ V) center)
    (hminimal : ∀ source ∈ V,
      HasNEquidistantPointsAt 4 (D.A \ (V.erase source)) center)
    (K : MinimalDeletionCore D.A V center)
    (hVcard : V.card = 1) :
    Nonempty (SingletonCoreOutsidePairIngress R Q) := by
  classical
  rcases singletonCore_installs_strictCap_actualCenter R hcenterInterior
      hVsub hblocked K hVcard with
    ⟨source, hsourceV, hsourceA, C, blocks, H', hH', hcenter,
      _hcenterNe, hsupport, _hsourceSupport⟩
  let row : SelectedFourClass D.A center := C.toSelectedFourClass
  have hcenterCap : center ∈ S.capByIndex k :=
    S.capInteriorByIndex_subset_capByIndex k hcenterInterior
  have hinter :
      (row.support ∩ S.capByIndex k).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex k row hcenterCap
  have hsplit :=
    Finset.card_inter_add_card_sdiff row.support (S.capByIndex k)
  have hrowCard : row.support.card = 4 := by
    exact C.toCriticalFourShell.support_card
  have houtsideTwo : 2 ≤ (row.support \ S.capByIndex k).card := by
    omega
  have houtsideOne : 1 < (row.support \ S.capByIndex k).card := by
    omega
  rcases Finset.one_lt_card.mp houtsideOne with
    ⟨outside₁, houtside₁, outside₂, houtside₂, houtsideNe⟩
  have houtside₁Support : outside₁ ∈ C.toCriticalFourShell.support :=
    (Finset.mem_sdiff.mp houtside₁).1
  have houtside₂Support : outside₂ ∈ C.toCriticalFourShell.support :=
    (Finset.mem_sdiff.mp houtside₂).1
  have houtside₁Installed :
      outside₁ ∈ (H'.selectedAt source hsourceA).toCriticalFourShell.support := by
    rw [hsupport]
    exact houtside₁Support
  have houtside₂Installed :
      outside₂ ∈ (H'.selectedAt source hsourceA).toCriticalFourShell.support := by
    rw [hsupport]
    exact houtside₂Support
  exact ⟨{
    center := center
    center_mem_A := hcenterA
    capIndex := k
    center_mem_capInterior := hcenterInterior
    deleted := V
    deleted_nonempty := hVne
    deleted_subset_protected := hVsub
    deletion_blocked := hblocked
    deletion_minimal := hminimal
    core := K
    deleted_card_eq_one := hVcard
    source := source
    source_mem_deleted := hsourceV
    source_mem_A := hsourceA
    source_mem_protected := hVsub hsourceV
    shell := C
    blocks := blocks
    installedSystem := H'
    installedSystem_eq := hH'
    installed_centerAt := hcenter
    installed_support_eq_shell := hsupport
    outside₁ := outside₁
    outside₂ := outside₂
    outside_ne := houtsideNe
    outside₁_mem_A := C.toCriticalFourShell.support_subset_A houtside₁Support
    outside₂_mem_A := C.toCriticalFourShell.support_subset_A houtside₂Support
    outside₁_not_mem_cap := (Finset.mem_sdiff.mp houtside₁).2
    outside₂_not_mem_cap := (Finset.mem_sdiff.mp houtside₂).2
    outside₁_mem_installedRow := houtside₁Installed
    outside₂_mem_installedRow := houtside₂Installed
    center_equidistant_outsidePair :=
      (C.toCriticalFourShell.support_eq_radius outside₁
        houtside₁Support).trans
        (C.toCriticalFourShell.support_eq_radius outside₂
          houtside₂Support).symm }⟩

/-- The exact occurrence still needed on the singleton arm: a distinct
actual blocker center in the same physical cap repeats the extracted outside
pair. -/
def HasSameCapActualRowRepeat
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {Q : ExactTwoStrictHitDistribution R}
    (P : SingletonCoreOutsidePairIngress R Q) : Prop :=
  ∃ source : ℝ², ∃ hsource : source ∈ D.A,
    P.installedSystem.centerAt source hsource ∈
        S.capByIndex P.capIndex ∧
      P.installedSystem.centerAt source hsource ≠ P.center ∧
      P.outside₁ ∈
        (P.installedSystem.selectedAt source hsource).toCriticalFourShell.support ∧
      P.outside₂ ∈
        (P.installedSystem.selectedAt source hsource).toCriticalFourShell.support

/-- A same-cap actual-row repeat of the singleton outside pair is impossible
by the existing ordered-cap uniqueness theorem. -/
theorem false_of_hasSameCapActualRowRepeat
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {Q : ExactTwoStrictHitDistribution R}
    (P : SingletonCoreOutsidePairIngress R Q)
    (hrepeat : HasSameCapActualRowRepeat P) : False := by
  rcases hrepeat with
    ⟨source, hsourceA, hsecondCap, hsecondNe, houtside₁, houtside₂⟩
  rcases S.capByIndex_cgn4g_capData D.convex P.capIndex with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcenterCap : P.center ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex P.capIndex
      P.center_mem_capInterior
  have hsecondImage :
      P.installedSystem.centerAt source hsourceA ∈
        Finset.univ.image L.points := by
    rw [hcap]
    exact hsecondCap
  rcases Finset.mem_image.mp hcenterCap with ⟨i, _hi, hiCenter⟩
  rcases Finset.mem_image.mp hsecondImage with ⟨j, _hj, hjSecond⟩
  have hij : i ≠ j := by
    intro hij
    apply hsecondNe
    calc
      P.installedSystem.centerAt source hsourceA = L.points j := hjSecond.symm
      _ = L.points i := by rw [hij]
      _ = P.center := hiCenter
  have houtside₁Outside : P.outside₁ ∉ Finset.univ.image L.points := by
    simpa [hcap] using P.outside₁_not_mem_cap
  have houtside₂Outside : P.outside₂ ∉ Finset.univ.image L.points := by
    simpa [hcap] using P.outside₂_not_mem_cap
  have hsecondEq :
      dist (P.installedSystem.centerAt source hsourceA) P.outside₁ =
        dist (P.installedSystem.centerAt source hsourceA) P.outside₂ :=
    ((P.installedSystem.selectedAt source hsourceA).toCriticalFourShell.support_eq_radius
      P.outside₁ houtside₁).trans
      ((P.installedSystem.selectedAt source
        hsourceA).toCriticalFourShell.support_eq_radius
          P.outside₂ houtside₂).symm
  rcases lt_or_gt_of_ne hij with hij | hji
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hij P.outside₁_mem_A P.outside₂_mem_A
      houtside₁Outside houtside₂Outside P.outside_ne
      (by rw [hiCenter]; exact P.center_equidistant_outsidePair)
      (by rw [hjSecond]; exact hsecondEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hji P.outside₁_mem_A P.outside₂_mem_A
      houtside₁Outside houtside₂Outside P.outside_ne
      (by rw [hjSecond]; exact hsecondEq)
      (by rw [hiCenter]; exact P.center_equidistant_outsidePair)

#print axioms nonempty_singletonCoreOutsidePairIngress
#print axioms SingletonCoreOutsidePairIngress.selectedRow_support_eq_shell
#print axioms false_of_hasSameCapActualRowRepeat

end ATailUniqueFourSingletonCoreTerminalScratch
end Problem97
