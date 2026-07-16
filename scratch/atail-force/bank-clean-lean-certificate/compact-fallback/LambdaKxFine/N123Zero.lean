import LambdaKxFine.N123MergePart00

import LambdaKxFine.N067Zero

import LambdaKxFine.N068Zero

/-! Zero propagation for lambda Kx merge node 123. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode123Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hREFLECT_Y : Yy-2*Ky*(1-Kx)+2*L*(Zx-Kx) = 0)
    : lambdaKxFineNode123Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode67Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_Y
  have hright := lambdaKxFineNode68Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_Y
  rw [lambdaKxBucketMerge123Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode123Zero

#eval IO.println "lambda Kx fine node 123: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
