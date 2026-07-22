/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalUniqueResidualDispatch
import Erdos9796Proof.P97.ATail.CriticalSystemRebase
import Erdos9796Proof.P97.ATail.SurvivalCover

/-!
# Late critical-system choice on the original exact-four frontier

The exact first-apex class in `OriginalUniqueFourResidual` is deletion-critical at the
first apex for every one of its four members.  Consequently the production
`CriticalShellSystem.overrideExactSelectedClass` operation may be applied after the
frontier has been selected.  This file records the resulting source-faithful normal
form and rebases the complete exact-four residual to it.

No finite named subset is treated as the whole carrier.  The pointwise fiber theorem
below quantifies over every source in the ambient carrier.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourLateChoiceTerminalScratch

open ATailCriticalPairFrontier
open ATailCriticalSystemRebase
open ATailDeletionRobustness
open ATailSurvivalCover
open ATailUniqueArmRouteAuditScratch

attribute [local instance] Classical.propDecidable

private theorem firstApex_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

/-- Choose the first apex as the actual blocker for every source in the exact
four-point first-apex radius class. -/
noncomputable def lateFirstApexSystem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    CriticalShellSystem D.A :=
  H.overrideExactSelectedClass (firstApex_mem_A S) (frontier_radius_pos F)
    R.class_card_eq_four R.every_class_member_blocks

/-- Rebase the geometric frontier to the late system without changing its retained pair
or either apex-deletion split. -/
noncomputable def lateFirstApexFrontier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    CriticalPairFrontier D S radius (lateFirstApexSystem R) :=
  rebaseCriticalPairFrontierSystem F (lateFirstApexSystem R)

/-- Every field of the exact-four residual is geometric or refers to the fixed first-apex
class, so it transports unchanged to the late critical system. -/
noncomputable def lateFirstApexResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    OriginalUniqueFourResidual (lateFirstApexFrontier R) where
  minimal := R.minimal
  noM44 := R.noM44
  carrier_card_gt_nine := R.carrier_card_gt_nine
  class_card_eq_four := R.class_card_eq_four
  unique_K4_radius := R.unique_K4_radius
  every_class_member_blocks := R.every_class_member_blocks
  interior_q := R.interior_q
  interior_w := R.interior_w
  interior_q_mem := R.interior_q_mem
  interior_w_mem := R.interior_w_mem
  interior_q_ne_w := R.interior_q_ne_w
  bisector_center_mem_interior := R.bisector_center_mem_interior

/-- The late system sends every member of the exact class to the first apex. -/
theorem lateFirstApexSystem_centerAt_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {source : ℝ²} (hsourceA : source ∈ D.A)
    (hsourceClass : source ∈ SelectedClass D.A S.oppApex1 radius) :
    (lateFirstApexSystem R).centerAt source hsourceA = S.oppApex1 := by
  exact H.overrideExactSelectedClass_centerAt
    (firstApex_mem_A S) (frontier_radius_pos F)
    R.class_card_eq_four R.every_class_member_blocks hsourceA hsourceClass

/-- For a source in the exact class, its complete selected critical support in the late
system is exactly that class, not merely an arbitrary selected four-subset. -/
theorem lateFirstApexSystem_support_eq_class
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {source : ℝ²} (hsourceA : source ∈ D.A)
    (hsourceClass : source ∈ SelectedClass D.A S.oppApex1 radius) :
    ((lateFirstApexSystem R).selectedAt source hsourceA).toCriticalFourShell.support =
      SelectedClass D.A S.oppApex1 radius := by
  let Hlate := lateFirstApexSystem R
  let K := (Hlate.selectedAt source hsourceA).toCriticalFourShell
  have hcenter : Hlate.centerAt source hsourceA = S.oppApex1 :=
    lateFirstApexSystem_centerAt_eq R hsourceA hsourceClass
  have hradius : K.radius = radius := by
    calc
      K.radius = dist (Hlate.centerAt source hsourceA) source :=
        (K.support_eq_radius source K.q_mem_support).symm
      _ = dist S.oppApex1 source := congrArg (fun center ↦ dist center source) hcenter
      _ = radius := (mem_selectedClass.mp hsourceClass).2
  ext z
  constructor
  · intro hz
    exact mem_selectedClass.mpr ⟨K.support_subset_A hz, by
      calc
        dist S.oppApex1 z = dist (Hlate.centerAt source hsourceA) z :=
          (congrArg (fun center ↦ dist center z) hcenter).symm
        _ = K.radius := K.support_eq_radius z hz
        _ = radius := hradius⟩
  · intro hz
    apply K.off_row_named_label_forbidden (mem_selectedClass.mp hz).1
    calc
      dist (Hlate.centerAt source hsourceA) z = dist S.oppApex1 z :=
        congrArg (fun center ↦ dist center z) hcenter
      _ = radius := (mem_selectedClass.mp hz).2
      _ = K.radius := hradius.symm

