/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.CapSelectedRowCounting
import Erdos9796Proof.P97.U1Depth5Prefix

/-!
# Actual critical rows and the same-cap outside-pair terminal

This scratch module isolates the exact positive packet that would let one of
the live critical rows consume the outside pair extracted from a common
critical shell.  It also records the resulting exclusion uniformly over all
sources of the retained `CriticalShellSystem`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSameCapBisectorProducerAudit

attribute [local instance] Classical.propDecidable

/-- A common critical shell projected to an indexed cap containing its
center, with two distinct support points outside the cap. -/
structure CriticalShellCapOutsidePair
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) : Type where
  commonSource : ℝ²
  commonSource_mem_A : commonSource ∈ D.A
  capIndex : Fin 3
  commonCenter_mem_cap :
    H.centerAt commonSource commonSource_mem_A ∈ S.capByIndex capIndex
  outside₁ : ℝ²
  outside₂ : ℝ²
  outside₁_ne_outside₂ : outside₁ ≠ outside₂
  outside₁_mem_commonSupport :
    outside₁ ∈
      (H.selectedAt commonSource commonSource_mem_A).toCriticalFourShell.support
  outside₂_mem_commonSupport :
    outside₂ ∈
      (H.selectedAt commonSource commonSource_mem_A).toCriticalFourShell.support
  outside₁_not_mem_cap : outside₁ ∉ S.capByIndex capIndex
  outside₂_not_mem_cap : outside₂ ∉ S.capByIndex capIndex

namespace CriticalShellCapOutsidePair

theorem outside₁_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (P : CriticalShellCapOutsidePair S H) :
    P.outside₁ ∈ D.A :=
  (H.selectedAt P.commonSource P.commonSource_mem_A).toCriticalFourShell.support_subset_A
    P.outside₁_mem_commonSupport

theorem outside₂_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (P : CriticalShellCapOutsidePair S H) :
    P.outside₂ ∈ D.A :=
  (H.selectedAt P.commonSource P.commonSource_mem_A).toCriticalFourShell.support_subset_A
    P.outside₂_mem_commonSupport

theorem commonCenter_equidistant
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (P : CriticalShellCapOutsidePair S H) :
    dist (H.centerAt P.commonSource P.commonSource_mem_A) P.outside₁ =
      dist (H.centerAt P.commonSource P.commonSource_mem_A) P.outside₂ :=
  (H.selectedAt P.commonSource P.commonSource_mem_A).toCriticalFourShell.support_eq_radius
    P.outside₁ P.outside₁_mem_commonSupport
  |>.trans
    ((H.selectedAt P.commonSource
        P.commonSource_mem_A).toCriticalFourShell.support_eq_radius
      P.outside₂ P.outside₂_mem_commonSupport).symm

/-- Minimal geometric terminal: a second distinct center in the same indexed
cap cannot bisect the extracted outside pair. -/
theorem false_of_secondCenter_sameCap_equidistant_outsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (P : CriticalShellCapOutsidePair S H)
    {secondCenter : ℝ²}
    (hsecondCap : secondCenter ∈ S.capByIndex P.capIndex)
    (hsecondNe :
      secondCenter ≠ H.centerAt P.commonSource P.commonSource_mem_A)
    (hsecondEq : dist secondCenter P.outside₁ = dist secondCenter P.outside₂) :
    False := by
  rcases S.capByIndex_cgn4g_capData D.convex P.capIndex with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcommonImage :
      H.centerAt P.commonSource P.commonSource_mem_A ∈
        Finset.univ.image L.points := by
    rw [hcap]
    exact P.commonCenter_mem_cap
  have hsecondImage :
      secondCenter ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hsecondCap
  rcases Finset.mem_image.mp hcommonImage with ⟨i, _hi, hiCommon⟩
  rcases Finset.mem_image.mp hsecondImage with ⟨j, _hj, hjSecond⟩
  have hij : i ≠ j := by
    intro hij
    apply hsecondNe
    calc
      secondCenter = L.points j := hjSecond.symm
      _ = L.points i := by rw [hij]
      _ = H.centerAt P.commonSource P.commonSource_mem_A := hiCommon
  have houtside₁Off : P.outside₁ ∉ Finset.univ.image L.points := by
    simpa [hcap] using P.outside₁_not_mem_cap
  have houtside₂Off : P.outside₂ ∉ Finset.univ.image L.points := by
    simpa [hcap] using P.outside₂_not_mem_cap
  rcases lt_or_gt_of_ne hij with hij | hji
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hij P.outside₁_mem_A P.outside₂_mem_A
      houtside₁Off houtside₂Off P.outside₁_ne_outside₂
      (by simpa [hiCommon] using P.commonCenter_equidistant)
      (by simpa [hjSecond] using hsecondEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hji P.outside₁_mem_A P.outside₂_mem_A
      houtside₁Off houtside₂Off P.outside₁_ne_outside₂
      (by simpa [hjSecond] using hsecondEq)
      (by simpa [hiCommon] using P.commonCenter_equidistant)

/-- A second actual critical-row center supplies the minimal equality terminal
as soon as both outside points occur in its exact support.  Center placement,
center distinctness, and the two support memberships are the exact missing
row-based producer packet. -/
theorem false_of_secondActualCenter_sameCap_contains_outsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (P : CriticalShellCapOutsidePair S H)
    {source : ℝ²} (hsource : source ∈ D.A)
    (hsecondCap : H.centerAt source hsource ∈ S.capByIndex P.capIndex)
    (hsecondNe :
      H.centerAt source hsource ≠
        H.centerAt P.commonSource P.commonSource_mem_A)
    (houtside₁ :
      P.outside₁ ∈ (H.selectedAt source hsource).toCriticalFourShell.support)
    (houtside₂ :
      P.outside₂ ∈ (H.selectedAt source hsource).toCriticalFourShell.support) :
    False := by
  apply P.false_of_secondCenter_sameCap_equidistant_outsidePair
    hsecondCap hsecondNe
  exact
    (H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
      P.outside₁ houtside₁
    |>.trans
      ((H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
        P.outside₂ houtside₂).symm

/-- Uniform exclusion over the full retained critical map.  In particular,
every one of the five live source rows and the extra `f2` row is an instance
of this theorem once its constructor-level provenance is retained. -/
theorem not_exists_actualCriticalRow_sameCap_contains_outsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (P : CriticalShellCapOutsidePair S H) :
    ¬ ∃ (source : ℝ²) (hsource : source ∈ D.A),
      H.centerAt source hsource ∈ S.capByIndex P.capIndex ∧
        H.centerAt source hsource ≠
          H.centerAt P.commonSource P.commonSource_mem_A ∧
        P.outside₁ ∈
          (H.selectedAt source hsource).toCriticalFourShell.support ∧
        P.outside₂ ∈
          (H.selectedAt source hsource).toCriticalFourShell.support := by
  rintro ⟨source, hsource, hcap, hne, houtside₁, houtside₂⟩
  exact P.false_of_secondActualCenter_sameCap_contains_outsidePair
    hsource hcap hne houtside₁ houtside₂

#print axioms false_of_secondCenter_sameCap_equidistant_outsidePair
#print axioms false_of_secondActualCenter_sameCap_contains_outsidePair
#print axioms not_exists_actualCriticalRow_sameCap_contains_outsidePair

end CriticalShellCapOutsidePair
end ATailSameCapBisectorProducerAudit
end Problem97
