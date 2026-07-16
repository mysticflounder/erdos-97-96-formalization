import LambdaKxFine.N122MergePart00

import LambdaKxFine.N065Zero

import LambdaKxFine.N066Zero

/-! Zero propagation for lambda Kx merge node 122. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode122Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hREFLECT_Y : Yy-2*Ky*(1-Kx)+2*L*(Zx-Kx) = 0)
    : lambdaKxFineNode122Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode65Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_Y
  have hright := lambdaKxFineNode66Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_Y
  rw [lambdaKxBucketMerge122Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode122Zero

#eval IO.println "lambda Kx fine node 122: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
