import AlignedP5MirrorNativeClassifier

namespace Problem97.ATailAlignedP5MirrorNativeClassifierScratch

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem placementCheckForExtra_seven : placementCheckForExtra 7 = true := by
  native_decide

end Problem97.ATailAlignedP5MirrorNativeClassifierScratch
