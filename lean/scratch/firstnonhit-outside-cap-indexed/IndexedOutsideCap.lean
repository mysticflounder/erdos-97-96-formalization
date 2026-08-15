import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FreshThirdPinnedFanPacket

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

namespace IndexedSourceFaithfulSelectedFourFan

theorem scratch_exists_distinct_outsideCap_escape_or_crossDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row)
    (hcenterNe : ∀ j, center ≠ F.blockerCenter j)
    (i : Fin 3)
    (hcenterCap : center ∈ S.capByIndex i)
    (houtside : 2 ≤ (Row.support \ S.capByIndex i).card) :
    ∃ z w : CriticalShellSystem.CarrierVertex D.A,
      ∃ hz : z.1 ∈ Row.support \ S.capByIndex i,
        ∃ hw : w.1 ∈ Row.support \ S.capByIndex i,
          z ≠ w ∧
            SourceFaithfulSelectedFourDeletionPacket D S H Row z.1
              (Finset.mem_sdiff.mp hz).1 ∧
            SourceFaithfulSelectedFourDeletionPacket D S H Row w.1
              (Finset.mem_sdiff.mp hw).1 ∧
            (H.centerAt z.1 z.2 ∉ S.capByIndex i ∨
              H.centerAt w.1 w.2 ∉ S.capByIndex i ∨
              HasNEquidistantPointsAt 4 (D.A.erase w.1)
                (H.centerAt z.1 z.2) ∨
              HasNEquidistantPointsAt 4 (D.A.erase z.1)
                (H.centerAt w.1 w.2)) := by
  apply exists_distinct_outsideCap_fan_escape_or_crossDeletion
    Row i hcenterCap houtside F.sourceFaithful
  intro w hw
  let j : Fin 4 := F.index ⟨w, hw⟩
  have hsource : F.source j = ⟨w, Row.support_subset_A hw⟩ := by
    simpa [j] using F.source_index_support
      ⟨w, Row.support_subset_A hw⟩ hw
  simpa [blockerCenter, hsource] using hcenterNe j

end IndexedSourceFaithfulSelectedFourFan
end ATailFrontierLiveClosure
end Problem97
