import AlignedP5NativeLeaf1
import AlignedP5NativeLeaf2
import AlignedP5NativeLeaf3
import AlignedP5NativeLeaf4
import AlignedP5NativeLeaf8
import AlignedP5NativeLeaf9
import AlignedP5NativeLeaf10

namespace Problem97.ATailAlignedP5NativeClassifierScratch

theorem placementCheck_eq_true : placementCheck = true := by
  simp [placementCheck, alignedExtraPoints, placementCheckForExtra_one,
    placementCheckForExtra_two, placementCheckForExtra_three,
    placementCheckForExtra_four, placementCheckForExtra_eight,
    placementCheckForExtra_nine, placementCheckForExtra_ten]

end Problem97.ATailAlignedP5NativeClassifierScratch