/-- The retained first frontier source lies in the exact first-apex class. -/
theorem frontier_pair_q_mem_firstApexClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} (F : CriticalPairFrontier D S radius H) :
    F.pair.q ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.q_mem_marginal with ⟨hqFilter, _⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
  exact mem_selectedClass.mpr ⟨hqA, by simpa only [dist_comm] using hqRadius⟩

/-- The retained second frontier source lies in the exact first-apex class. -/
theorem frontier_pair_w_mem_firstApexClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} (F : CriticalPairFrontier D S radius H) :
    F.pair.w ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.w_mem_marginal with ⟨hwFilter, _⟩
  rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwRadius⟩
  exact mem_selectedClass.mpr ⟨hwA, by simpa only [dist_comm] using hwRadius⟩

/-- On the retained frontier pair, the late choice is exactly a center stutter: both
blockers equal the first apex and both complete supports equal the same exact class. -/
theorem lateFirstApexSystem_frontierPair_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    (lateFirstApexSystem R).centerAt F.pair.q F.pair.q_mem_A = S.oppApex1 ∧
      (lateFirstApexSystem R).centerAt F.pair.w F.pair.w_mem_A = S.oppApex1 ∧
      ((lateFirstApexSystem R).selectedAt F.pair.q
          F.pair.q_mem_A).toCriticalFourShell.support =
        SelectedClass D.A S.oppApex1 radius ∧
      ((lateFirstApexSystem R).selectedAt F.pair.w
          F.pair.w_mem_A).toCriticalFourShell.support =
        SelectedClass D.A S.oppApex1 radius := by
  have hqClass := frontier_pair_q_mem_firstApexClass F
  have hwClass := frontier_pair_w_mem_firstApexClass F
  exact ⟨lateFirstApexSystem_centerAt_eq R F.pair.q_mem_A hqClass,
    lateFirstApexSystem_centerAt_eq R F.pair.w_mem_A hwClass,
    lateFirstApexSystem_support_eq_class R F.pair.q_mem_A hqClass,
    lateFirstApexSystem_support_eq_class R F.pair.w_mem_A hwClass⟩

