import AlignedP5NativeClassifier

namespace Problem97.ATailAlignedP5NativeClassifierScratch

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem placementCheckForExtra_four : placementCheckForExtra 4 = true := by
  native_decide

end Problem97.ATailAlignedP5NativeClassifierScratch
