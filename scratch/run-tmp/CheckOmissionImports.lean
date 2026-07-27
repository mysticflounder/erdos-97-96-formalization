import Erdos9796Proof.P97.ATail.FrontierLiveClosure

#check Problem97.ATailCriticalPairFrontier.blocker_centers_ne_of_not_mem_other_selected_support
#check Problem97.ATailCriticalPairFrontier.selected_support_inter_card_le_two_of_not_mem_other_selected_support
#check Problem97.ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support
#check Problem97.ATailThirdCenterCommonPair.false_of_thirdActualCenter_selectedRow_contains_frontierPair
#check Problem97.ATailFrontierLiveClosure.false_of_retainedInteriorDirectedOmission_and_all_low_hits

namespace Problem97
namespace Scratch

open scoped EuclideanGeometry
open ATailCriticalPairFrontier

theorem left_omission_consequences
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {u v : ℝ²} (hu : u ∈ A) (hv : v ∈ A)
    (homit : v ∉ (H.selectedAt u hu).toCriticalFourShell.support) :
    H.centerAt u hu ≠ H.centerAt v hv ∧
      HasNEquidistantPointsAt 4 (A.erase v) (H.centerAt u hu) ∧
      (((H.selectedAt u hu).toCriticalFourShell.support ∩
        (H.selectedAt v hv).toCriticalFourShell.support).card ≤ 2) := by
  exact ⟨
    (blocker_centers_ne_of_not_mem_other_selected_support H hv hu homit).symm,
    (cross_deletion_survives_iff_not_mem_selected_support H hu).2 homit,
    by
      simpa [Finset.inter_comm] using
        selected_support_inter_card_le_two_of_not_mem_other_selected_support
          H hv hu homit⟩

theorem right_omission_consequences
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {u v : ℝ²} (hu : u ∈ A) (hv : v ∈ A)
    (homit : u ∉ (H.selectedAt v hv).toCriticalFourShell.support) :
    H.centerAt u hu ≠ H.centerAt v hv ∧
      HasNEquidistantPointsAt 4 (A.erase u) (H.centerAt v hv) ∧
      (((H.selectedAt u hu).toCriticalFourShell.support ∩
        (H.selectedAt v hv).toCriticalFourShell.support).card ≤ 2) := by
  exact ⟨
    blocker_centers_ne_of_not_mem_other_selected_support H hu hv homit,
    (cross_deletion_survives_iff_not_mem_selected_support H hv).2 homit,
    selected_support_inter_card_le_two_of_not_mem_other_selected_support
      H hu hv homit⟩

end Scratch
end Problem97
