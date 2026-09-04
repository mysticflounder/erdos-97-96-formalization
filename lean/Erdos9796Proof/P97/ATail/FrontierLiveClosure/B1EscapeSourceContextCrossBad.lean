/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1WinningSliceOrderOutcome

/-!
# B1 source-context cross-bad narrowing

When the two named live sources are strict second-cap-interior, the live split
either supplies a source context directly or leaves one asymmetric source in
the first-apex class.  If that outside source fails both retained deletions,
the failure is recorded in the existing interior-pair-bad finite set.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailSurvivalCover
open ATailUniqueFourLateChoiceTerminalScratch
open ATailTwoRadiusGridEscapeSynchronization
open Census554.CapSelectedGeometry
open Census554.GeneralCarrierBridge

/-- The live strict-interior split is source-faithful: its outside arm enters
    the normal-form source adapter, while an asymmetric arm either does the
    same or records the outside source as interior-pair bad. -/
theorem b1_escapeSourceContext_or_liveFirstApexCrossBad
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (huInterior : C.u.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hvInterior : C.v.1 ∈ S.capInteriorByIndex S.oppIndex2) :
    Nonempty (B1EscapeSourceContext C) ∨
      (C.u ∈ interiorPairBadOutsideSources C.R ∧
        C.v.1 ∈ SelectedClass D.A S.oppApex1 radius) ∨
      (C.u.1 ∈ SelectedClass D.A S.oppApex1 radius ∧
        C.v ∈ interiorPairBadOutsideSources C.R) := by
  classical
  rcases b1_live_both_interior_outside_or_firstApexClass_split
      C.R C.surface C.rho C.u C.v C.huNeV C.huClass C.hvClass
      huInterior hvInterior with hboth | huCross | hvCross
  · rcases hboth with ⟨huOutside, hvOutside, hsurvives⟩
    rcases hsurvives with huq | huw | hvq | hvw
    · exact Or.inl (b1EscapeSourceContext_of_normalForm_sourceData C hnormal
        C.u C.huClass huInterior C.first.deleted_ne_u.symm
        C.second.deleted_ne_u.symm huOutside (Or.inl huq))
    · exact Or.inl (b1EscapeSourceContext_of_normalForm_sourceData C hnormal
        C.u C.huClass huInterior C.first.deleted_ne_u.symm
        C.second.deleted_ne_u.symm huOutside (Or.inr huw))
    · exact Or.inl (b1EscapeSourceContext_of_normalForm_sourceData C hnormal
        C.v C.hvClass hvInterior C.first.deleted_ne_v.symm
        C.second.deleted_ne_v.symm hvOutside (Or.inl hvq))
    · exact Or.inl (b1EscapeSourceContext_of_normalForm_sourceData C hnormal
        C.v C.hvClass hvInterior C.first.deleted_ne_v.symm
        C.second.deleted_ne_v.symm hvOutside (Or.inr hvw))
  · rcases huCross with ⟨huOutside, hvFirst⟩
    by_cases huq :
        HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_q)
          ((lateFirstApexSystem C.R).centerAt C.u.1 C.u.2)
    · exact Or.inl (b1EscapeSourceContext_of_normalForm_sourceData C hnormal
        C.u C.huClass huInterior C.first.deleted_ne_u.symm
        C.second.deleted_ne_u.symm huOutside (Or.inl huq))
    by_cases huw :
        HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_w)
          ((lateFirstApexSystem C.R).centerAt C.u.1 C.u.2)
    · exact Or.inl (b1EscapeSourceContext_of_normalForm_sourceData C hnormal
        C.u C.huClass huInterior C.first.deleted_ne_u.symm
        C.second.deleted_ne_u.symm huOutside (Or.inr huw))
    refine Or.inr (Or.inl ⟨?_, hvFirst⟩)
    refine Finset.mem_filter.mpr ⟨huOutside, ?_⟩
    exact ⟨(by intro hq; exact huq hq), (by intro hw; exact huw hw)⟩
  · rcases hvCross with ⟨huFirst, hvOutside⟩
    by_cases hvq :
        HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_q)
          ((lateFirstApexSystem C.R).centerAt C.v.1 C.v.2)
    · exact Or.inl (b1EscapeSourceContext_of_normalForm_sourceData C hnormal
        C.v C.hvClass hvInterior C.first.deleted_ne_v.symm
        C.second.deleted_ne_v.symm hvOutside (Or.inl hvq))
    by_cases hvw :
        HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_w)
          ((lateFirstApexSystem C.R).centerAt C.v.1 C.v.2)
    · exact Or.inl (b1EscapeSourceContext_of_normalForm_sourceData C hnormal
        C.v C.hvClass hvInterior C.first.deleted_ne_v.symm
        C.second.deleted_ne_v.symm hvOutside (Or.inr hvw))
    refine Or.inr (Or.inr ⟨huFirst, ?_⟩)
    refine Finset.mem_filter.mpr ⟨hvOutside, ?_⟩
    exact ⟨(by intro hq; exact hvq hq), (by intro hw; exact hvw hw)⟩

#print axioms b1_escapeSourceContext_or_liveFirstApexCrossBad

end ATailFrontierLiveClosure
end Problem97
