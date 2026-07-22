/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourLateChoiceTerminal
import UniqueFourGlobalDeletionCoupling
import Erdos9796Proof.P97.ATail.SurvivalCover

/-!
# Actual-center occurrence on the original exact-four arm

This module checks how much actual-center incidence follows before any finite
Kalmanson occurrence theorem is invoked.  The favorable late critical system
has an exact four-source fiber at the first apex.  Since every actual blocker
fiber has cardinality at most four and the carrier has at least ten points,
the sources outside that fiber already force two further distinct actual
blocker centers.

The resulting three rows are complete critical shells and each contains its
own source.  This is genuine multicenter occurrence, but it does not supply
the pairwise cross-row intersections required by the smallest checked
four-role Kalmanson consumer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourMulticenterOccurrenceScratch

open ATailSurvivalCover
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourGlobalCouplingScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- The exact-class anchor used for the late first-apex fiber. -/
noncomputable def exactClassAnchor
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    CriticalShellSystem.CarrierVertex D.A :=
  ⟨R.interior_q, (mem_selectedClass.mp (Finset.mem_inter.mp R.interior_q_mem).1).1⟩

/-- Sources not mapped to the first apex by the late critical system. -/
noncomputable def outsideFirstApexFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    Finset (CriticalShellSystem.CarrierVertex D.A) :=
  Finset.univ \ actualBlockerFiber (lateFirstApexSystem R) (exactClassAnchor R)

/-- At least six carrier sources lie outside the exact four-source first-apex
fiber. -/
theorem six_le_outsideFirstApexFiber_card
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    6 ≤ (outsideFirstApexFiber R).card := by
  have hanchorClass :
      (exactClassAnchor R).1 ∈ SelectedClass D.A S.oppApex1 radius := by
    exact (Finset.mem_inter.mp R.interior_q_mem).1
  have hfiber :
      (actualBlockerFiber (lateFirstApexSystem R) (exactClassAnchor R)).card = 4 := by
    exact lateFirstApex_actualBlockerFiber_card_eq_four R hanchorClass
  have huniv :
      (Finset.univ : Finset (CriticalShellSystem.CarrierVertex D.A)).card = D.A.card := by
    simp
  have hcard := R.carrier_card_gt_nine
  rw [outsideFirstApexFiber, Finset.card_sdiff_of_subset (Finset.subset_univ _),
    huniv, hfiber]
  omega