/-- The favorable override has no hidden extra sources at the first apex: over the whole
ambient carrier, a source maps to the first apex exactly when it lies in the exact class. -/
theorem lateFirstApexSystem_centerAt_eq_iff_mem_class
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {source : ℝ²} (hsourceA : source ∈ D.A) :
    (lateFirstApexSystem R).centerAt source hsourceA = S.oppApex1 ↔
      source ∈ SelectedClass D.A S.oppApex1 radius := by
  constructor
  · intro hcenter
    let Hlate := lateFirstApexSystem R
    let K := (Hlate.selectedAt source hsourceA).toCriticalFourShell
    have hcenter' : Hlate.centerAt source hsourceA = S.oppApex1 := by
      simpa only [Hlate] using hcenter
    have hsupportSubset : K.support ⊆ SelectedClass D.A S.oppApex1 K.radius := by
      intro z hz
      apply mem_selectedClass.mpr
      refine ⟨K.support_subset_A hz, ?_⟩
      calc
        dist S.oppApex1 z = dist (Hlate.centerAt source hsourceA) z :=
          (congrArg (fun center ↦ dist center z) hcenter').symm
        _ = K.radius := K.support_eq_radius z hz
    have hfour : 4 ≤ (SelectedClass D.A S.oppApex1 K.radius).card := by
      calc
        4 = K.support.card := K.support_card.symm
        _ ≤ (SelectedClass D.A S.oppApex1 K.radius).card :=
          Finset.card_le_card hsupportSubset
    have hradius : K.radius = radius :=
      R.unique_K4_radius K.radius K.radius_pos hfour
    have hsource : source ∈ SelectedClass D.A S.oppApex1 K.radius := by
      exact hsupportSubset K.q_mem_support
    simpa only [hradius] using hsource
  · exact lateFirstApexSystem_centerAt_eq R hsourceA

/-- All exact-class sources have the same blocker after the late choice.  Thus saturation
creates source multiplicity but no distinct second center. -/
theorem lateFirstApexSystem_class_blockers_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {source₁ source₂ : ℝ²}
    (hsource₁A : source₁ ∈ D.A) (hsource₂A : source₂ ∈ D.A)
    (hsource₁Class : source₁ ∈ SelectedClass D.A S.oppApex1 radius)
    (hsource₂Class : source₂ ∈ SelectedClass D.A S.oppApex1 radius) :
    (lateFirstApexSystem R).centerAt source₁ hsource₁A =
      (lateFirstApexSystem R).centerAt source₂ hsource₂A := by
  exact (lateFirstApexSystem_centerAt_eq R hsource₁A hsource₁Class).trans
    (lateFirstApexSystem_centerAt_eq R hsource₂A hsource₂Class).symm

/-- Exact four has the opposite polarity from the common-deletion parent: the first apex
is not robust under all singleton deletions. -/
theorem firstApex_not_fullyDeletionRobustAt
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    ¬ FullyDeletionRobustAt D S.oppApex1 := by
  intro hrobust
  have hsourceClass :
      R.interior_q ∈ SelectedClass D.A S.oppApex1 radius :=
    (Finset.mem_inter.mp R.interior_q_mem).1
  exact R.every_class_member_blocks R.interior_q hsourceClass
    (hrobust.survives R.interior_q (mem_selectedClass.mp hsourceClass).1)

/-- Taking any exact-class source as an anchor, the points of its complete blocker fiber
are exactly the ambient exact first-apex class.  This quantifies over the whole carrier. -/
theorem lateFirstApex_actualBlockerFiber_points_eq_class
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {anchor : ℝ²} (hanchorClass : anchor ∈ SelectedClass D.A S.oppApex1 radius) :
    (actualBlockerFiber (lateFirstApexSystem R)
        ⟨anchor, (mem_selectedClass.mp hanchorClass).1⟩).image
      (fun source ↦ source.1) =
        SelectedClass D.A S.oppApex1 radius := by
  let Hlate := lateFirstApexSystem R
  let anchorVertex : CriticalShellSystem.CarrierVertex D.A :=
    ⟨anchor, (mem_selectedClass.mp hanchorClass).1⟩
  ext z
  constructor
  · intro hz
    rcases Finset.mem_image.mp hz with ⟨source, hsourceFiber, rfl⟩
    have hblockers := (Finset.mem_filter.mp hsourceFiber).2
    have hsourceCenter : Hlate.centerAt source.1 source.2 = S.oppApex1 := by
      calc
        Hlate.centerAt source.1 source.2 = Hlate.centerAt anchorVertex.1 anchorVertex.2 :=
          congrArg Subtype.val hblockers
        _ = S.oppApex1 :=
          lateFirstApexSystem_centerAt_eq R anchorVertex.2 hanchorClass
    exact (lateFirstApexSystem_centerAt_eq_iff_mem_class R source.2).mp hsourceCenter
  · intro hz
    let source : CriticalShellSystem.CarrierVertex D.A :=
      ⟨z, (mem_selectedClass.mp hz).1⟩
    apply Finset.mem_image.mpr
    refine ⟨source, ?_, rfl⟩
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_univ source, ?_⟩
    apply Subtype.ext
    exact (lateFirstApexSystem_centerAt_eq R source.2 hz).trans
      (lateFirstApexSystem_centerAt_eq R anchorVertex.2 hanchorClass).symm

/-- The exact blocker fiber therefore has cardinality four. -/
theorem lateFirstApex_actualBlockerFiber_card_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {anchor : ℝ²} (hanchorClass : anchor ∈ SelectedClass D.A S.oppApex1 radius) :
    (actualBlockerFiber (lateFirstApexSystem R)
      ⟨anchor, (mem_selectedClass.mp hanchorClass).1⟩).card = 4 := by
  let Hlate := lateFirstApexSystem R
  let anchorVertex : CriticalShellSystem.CarrierVertex D.A :=
    ⟨anchor, (mem_selectedClass.mp hanchorClass).1⟩
  let points : Finset ℝ² :=
    (actualBlockerFiber Hlate anchorVertex).image fun source ↦ source.1
  have hpoints : points = SelectedClass D.A S.oppApex1 radius := by
    simpa only [Hlate, anchorVertex, points] using
      lateFirstApex_actualBlockerFiber_points_eq_class R hanchorClass
  calc
    (actualBlockerFiber Hlate anchorVertex).card = points.card :=
      (Finset.card_image_of_injective _ Subtype.val_injective).symm
    _ = (SelectedClass D.A S.oppApex1 radius).card := congrArg Finset.card hpoints
    _ = 4 := R.class_card_eq_four

#print axioms lateFirstApexResidual
#print axioms lateFirstApexSystem_centerAt_eq
#print axioms lateFirstApexSystem_support_eq_class
#print axioms frontier_pair_q_mem_firstApexClass
#print axioms frontier_pair_w_mem_firstApexClass
#print axioms lateFirstApexSystem_frontierPair_normalForm
#print axioms lateFirstApexSystem_centerAt_eq_iff_mem_class
#print axioms lateFirstApexSystem_class_blockers_eq
#print axioms firstApex_not_fullyDeletionRobustAt
#print axioms lateFirstApex_actualBlockerFiber_points_eq_class
#print axioms lateFirstApex_actualBlockerFiber_card_eq_four

end ATailUniqueFourLateChoiceTerminalScratch
end Problem97