/-- The late first-apex system has two actual blocker centers, both different
from the first apex and from each other, on sources outside its exact
four-source first-apex fiber. -/
theorem exists_two_outside_sources_distinct_actualBlockers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    ∃ source₁ ∈ outsideFirstApexFiber R,
      ∃ source₂ ∈ outsideFirstApexFiber R,
        (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
          (lateFirstApexSystem R).centerAt source₂.1 source₂.2 := by
  exact exists_pair_distinct_actualBlockers_of_five_le_card
    (lateFirstApexSystem R) (outsideFirstApexFiber R)
    (le_trans (by omega) (six_le_outsideFirstApexFiber_card R))

/-- Three source-faithful actual centers occur: the first apex and two
distinct blocker centers outside its exact four-source fiber.  All three
displayed rows are complete critical shells, and the two outside rows carry
their mandatory source incidences.

The theorem deliberately states no cross-membership between these rows.
Those positive incidences are exactly what the checked Kalmanson consumers
still require. -/
theorem exists_three_actualCenters_with_exact_rows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    ∃ anchor source₁ source₂ : CriticalShellSystem.CarrierVertex D.A,
      (lateFirstApexSystem R).centerAt anchor.1 anchor.2 = S.oppApex1 ∧
      (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠ S.oppApex1 ∧
      (lateFirstApexSystem R).centerAt source₂.1 source₂.2 ≠ S.oppApex1 ∧
      (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
        (lateFirstApexSystem R).centerAt source₂.1 source₂.2 ∧
      (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ∈ D.A ∧
      (lateFirstApexSystem R).centerAt source₂.1 source₂.2 ∈ D.A ∧
      source₁.1 ∉ SelectedClass D.A S.oppApex1 radius ∧
      source₂.1 ∉ SelectedClass D.A S.oppApex1 radius ∧
      ((lateFirstApexSystem R).selectedAt anchor.1
          anchor.2).toCriticalFourShell.support =
        SelectedClass D.A S.oppApex1 radius ∧
      source₁.1 ∈ ((lateFirstApexSystem R).selectedAt source₁.1
        source₁.2).toCriticalFourShell.support ∧
      source₂.1 ∈ ((lateFirstApexSystem R).selectedAt source₂.1
        source₂.2).toCriticalFourShell.support := by
  let Hlate := lateFirstApexSystem R
  let anchor := exactClassAnchor R
  have hanchorClass : anchor.1 ∈ SelectedClass D.A S.oppApex1 radius := by
    exact (Finset.mem_inter.mp R.interior_q_mem).1
  rcases exists_two_outside_sources_distinct_actualBlockers R with
    ⟨source₁, hsource₁Outside, source₂, hsource₂Outside, hcenters⟩
  have hsource₁NotFiber :
      source₁ ∉ actualBlockerFiber Hlate anchor :=
    (Finset.mem_sdiff.mp hsource₁Outside).2
  have hsource₂NotFiber :
      source₂ ∉ actualBlockerFiber Hlate anchor :=
    (Finset.mem_sdiff.mp hsource₂Outside).2
  have hanchorCenter : Hlate.centerAt anchor.1 anchor.2 = S.oppApex1 :=
    lateFirstApexSystem_centerAt_eq R anchor.2 hanchorClass
  have hsource₁Ne : Hlate.centerAt source₁.1 source₁.2 ≠ S.oppApex1 := by
    intro hsource₁Center
    apply hsource₁NotFiber
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_univ source₁, Subtype.ext ?_⟩
    exact hsource₁Center.trans hanchorCenter.symm
  have hsource₂Ne : Hlate.centerAt source₂.1 source₂.2 ≠ S.oppApex1 := by
    intro hsource₂Center
    apply hsource₂NotFiber
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_univ source₂, Subtype.ext ?_⟩
    exact hsource₂Center.trans hanchorCenter.symm
  have hsource₁NotClass :
      source₁.1 ∉ SelectedClass D.A S.oppApex1 radius := by
    intro hsource₁Class
    exact hsource₁Ne
      (lateFirstApexSystem_centerAt_eq R source₁.2 hsource₁Class)
  have hsource₂NotClass :
      source₂.1 ∉ SelectedClass D.A S.oppApex1 radius := by
    intro hsource₂Class
    exact hsource₂Ne
      (lateFirstApexSystem_centerAt_eq R source₂.2 hsource₂Class)
  have hcenter₁A : Hlate.centerAt source₁.1 source₁.2 ∈ D.A :=
    (Finset.mem_erase.mp
      (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell.center_mem).2
  have hcenter₂A : Hlate.centerAt source₂.1 source₂.2 ∈ D.A :=
    (Finset.mem_erase.mp
      (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell.center_mem).2
  refine ⟨anchor, source₁, source₂, hanchorCenter,
    hsource₁Ne, hsource₂Ne, hcenters, hcenter₁A, hcenter₂A,
    hsource₁NotClass, hsource₂NotClass, ?_, ?_, ?_⟩
  · exact lateFirstApexSystem_support_eq_class R anchor.2 hanchorClass
  · exact (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell.q_mem_support
  · exact (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell.q_mem_support

/-- The collision and packed-core centers cannot themselves be promoted to
actual blocker centers: full singleton-deletion robustness excludes them
from every legal critical-shell system, not merely the system used to build
the frontier. -/
theorem robust_output_center_ne_every_actualBlocker
    {D : CounterexampleData} {center : ℝ²}
    (hrobust : FullyDeletionRobustAt D center) :
    ∀ (H' : CriticalShellSystem D.A) (source : ℝ²)
      (hsource : source ∈ D.A), H'.centerAt source hsource ≠ center := by
  intro H' source hsource
  exact hrobust.centerAt_ne H' source hsource

private theorem oppApex1_mem_triangle_verts
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.triangle.verts := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1, MoserTriangle.verts, hi]

private theorem overrideAt_selectedAt_support
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source center : ℝ²}
    (C : CriticalSelectedFourClass A source center)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A.erase source) center)
    (hsource : source ∈ A) :
    ((H.overrideAt C hblocked).selectedAt source
      hsource).toCriticalFourShell.support =
      C.toCriticalFourShell.support := by
  simp only [CriticalShellSystem.selectedAt, CriticalShellSystem.centerAt,
    CriticalShellSystem.overrideAt]
  rw [dif_pos rfl]

/-- The singleton-core output can be installed source-faithfully.  It gives
one actual critical row at the strict-cap center, and that center is genuinely
different from the first apex.  This is the strongest uniform actual-center
consequence of the singleton output before any cross-row incidence theorem is
used. -/
theorem singletonCore_installs_strictCap_actualCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {center : ℝ²} {k : Fin 3} {V : Finset ℝ²}
    (hcenterInterior : center ∈ S.capInteriorByIndex k)
    (hVsub : V ⊆ protectedDeletionSet R)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (D.A \ V) center)
    (K : ATAILStageOneMinimalDeletionCore.MinimalDeletionCore D.A V center)
    (hVcard : V.card = 1) :
    ∃ source : ℝ², source ∈ V ∧
      ∃ hsourceA : source ∈ D.A,
        ∃ C : CriticalSelectedFourClass D.A source center,
          ∃ blocks : ¬ HasNEquidistantPointsAt 4 (D.A.erase source) center,
            ∃ H' : CriticalShellSystem D.A,
              H' = (lateFirstApexSystem R).overrideAt C blocks ∧
              H'.centerAt source hsourceA = center ∧
              H'.centerAt source hsourceA ≠ S.oppApex1 ∧
              (H'.selectedAt source hsourceA).toCriticalFourShell.support =
                C.toCriticalFourShell.support ∧
              source ∈
                (H'.selectedAt source hsourceA).toCriticalFourShell.support := by
  classical
  rcases Finset.card_eq_one.mp hVcard with ⟨source, hVeq⟩
  have hsourceV : source ∈ V := by simp [hVeq]
  have hsourceProtected := hVsub hsourceV
  have hsourceA : source ∈ D.A := by
    rcases Finset.mem_union.mp hsourceProtected with hsourceClass | hsourceVerts
    · exact (mem_selectedClass.mp hsourceClass).1
    · exact S.triangle.verts_subset hsourceVerts
  let sourceVertex : {x : ℝ² // x ∈ V} := ⟨source, hsourceV⟩
  let C : CriticalSelectedFourClass D.A source center := K.shellAt sourceVertex
  have blocks :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase source) center := by
    rw [hVeq, Finset.sdiff_singleton_eq_erase] at hblocked
    exact hblocked
  let H' : CriticalShellSystem D.A :=
    (lateFirstApexSystem R).overrideAt C blocks
  have hcenter : H'.centerAt source hsourceA = center := by
    simpa [H'] using
      (lateFirstApexSystem R).overrideAt_centerAt C blocks hsourceA
  have hcenterNeApex : center ≠ S.oppApex1 := by
    intro hEq
    exact S.capInteriorByIndex_not_mem_triangle_verts hcenterInterior
      (hEq ▸ oppApex1_mem_triangle_verts S)
  have hsupport :
      (H'.selectedAt source hsourceA).toCriticalFourShell.support =
        C.toCriticalFourShell.support := by
    simpa [H'] using
      overrideAt_selectedAt_support (lateFirstApexSystem R) C blocks hsourceA
  refine ⟨source, hsourceV, hsourceA, C, blocks, H', rfl,
    hcenter, hcenter.trans_ne hcenterNeApex, hsupport, ?_⟩
  rw [hsupport]
  exact C.toCriticalFourShell.q_mem_support

#print axioms six_le_outsideFirstApexFiber_card
#print axioms exists_two_outside_sources_distinct_actualBlockers
#print axioms exists_three_actualCenters_with_exact_rows
#print axioms robust_output_center_ne_every_actualBlocker
#print axioms singletonCore_installs_strictCap_actualCenter

end ATailUniqueFourMulticenterOccurrenceScratch
end Problem97
